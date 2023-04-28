using DocumentFormat.OpenXml.Drawing.Spreadsheet;
using DocumentFormat.OpenXml.EMMA;
using DocumentFormat.OpenXml.Wordprocessing;
using Jade_Dragon.Models;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Windows.Interop;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Threading.Tasks;

namespace Jade_Dragon.Hubs
{
    [HubName("chat")]
    public class DemoChat : Hub
    {
        private Connect db = new Connect();
        public void Message(int roomId, long makh, string message, bool loai)
        {
            // Thêm mới tin nhắn chat vào CSDL
            if(loai == false)
            {
                var newtn = new tinnhan();
                {
                    newtn.MaPhongChat = roomId;
                    newtn.MaKh = makh;
                    newtn.NoiDungTinNhanClient = message;
                    newtn.NgayGui = DateTime.Now;
                }
                db.tinnhans.Add(newtn);
                db.SaveChanges();

                PhongChat phchat = db.PhongChats.Find(roomId);
                khachhang kh = db.khachhangs.Find(makh);
                string name = kh.HoTen;
                string tenphong = phchat.TenPhongChat;
                DateTime timenow = DateTime.Now;
                tinnhan tn = db.tinnhans.FirstOrDefault(m => m.MaKh == makh);
                // Gửi tin nhắn chat đến tất cả các client đang kết nối đến phòng chat
                Clients.All.Message(name, message, makh, timenow, tn.MaTinNhan);
            }
            else
            {
                var tn = new tinnhanAdmin();
                {
                    tn.IdNguoiNhan = roomId;
                    tn.IdNguoiGui = makh;
                    tn.NoiDungChat = message;
                    tn.NgayGuiChat = DateTime.Now;
                }
                db.tinnhanAdmins.Add(tn);
                db.SaveChanges();

                khachhang kh = db.khachhangs.Find(makh);
                string name = kh.HoTen;
                DateTime timenow = DateTime.Now;
                tinnhanAdmin tnadmin = db.tinnhanAdmins.FirstOrDefault(m => m.IdNguoiNhan == roomId && m.IdNguoiGui == makh);
                // Gửi tin nhắn chat đến tất cả các client đang kết nối đến phòng chat
                Clients.Caller.Message(name, message, makh, timenow, tnadmin.MaChatAdmin);
            }

        }

        public void GetMessages(int roomId)
        {
            // Lấy ra các tin nhắn trong phòng chat và gửi cho client yêu cầu
            var messages = db.tinnhans.Where(tn => tn.MaPhongChat == roomId).ToList();

            // Gửi danh sách tin nhắn về cho client
            foreach (var msg in messages)
            {
                khachhang kh = db.khachhangs.Find(msg.MaKh);
                string name = kh.HoTen;
                Clients.Caller.Message(name, msg.NoiDungTinNhanClient, msg.MaKh, msg.NgayGui, msg.MaTinNhan);
            }
        }

        public void GetMessagesAdmin(long MaNguoiNhan, long MaNguoiGui)
        {
            // Lấy ra các tin nhắn trong phòng chat và gửi cho client yêu cầu
            var messagesAdmin = db.tinnhanAdmins.Where(tn => tn.IdNguoiNhan == MaNguoiNhan && tn.IdNguoiGui == MaNguoiGui
                                                        || tn.IdNguoiNhan == MaNguoiGui && tn.IdNguoiGui == MaNguoiNhan).ToList();

            // Gửi danh sách tin nhắn về cho client
            foreach (var msg in messagesAdmin)
            {
                khachhang kh = db.khachhangs.Find(msg.IdNguoiGui);
                string name = kh.HoTen;
                Clients.Caller.Message(name, msg.NoiDungChat, msg.IdNguoiGui, msg.NgayGuiChat, msg.MaChatAdmin);
            }
        }

        public void TaoMoi(string room_new)
        {
            int count = 1; // khởi tạo biến đếm là 1

            var ph = db.PhongChats.ToList();
            if(ph.Count > 0)
            {
                foreach (var dem in ph)
                {
                    if (dem.TenPhongChat == room_new)
                    {
                        room_new = room_new + "(" + count.ToString() + ")"; // nếu phòng đã tồn tại, thêm số thứ tự vào tên phòng
                        count++; // tăng biến đếm lên 1
                    }
                }
            }

            var Room = new PhongChat();
            {
                Room.TenPhongChat = room_new;
            }
            db.PhongChats.Add(Room);
            db.SaveChanges();

            PhongChat phchat = db.PhongChats.FirstOrDefault(n => n.TenPhongChat == room_new);
            Clients.All.TaoMoi(phchat.MaPhongChat, phchat.TenPhongChat);
        }

        public void GetTaoMoi()
        {
            var phongchat = db.PhongChats.ToList();
            foreach (var dem in phongchat)
            {
                Clients.Caller.TaoMoi(dem.MaPhongChat, dem.TenPhongChat);
            }
        }

        public void DeletePhong(long? id)
        {
            PhongChat phong = db.PhongChats.Find(id);
            if (phong != null)
            {
                var tn = db.tinnhans.Where(m => m.MaPhongChat == id).ToList();
                if (tn.Count > 0)
                {
                    foreach (var n in tn)
                    {
                        db.tinnhans.Remove(n);
                        db.SaveChanges();
                    }
                }
                db.PhongChats.Remove(phong);
            }
            db.SaveChanges();
            Clients.Caller.DaXoaPhong();
        }

        public void DeleteTinNhan(long id, long gui, long makh)
        {
            tinnhan tn = db.tinnhans.FirstOrDefault(m => m.MaTinNhan == id && m.MaKh == gui);
            tinnhanAdmin tnAdmin = db.tinnhanAdmins.FirstOrDefault(m => m.MaChatAdmin == id && m.IdNguoiGui == gui);
            if (tn != null)
            {
                long idphong = (long)tn.MaPhongChat;
                long kh = (long)tn.MaKh;
                db.tinnhans.Remove(tn);
                db.SaveChanges();
                Clients.Caller.TinNhanDaXoa(idphong, kh, false);
            }
            else if (tnAdmin != null)
            {
                long idphong = (long)tnAdmin.IdNguoiNhan;
                long kh = (long)tnAdmin.IdNguoiGui;
                db.tinnhanAdmins.Remove(tnAdmin);
                db.SaveChanges();
                Clients.Caller.TinNhanDaXoa(idphong, kh, true);
            }
        }

    }
}

