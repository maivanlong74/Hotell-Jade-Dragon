using Jade_Dragon.Models;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Hubs
{
    [HubName("chat")]
    public class DemoChat : Hub
    {
        private Connect db = new Connect();
        public void Message(int roomId, long makh, string message)
        {
            // Thêm mới tin nhắn chat vào CSDL
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
            Clients.All.Message(tenphong, name, message, makh, timenow);
        }

        public void GetMessages(int roomId)
        {
            // Lấy ra các tin nhắn trong phòng chat và gửi cho client yêu cầu
            var messages = db.tinnhans.Where(tn => tn.MaPhongChat == roomId).ToList();

            // Lấy ra thông tin tên phòng chat
            PhongChat phchat = db.PhongChats.Find(roomId);
            string tenphong = phchat.TenPhongChat;

            // Gửi danh sách tin nhắn về cho client
            foreach (var msg in messages)
            {
                khachhang kh = db.khachhangs.Find(msg.MaKh);
                string name = kh.HoTen;
                Clients.Caller.Message(tenphong, name, msg.NoiDungTinNhanClient, msg.MaKh, msg.NgayGui);
            }
        }

        public void ClearMessages(long roomId)
        {
            // Xóa tất cả tin nhắn trong phòng chat
            var room = "room_" + roomId;
            Clients.Group(roomId.ToString()).Clear();
        }
    }
}

