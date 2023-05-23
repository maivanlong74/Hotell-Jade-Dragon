using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.common;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class XacNhanDonAdminController : Controller
    {
        private Connect db = new Connect();
        // GET: Admin/XacNhanDonAdmin
        public ActionResult DanhSachDon()
        {
            HtLichSu ls = new HtLichSu();
            ls.hd = db.hoadons.ToList();
            ls.cthd = db.chitiethoadons.ToList();
            return View("DanhSachDon", ls);
        }
    }
}