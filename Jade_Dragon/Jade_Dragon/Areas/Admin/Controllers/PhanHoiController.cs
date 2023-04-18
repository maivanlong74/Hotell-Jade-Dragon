using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class PhanHoiController : baseController
    {
        private Connect db = new Connect();

        // GET: Admin/PhanHoi
        public ActionResult PhanHoi()
        {
            var phanhois = db.phanhois.Include(p => p.khachhang);
            return View(phanhois.ToList());
        }
        // GET: Admin/PhanHoi/Delete/5
        public ActionResult Delete(string id)
        {
            phanhoi ph = db.phanhois.FirstOrDefault(x => x.MaPhanHoi == id);
            db.phanhois.Remove(ph);
            if (ph != null)
            {
                db.phanhois.Remove(ph);
            }
            db.SaveChanges();
            return RedirectToAction("PhanHoi");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
