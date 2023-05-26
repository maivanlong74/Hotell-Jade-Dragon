using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.common;
using Jade_Dragon.Models;
using static Xamarin.Essentials.Permissions;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class PhongManageController : baseController
    {
        private Connect db = new Connect();
        public ActionResult DanhSachPhong(long MaKs)
        {
            HtPhong ph = new HtPhong();
            InfoPhong infophong = new InfoPhong();
            var phks = db.PhongKhachSans.Where(a => a.MaKhachSan == MaKs).ToList();
            foreach (var phk in phks)
            {
                chitiethoadon ct = db.chitiethoadons.FirstOrDefault(s => s.MaPhong == phk.MaPhong);
                if (ct != null)
                {
                    phk.TrangThai = false; db.SaveChanges();
                }
                else
                {
                    phk.TrangThai = true; db.SaveChanges();
                }
            }

            ph.tangks = infophong.LayDanhSachSoTang(MaKs);
            ph.phongks = phks;
            ph.cthd = db.chitiethoadons.ToList();
            khachsan ks = db.khachsans.Find(MaKs);

            ViewBag.ma = ks.MaKhachSan;
            ViewBag.ten = ks.TenKhachSan;
            ViewBag.time = DateTime.Now;

            return View("DanhSachPhong", ph);
        }

        public ActionResult khoaphong(long maph)
        {
            PhongKhachSan ph = db.PhongKhachSans.Find(maph);
            ph.KhoaPhong = true;
            db.SaveChanges();
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = ph.MaKhachSan });
        }

        public ActionResult mokhoaphong(long maph)
        {
            PhongKhachSan ph = db.PhongKhachSans.Find(maph);
            ph.KhoaPhong = false;
            db.SaveChanges();
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = ph.MaKhachSan });
        }

        public ActionResult themphong(long maks, long matang)
        {
            khachsan ks = db.khachsans.Find(maks);
            var ph = db.PhongKhachSans.Where(m => m.MaKhachSan == maks && m.MaSoTang == matang).ToList();
            SoTangKhachSan tang = db.SoTangKhachSans.Find(matang);
            SoPhongKhachSan sophong = db.SoPhongKhachSans.Find(ph.Count + 1);
            if (sophong != null)
            {
                PhongKhachSan phks = new PhongKhachSan();
                phks.MaKhachSan = maks;
                phks.MaSoTang = matang;
                phks.MaSoPhong = ph.Count + 1;
                phks.TenPhong = tang.SoTang.Replace(" ", "") + sophong.SoPhong.Replace(" ", "");
                phks.LoaiHinh = "Đơn";
                phks.Gia = ks.Gia;
                phks.VIP = false;
                phks.TrangThai = false;
                phks.KhoaPhong = true;
                db.PhongKhachSans.Add(phks);
                db.SaveChanges();
            }
            else
            {
                SoPhongKhachSan sl = new SoPhongKhachSan();
                sl.MaSoPhong = ph.Count + 1;
                sl.SoPhong = "0" + ((ph.Count + 1).ToString().Replace(" ", ""));
                db.SoPhongKhachSans.Add(sl);
                db.SaveChanges();

                SoPhongKhachSan soks = db.SoPhongKhachSans.Find(ph.Count + 1);
                PhongKhachSan phks = new PhongKhachSan();
                phks.MaKhachSan = maks;
                phks.MaSoTang = matang;
                phks.MaSoPhong = soks.MaSoPhong;
                phks.TenPhong = tang.SoTang.Replace(" ", "") + soks.SoPhong.Replace(" ", "");
                phks.LoaiHinh = "Đơn";
                phks.Gia = ks.Gia;
                phks.VIP = false;
                phks.TrangThai = false;
                phks.KhoaPhong = true;
                db.PhongKhachSans.Add(phks);
                db.SaveChanges();
            }
            db.SaveChanges();
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }

        public ActionResult themtang(long maks)
        {
            khachsan ks = db.khachsans.Find(maks);
            SoTangKhachSan sotang = db.SoTangKhachSans.Find(ks.SoTang + 1);
            SoPhongKhachSan sophong = db.SoPhongKhachSans.Find(1);
            if (sotang != null)
            {
                PhongKhachSan phks = new PhongKhachSan();
                phks.MaKhachSan = maks;
                phks.MaSoTang = (ks.SoTang + 1);
                phks.MaSoPhong = 1;
                phks.TenPhong = sotang.SoTang.Replace(" ", "") + sophong.SoPhong.Replace(" ", "");
                phks.LoaiHinh = "Đơn";
                phks.Gia = ks.Gia;
                phks.VIP = false;
                phks.TrangThai = false;
                phks.KhoaPhong = true;
                db.PhongKhachSans.Add(phks);
                db.SaveChanges();
            }
            else
            {
                SoTangKhachSan themtangks = new SoTangKhachSan();
                themtangks.MaSoTang = (long)(ks.SoTang + 1);
                themtangks.SoTang = ("B" + (ks.SoTang + 1).ToString()).Replace(" ", "");
                db.SoTangKhachSans.Add(themtangks);
                db.SaveChanges();

                SoTangKhachSan sotangks = db.SoTangKhachSans.Find(ks.SoTang + 1);
                PhongKhachSan phks = new PhongKhachSan();
                phks.MaKhachSan = maks;
                phks.MaSoTang = sotangks.MaSoTang;
                phks.MaSoPhong = 1;
                phks.TenPhong = sotangks.SoTang.Replace(" ", "") + sophong.SoPhong.Replace(" ", "");
                phks.LoaiHinh = "Đơn";
                phks.Gia = ks.Gia;
                phks.VIP = false;
                phks.TrangThai = false;
                phks.KhoaPhong = true;
                db.PhongKhachSans.Add(phks);
                db.SaveChanges();
            }

            long up = (long)(ks.SoTang + 1);
            ks.SoTang = up;
            db.SaveChanges();
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }

        public ActionResult Edit(long maks, long maph, string loaihinh, long gia, string vip)
        {
            PhongKhachSan ph = db.PhongKhachSans.Find(maph);
            ph.LoaiHinh = loaihinh;
            ph.Gia = gia;

            if (!string.IsNullOrEmpty(vip) && vip == "true")
            {
                ph.VIP = true;
            }
            else
            {
                ph.VIP = false;
            }

            db.SaveChanges();
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }


        public ActionResult Xoatang(long maks, long matang)
        {
            var ph = db.PhongKhachSans.Where(a => a.MaKhachSan == maks && a.MaSoTang == matang && a.TrangThai == false).ToList();
            if (ph.Count > 0)
            {
                WebMsgBox.Show("Tầng này đang có phòng khách đặt", this);
            }
            else
            {
                var phks = db.PhongKhachSans.Where(a => a.MaKhachSan == maks && a.MaSoTang == matang).ToList();
                foreach (var k in phks)
                {
                    db.PhongKhachSans.Remove(k);
                }
                db.SaveChanges();

                khachsan ks = db.khachsans.Find(maks);
                ks.SoTang = ks.SoTang - 1;
                db.SaveChanges();
            }
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }

        public ActionResult Check_In(long mact, long maks)
        {
            chitiethoadon ct = db.chitiethoadons.Find(mact);
            if (ct != null)
            {
                ct.DaDen = true;
                db.SaveChanges();
            }
            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }

        public ActionResult Check_Out(long mact, long maks)
        {
            chitiethoadon ct = db.chitiethoadons.Find(mact);
            hoadon hd = db.hoadons.Find(ct.MaHoaDon);
            DateTime now = DateTime.Now;
            if (now < ct.NgayDi)
            {
                long sodem_truoc = demsodem((DateTime)ct.NgayDen, (DateTime)ct.NgayDi);
                ct.NgayDi = now;
                ct.HoanThanh = true;
                db.SaveChanges();
                long sodem_sau = demsodem((DateTime)ct.NgayDen, (DateTime)ct.NgayDi);
                long gia_thua = (long)(ct.PhongKhachSan.Gia * (sodem_truoc - sodem_sau));
                ct.Gia = gia_thua;
                hd.TongTien = hd.TongTien - gia_thua;
                db.SaveChanges();
            }
            else if (now > ct.NgayDi)
            {
                long sodem_truoc = demsodem((DateTime)ct.NgayDen, (DateTime)ct.NgayDi);
                ct.NgayDi = now;
                ct.HoanThanh = true;
                db.SaveChanges();
                long sodem_sau = demsodem((DateTime)ct.NgayDen, (DateTime)ct.NgayDi);
                long gia_thieu = (long)(ct.PhongKhachSan.Gia * (sodem_sau - sodem_truoc));
                ct.Gia = gia_thieu;
                hd.TongTien = hd.TongTien + gia_thieu;
                db.SaveChanges();
            }

            var chitiet = db.chitiethoadons.Where(a => a.MaHoaDon == hd.MaHoaDon).ToList();
            if (chitiet.Count > 0)
            {
                bool allHoanThanh = chitiet.All(i => i.HoanThanh == true);
                if (allHoanThanh)
                {
                    hd.MaError = "02";
                    db.SaveChanges();
                }
            }

            return RedirectToAction("DanhSachPhong", "PhongManage", new { MaKs = maks });
        }

        public long demsodem(DateTime ngayden, DateTime ngaydi)
        {
            TimeSpan den = ngayden.TimeOfDay;
            int gioden = (int)den.TotalSeconds / 3600;
            int phutden = (int)den.TotalSeconds / 60 % 60;

            TimeSpan di = ngaydi.TimeOfDay;
            int giodi = (int)di.TotalSeconds / 3600;
            int phutdi = (int)di.TotalSeconds / 60 % 60;

            DateTime checkInDate = new DateTime(ngayden.Year, ngayden.Month, ngayden.Day, gioden, phutden, 0);
            DateTime checkOutDate = new DateTime(ngaydi.Year, ngaydi.Month, ngaydi.Day, giodi, phutdi, 0);
            int sodem = check_In_Out.check(checkInDate, checkOutDate);

            return sodem;
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
