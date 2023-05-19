using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DocumentFormat.OpenXml.Office2010.Excel;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class LichSuController : baseController
    {
        private Connect db = new Connect();
        // GET: Admin/LichSu
        public ActionResult LichSu()
        {
            var nguoiTruyCap = db.SoLuongNguoiTruyCaps.FirstOrDefault();
            ViewBag.NguoiTruyCap = nguoiTruyCap.SoLuongNguoi.ToString();
            ViewBag.NguoiOnline = HttpContext.Application["NguoiOnline"].ToString();
            ViewBag.sluser = thongkenguoidung();
            var ks = db.khachsans.ToList();

            if(ks.Count > 0)
            {
                var hd = db.hoadons.ToList();
                if(hd.Count > 0)
                {
                    ViewBag.tongdoanhthu = doanhthu();
                    ViewBag.sldonhang = thongkedonhang();
                }
                else
                {
                    ViewBag.tongdoanhthu = null;
                    ViewBag.sldonhang = null;
                }

                var ListLs = db.lichsus.ToList();
                ViewBag.ksks = "abc";
                return View("LichSu", ListLs);
            }
            else
            {
                ViewBag.ksks = null;
                return View("LichSu");
            }
        }

        public decimal doanhthu()
        {
            decimal tongdoanhthu = db.hoadons.Sum(n => n.TongTien).Value;
            return tongdoanhthu;
        }

        public decimal thongke(int thang, int nam)
        {

            var List = db.hoadons.Where(n => n.NgayDat.Value.Month == thang && n.NgayDat.Value.Year == nam);
            decimal tongtien = 0;
            foreach(var item in List)
            {
                tongtien += decimal.Parse(item.TongTien.Value.ToString());
            }
            return tongtien;
        }

        public double thongkedonhang()
        {
            double sldonhang = db.hoadons.Count();
            return sldonhang;
        }

        public double thongkenguoidung()
        {
            double sluser = db.khachhangs.Count();
            return sluser;
        }

        public ActionResult HoaDon(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoadon hoadon = db.hoadons.Find(id);
            if (hoadon == null)
            {
                return HttpNotFound();
            }
            return View(hoadon);
        }

        public ActionResult ChiTiet(long? ma)
        {
            var List_ChiTiet = db.chitiethoadons.Where(m => m.MaHoaDon == ma).ToList();
            Session["tongtien"] = tongtien(ma);
            Session["mahoadon"] = ma;
            hoadon hd = db.hoadons.Find(ma);
            Session["HoTen"] = hd.HoTen;
            return View("ChiTiet", List_ChiTiet);
        }

        public decimal tongtien(long? ma)
        {
            decimal tong = 0;
            var List = db.chitiethoadons.Where(m => m.MaHoaDon == ma).ToList();
            foreach (var chiTiet in List)
            {
                tong += (decimal)chiTiet.Gia;
            }
            return tong;
        }

        public ActionResult LichSuManage(long? id)
        {
            var nguoiTruyCap = db.SoLuongNguoiTruyCaps.FirstOrDefault();
            ViewBag.NguoiTruyCap = nguoiTruyCap.SoLuongNguoi.ToString();
            ViewBag.NguoiOnline = HttpContext.Application["NguoiOnline"].ToString();
            ViewBag.sluser = db.khachhangs.Count();
            khachsan ks = db.khachsans.Find(id);

            if (ks != null)
            {
                hoadon hd = db.hoadons.FirstOrDefault(m => m.MaKhachSan == id);
                if (hd != null)
                {
                    ViewBag.tongdoanhthuks = db.hoadons.Where(m => m.MaKhachSan == id).Sum(n => n.TongTien).Value;
                    ViewBag.sldonhangks = db.hoadons.Where(m => m.MaKhachSan == id).Count();
                }
                else
                {
                    ViewBag.tongdoanhthu = null;
                    ViewBag.sldonhang = null;
                }

                var ListLs = db.lichsus.Where(m => m.MaKhachSan == id).ToList();
                ViewBag.ksks = "123";
                return View("LichSuManage", ListLs);
            }
            else
            {
                ViewBag.ksks = null;
                return View("LichSuManage");
            }
            
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