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
    public class khuvucController : baseController
    {
        private Connect db = new Connect();

        // GET: Admin/khuvuc
        public ActionResult khuvuc()
        {
            var ListKv = db.khuvucs.ToList();
            return View("khuvuc", ListKv);
        }

        // GET: Admin/khuvuc/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khuvuc khuvuc = db.khuvucs.Find(id);
            if (khuvuc == null)
            {
                return HttpNotFound();
            }
            return View(khuvuc);
        }

        // GET: Admin/khuvuc/Create
        public ActionResult Create(khuvuc khuvuc, string TenKhuVuc)
        {
            /*if (Request.Cookies["TenKhuVuc"] != null)
            {
                TenKhuVuc = Request.Cookies["TenKhuVuc"].Value;
            }*/
            if (db.khuvucs.Where(m => m.TenKhuVuc == TenKhuVuc).Count() > 0)
            {
                return Redirect("khuvuc");
            }
            db.khuvucs.Add(khuvuc);
            db.SaveChanges();
            return Redirect("khuvuc");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(string TenKhuVuc, long MaKhuVuc)
        {
            if (Request.Cookies["TenKhuVuc"] != null)
            {
                TenKhuVuc = Request.Cookies["TenKhuVuc"].Value;
                MaKhuVuc = long.Parse(Request.Cookies["MaKhuVuc"].Value);
            }
            var khuVuc = db.khuvucs.FirstOrDefault(x => x.MaKhuVuc == MaKhuVuc);

            if (db.khuvucs.Where(m => m.TenKhuVuc == TenKhuVuc).Count() > 0)
            {
                return Redirect("khuvuc");
            }
            khuVuc.TenKhuVuc = TenKhuVuc;
            db.SaveChanges();
            return Redirect("khuvuc");

        }

        public ActionResult Delete(long? id)
        {
            khuvuc kv = db.khuvucs.FirstOrDefault(x => x.MaKhuVuc == id);
            khachsan ks = db.khachsans.FirstOrDefault(x => x.MaKhuVuc == id);
            db.khuvucs.Remove(kv);
            if (ks != null)
            {
                db.khachsans.Remove(ks);
                phong ph = db.phongs.FirstOrDefault(x => x.MaKhachSan == ks.MaKhachSan);
                if(ph != null)
                {
                    db.phongs.Remove(ph);
                }
            }
            db.SaveChanges();
            return RedirectToAction("khuvuc");
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
