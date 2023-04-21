using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class QLKhachSanController : baseController
    {
        private Connect db = new Connect();

        public ActionResult test()
        {
            return View();
        }

        // GET: Admin/khachsans
        public ActionResult QuanLyKs()
        {
            var khachsans = db.khachsans.Include(k => k.khuvuc);
            return View(khachsans.ToList());
        }

        // GET: Admin/khachsans/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khachsan khachsan = db.khachsans.Find(id);
            if (khachsan == null)
            {
                return HttpNotFound();
            }
            return View(khachsan);
        }

        // GET: Admin/khachsans/Create
        public ActionResult Create()
        {
            ViewBag.MaKhuVuc = new SelectList(db.khuvucs, "MaKhuVuc", "TenKhuVuc");
            return View();
        }

        // POST: Admin/khachsans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaKhachSan,TenKhachSan,SoDienThoai,Gmail,DiaChi,Gia,AnhKs,MaKhuVuc")] khachsan khachsan, HttpPostedFileBase uploadhinh)
        {
            if (ModelState.IsValid)
            {
                db.khachsans.Add(khachsan);
                db.SaveChanges();
                Up_IMG(khachsan, uploadhinh);
                return RedirectToAction("QuanLyKs");
            }

            ViewBag.MaKhuVuc = new SelectList(db.khuvucs, "MaKhuVuc", "TenKhuVuc", khachsan.MaKhuVuc);
            return View(khachsan);
        }

        // GET: Admin/khachsans/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khachsan khachsan = db.khachsans.Find(id);
            if (khachsan == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKhuVuc = new SelectList(db.khuvucs, "MaKhuVuc", "TenKhuVuc", khachsan.MaKhuVuc);
            Session["TenKhachSan"] = khachsan.TenKhachSan;
            return View(khachsan);
        }

        // POST: Admin/khachsans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaKhachSan,TenKhachSan,SoDienThoai,Gmail,DiaChi,Gia,AnhKs,MaKhuVuc")] khachsan khachsan, HttpPostedFileBase uploadhinh)
        {
            if (ModelState.IsValid)
            {
                khachsan unv = db.khachsans.FirstOrDefault(x => x.MaKhachSan == khachsan.MaKhachSan);

                unv.TenKhachSan = khachsan.TenKhachSan;
                unv.SoDienThoai = khachsan.SoDienThoai;
                unv.Gmail = khachsan.Gmail;
                unv.DiaChi = khachsan.DiaChi;
                unv.Gia = khachsan.Gia;
                unv.MaKhuVuc = khachsan.MaKhuVuc;

                if (uploadhinh != null && uploadhinh.ContentLength > 0)
                {
                    long id = khachsan.MaKhachSan;

                    string _FileName = "";
                    string code = RandomCode();
                    int index = uploadhinh.FileName.IndexOf('.');
                    _FileName = "nv" + code + "." + uploadhinh.FileName.Substring(index + 1);
                    string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachSan"), _FileName);
                    uploadhinh.SaveAs(_path);
                    unv.AnhKs = _FileName;
                }

                db.SaveChanges();
                return Redirect("~/Admin/QLKhachSan/Details/" + khachsan.MaKhachSan);
            }
            ViewBag.MaKhuVuc = new SelectList(db.khuvucs, "MaKhuVuc", "TenKhuVuc", khachsan.MaKhuVuc);
            return View(khachsan);
        }

        // GET: Admin/khachsans/Delete/5
        public ActionResult Delete(long? id)
        {
            khachsan ks = db.khachsans.FirstOrDefault(x => x.MaKhachSan == id);
            /*phong phong = db.phongs.FirstOrDefault(x => x.MaKhachSan == id);*/
            List<phong> phong = db.phongs.Where(x => x.MaKhachSan == id).ToList();
            db.khachsans.Remove(ks);
            if(phong != null)
            {
                foreach(var dem in phong)
                {
                    db.phongs.Remove(dem);
                }
            }
            db.SaveChanges();
            return RedirectToAction("QuanLyKs");
        }

        public ActionResult Up_IMG(khachsan ks, HttpPostedFileBase uploadhinh)
        {
            if (uploadhinh != null && uploadhinh.ContentLength > 0)
            {
                int id = int.Parse(db.khachsans.ToList().Last().MaKhachSan.ToString());

                string _FileName = "";
                int index = uploadhinh.FileName.IndexOf('.');
                _FileName = "nv" + id.ToString() + "." + uploadhinh.FileName.Substring(index + 1);
                string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachSan"), _FileName);
                uploadhinh.SaveAs(_path);

                khachsan unv = db.khachsans.FirstOrDefault(x => x.MaKhachSan == id);
                unv.AnhKs = _FileName;
                db.SaveChanges();
            }
            return View();
        }

        public ActionResult XoaAnh(long? ks)
        {
            khachsan khachsan = db.khachsans.Find(ks);
            khachsan.AnhKs = null;
          
            db.SaveChanges();
            return Redirect("~/Admin/QLKhachSan/Details/" + khachsan.MaKhachSan);
        }

        public string RandomCode()
        {
            int codeLength = 4; // Độ dài của mã xác minh
            Random random = new Random();
            string code = "";

            for (int i = 0; i < codeLength; i++)
            {
                int digit = random.Next(0, 9); // Lấy ngẫu nhiên một số từ 0 đến 9
                code += digit.ToString(); // Thêm số vào chuỗi mã xác minh
            }

            return code;
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
