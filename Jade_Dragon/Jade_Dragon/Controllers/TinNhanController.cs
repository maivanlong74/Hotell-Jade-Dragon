using Jade_Dragon.Areas.Admin.Controllers;
using Jade_Dragon.common;
using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Controllers
{
    public class TinNhanController : Controller
    {
        private Connect db = new Connect();
        // GET: TinNhan
        public ActionResult Chat(long? makh)
        {
            var phong = db.PhongChats.FirstOrDefault(); 
            if (phong != null) 
            {
                Session["MaPhong"] = phong.MaPhongChat; 
                Session["TenPhong"] = phong.TenPhongChat; 
            }
            if (makh == null)
            {
                WebMsgBox.Show("Bạn cần phải đăng nhập để nhắn tin", this);
                return RedirectToAction("trangchu", "trangchu");
            }
            khachhang kh = db.khachhangs.FirstOrDefault(n => n.IDGroup == 1);
            Session["MaPhongAdmin"] = kh.MaKh;
            var listphong = db.PhongChats.ToList();
            return View("Chat", listphong);
        }


    }
}