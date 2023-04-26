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
using System.Web;
using System.Windows.Interop;

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
                // Gửi tin nhắn chat đến tất cả các client đang kết nối đến phòng chat
                Clients.All.Message(name, message, makh, timenow);
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
                // Gửi tin nhắn chat đến tất cả các client đang kết nối đến phòng chat
                Clients.Caller.Message(name, message, makh, timenow);
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
                Clients.Caller.Message(name, msg.NoiDungTinNhanClient, msg.MaKh, msg.NgayGui);
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
                Clients.Caller.Message(name, msg.NoiDungChat, msg.IdNguoiGui, msg.NgayGuiChat);
            }
        }

        public void TaoMoi(string room_new)
        {
            int count = 1; // khởi tạo biến đếm là 1

            var ph = db.PhongChats.ToList();
            foreach (var dem in ph)
            {
                if (dem.TenPhongChat == room_new)
                {
                    room_new = room_new + count.ToString(); // nếu phòng đã tồn tại, thêm số thứ tự vào tên phòng
                    count++; // tăng biến đếm lên 1
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
            foreach(var dem in phongchat)
            {
                Clients.Caller.TaoMoi(dem.MaPhongChat, dem.TenPhongChat);
            }
        }
    }
}

