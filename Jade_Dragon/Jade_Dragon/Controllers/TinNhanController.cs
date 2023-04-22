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
        // GET: TinNhan
        public ActionResult Chat(long? makh)
        {
            if(makh == null)
            {
                WebMsgBox.Show("Bạn cần phải đăng nhập để nhắn tin", this);
                return RedirectToAction("trangchu", "trangchu");
            }
            return View();
        }
    }
}