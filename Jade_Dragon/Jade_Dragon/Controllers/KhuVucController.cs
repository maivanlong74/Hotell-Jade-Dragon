using Jade_Dragon.Areas.Admin.Controllers;
using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Controllers
{
    public class KhuVucController : Controller
    {
        Connect kn = new Connect();
        // GET: KhuVuc
        public ActionResult Index()
        {
            var kv = kn.khuvucs.ToList();
            return View(kv);
        }
    }
}