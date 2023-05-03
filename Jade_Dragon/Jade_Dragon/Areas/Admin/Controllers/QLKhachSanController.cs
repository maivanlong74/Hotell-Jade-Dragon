using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.common;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class QLKhachSanController : baseController
    {
        private Connect db = new Connect();
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
            return View();
        }

        // POST: Admin/khachsans/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(string TenKhachSan, long SoDienThoai, string Gmail, string DiaChi, 
            long Gia, string KinhDo, string ViDo, string TenKhuVuc, HttpPostedFileBase uploadhinh)
        {
            khuvuc khuvuc = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);
            if (khuvuc == null)
            {
                if(KinhDo == null && ViDo == null)
                {
                    WebMsgBox.Show("Bạn vui lòng chọn địa điểm trên bản đồ", this);
                    return View();
                }
                var kv = new khuvuc();
                {
                    kv.TenKhuVuc = TenKhuVuc;
                    kv.KinhDo = KinhDo;
                    kv.ViDo = ViDo;
                }
                db.khuvucs.Add(kv);
                db.SaveChanges();
                khuvuc k_v = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);

                var ks = new khachsan();
                {
                    ks.TenKhachSan = TenKhachSan;
                    ks.SoDienThoai = SoDienThoai;
                    ks.Gmail = Gmail;
                    ks.DiaChi = DiaChi;
                    ks.KinhDo = KinhDo;
                    ks.ViDo = ViDo;
                    ks.Gia = Gia;
                    ks.MaKhuVuc = k_v.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, uploadhinh);
            }
            else
            {
                var ks = new khachsan();
                {
                    ks.TenKhachSan = TenKhachSan;
                    ks.SoDienThoai = SoDienThoai;
                    ks.Gmail = Gmail;
                    ks.DiaChi = DiaChi;
                    ks.KinhDo = KinhDo;
                    ks.ViDo = ViDo;
                    ks.Gia = Gia;
                    ks.MaKhuVuc = khuvuc.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, uploadhinh);
            }
            return RedirectToAction("QuanLyKs");
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
            Session["TenKhachSan"] = khachsan.TenKhachSan;
            return View(khachsan);
        }

        // POST: Admin/khachsans/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(long MaKhachSan, string TenKhachSan, long SoDienThoai, string Gmail, string DiaChi,
            long Gia, string KinhDo, string ViDo, string TenKhuVuc, bool TrangThaiKs, HttpPostedFileBase uploadhinh)
        {
            khuvuc khuvuc = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);
            khachsan ks = db.khachsans.Find(MaKhachSan);
            if (khuvuc == null)
            {
                if (KinhDo == null && ViDo == null)
                {
                    WebMsgBox.Show("Bạn vui lòng chọn địa điểm trên bản đồ", this);
                    return View();
                }
                var kv = new khuvuc();
                {
                    kv.TenKhuVuc = TenKhuVuc;
                    kv.KinhDo = KinhDo;
                    kv.ViDo = ViDo;
                }
                db.khuvucs.Add(kv);
                db.SaveChanges();
                khuvuc k_v = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);

                ks.TenKhachSan = TenKhachSan;
                ks.SoDienThoai = SoDienThoai;
                ks.Gmail = Gmail;
                ks.DiaChi = DiaChi;
                ks.KinhDo = KinhDo;
                ks.ViDo = ViDo;
                ks.Gia = Gia;
                ks.MaKhuVuc = k_v.MaKhuVuc;
                ks.TrangThaiKs = TrangThaiKs;
                db.SaveChanges();
            }
            else
            {
                ks.TenKhachSan = TenKhachSan;
                ks.SoDienThoai = SoDienThoai;
                ks.Gmail = Gmail;
                ks.DiaChi = DiaChi;
                ks.KinhDo = KinhDo;
                ks.ViDo = ViDo;
                ks.Gia = Gia;
                ks.MaKhuVuc = khuvuc.MaKhuVuc;
                ks.TrangThaiKs = TrangThaiKs;
                db.SaveChanges();
            }

            if (uploadhinh != null && uploadhinh.ContentLength > 0)
            {
                if (uploadhinh.ContentLength > 1024000) // check if image size is greater than 1MB
                {
                    WebMsgBox.Show("Kích thước ảnh vượt quá giới hạn cho phép (1MB)", this);
                    return Redirect("~/Admin/QLKhachSan/Details/" + ks.MaKhachSan);
                }
                else
                {
                    string _FileName = "";
                    string code = RandomCode();
                    int index = uploadhinh.FileName.IndexOf('.');
                    _FileName = "nv" + code + "." + uploadhinh.FileName.Substring(index + 1);
                    string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachSan"), _FileName);
                    uploadhinh.SaveAs(_path);
                    ks.AnhKs = _FileName;
                }
                
            }
            db.SaveChanges();
            return Redirect("~/Admin/QLKhachSan/Details/" + ks.MaKhachSan);
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
