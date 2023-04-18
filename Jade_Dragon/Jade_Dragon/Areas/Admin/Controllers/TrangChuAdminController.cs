using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class TrangChuAdminController : baseController
    {
        // GET: Admin/TrangChuAdmin
        public ActionResult TrangChu()
        {
            return View();
        }
    }
}