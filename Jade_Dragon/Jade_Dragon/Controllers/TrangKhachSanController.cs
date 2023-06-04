using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Controllers
{
    public class TrangKhachSanController : Controller
    {
        private Connect db = new Connect();
        // GET: TrangKhachSan
        public ActionResult TrangKhachSan(long? maks, long? makh)
        {
            hienthiphong hienthi = new hienthiphong();
            var khach_san = db.KhachSans.ToList();
            if(maks == null)
            {
                foreach(var k in khach_san)
                {
                    maks = k.MaKhachSan;
                    break;
                }
            }

            KhachSan kss = db.KhachSans.Find(maks);
            Session["ma_khachsan"] = maks;
            ViewBag.ma_khachsan = maks;
            Session["ten_khachsan"] = kss.TenKhachSan;
            Session["diachi_khachsan"] = kss.DiaChi;
            Session["sdt_khachsan"] = kss.SoDienThoai;
            Session["gmail_khachsan"] = kss.Gmail;

            hienthi.ph = db.PhongKhachSans.Where(a => a.MaKhachSan == maks).ToList();
            hienthi.cmt = db.BinhLuans.Where(s => s.MaKhachSan == maks).ToList();
            hienthi.AnhKs = db.AnhKhachSans.Where(l => l.MaKhachSan == maks).ToList();
            hienthi.AnhPhong = db.AnhPhongKhachSans.Where(k => k.MaKhachSan == maks).ToList();
            hienthi.tkdg = db.ThongKeDanhGias.ToList();
            DanhGiaKhachSan dg = db.DanhGiaKhachSans.FirstOrDefault(q => q.MaKhachSan == maks && q.MaNguoiDung == makh);
            if(dg != null)
            {
                ViewBag.danhgia = dg.SoSao;
            }

            return View("TrangKhachSan", hienthi);
        }
    }
}