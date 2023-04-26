using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class TinNhanAdminController : Controller
    {
        private Connect db = new Connect();
        // GET: Admin/TinNhanAdmin
        public ActionResult TinNhanAdmin()
        {
            Chat_Admin chat = new Chat_Admin();
            chat.phchat = db.PhongChats.ToList();
            chat.kh = db.khachhangs.Where(n => n.IDGroup == 2).ToList();
            return View(chat);
        }
    }
}