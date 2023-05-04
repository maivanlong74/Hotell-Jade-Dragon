using DocumentFormat.OpenXml.Presentation;
using Jade_Dragon.common;
using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class DangKyKhachSanController : Controller
    {
        private Connect db = new Connect();
        [System.Web.Http.HttpPost]
        public ActionResult DangKyKs(Map_KhachSan model)
        {
            khuvuc khuvuc = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == model.KhuVuc);
            if (khuvuc == null)
            {
                var kv = new khuvuc();
                {
                    kv.TenKhuVuc = model.KhuVuc;
                    kv.KinhDo = model.KinhDo.ToString();
                    kv.ViDo = model.ViDo.ToString();
                }
                db.khuvucs.Add(kv);
                db.SaveChanges();
                khuvuc k_v = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == model.KhuVuc);

                var ks = new khachsan();
                {
                    ks.TenKhachSan = model.TenKhachSan;
                    ks.SoDienThoai = model.SoDienThoai;
                    ks.Gmail = model.Gmail;
                    ks.DiaChi = model.DiaChi;
                    ks.KinhDo = model.KinhDo.ToString();
                    ks.ViDo = model.ViDo.ToString();
                    ks.Gia = (long?)model.Gia;
                    ks.MaKhuVuc = k_v.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
            }
            else
            {
                var ks = new khachsan();
                {
                    ks.TenKhachSan = model.TenKhachSan;
                    ks.SoDienThoai = model.SoDienThoai;
                    ks.Gmail = model.Gmail;
                    ks.DiaChi = model.DiaChi;
                    ks.KinhDo = model.KinhDo.ToString();
                    ks.ViDo = model.ViDo.ToString();
                    ks.Gia = (long?)model.Gia;
                    ks.MaKhuVuc = khuvuc.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
            }
            return RedirectToAction("QuanLyKs", "QLKhachSan"); 
        }

        
    }
}