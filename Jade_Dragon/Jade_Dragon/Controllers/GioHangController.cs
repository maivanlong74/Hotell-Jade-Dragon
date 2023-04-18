﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Areas.Admin.Controllers;
using Jade_Dragon.common;
using Jade_Dragon.Models;
using Microsoft.Owin.BuilderProperties;
using PagedList;
using Xamarin.Essentials;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Menu;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TaskbarClock;
using static Xamarin.Essentials.Permissions;

namespace Jade_Dragon.Controllers
{
    public class GioHangController : Controller
    {
        private Connect db = new Connect();
        private const string giohang = "giohang";
        //Đặt phòng
        public ActionResult DatPhong(long? maks, long? sodem)
        {

            var cart = Session[giohang];
            var list = new List<Cart>();

            if (cart != null)
            {
                list = (List<Cart>)cart;

                decimal tongtien = (decimal)(list.Sum(item => item.TongTien()) * sodem);
                Session["tongtien"] = tongtien;

                decimal tongsoluong = list.Sum(a => a.TongSoLuong());
                Session["TongSoLuong"] = tongsoluong;
                Session["TienDatCoc"] = (double)tongtien * 0.2;
            }

            if (maks == null)
            {
                List<khuvuc> KhuVuc = new List<khuvuc>();
                KhuVuc = db.khuvucs.ToList();
                ViewBag.ListKhuVuc = KhuVuc;
                return View(list);
            }
            else
            {
                var ks = db.khachsans.FirstOrDefault(v => v.MaKhachSan == maks);
                Session["MaKhachSanPhong"] = ks.MaKhachSan;
                Session["TenKhachSan"] = ks.TenKhachSan;
                Session["DiaChi"] = ks.DiaChi;
                Session["SoDienThoai_ks"] = ks.SoDienThoai;
                Session["GmailKhachSan"] = ks.Gmail;
                Session["AnhKs"] = ks.AnhKs;
            }
            List<khuvuc> kv = new List<khuvuc>();
            kv = db.khuvucs.ToList();
            ViewBag.ListKhuVuc = kv;

            DateTime time_now = DateTime.Now.AddDays(-1);
            DateTime time_max = DateTime.Now.AddDays(30);
            ViewBag.time_now = loadtime(time_now);
            ViewBag.time_max = loadtime(time_max);

            return View(list);
        }

        public string loadtime(DateTime time)
        {
            TimeSpan den = time.TimeOfDay;
            int sogio = (int)den.TotalSeconds / 3600;
            int sophut = (int)den.TotalSeconds / 60 % 60;

            string nam = time.Year.ToString("D4");
            string thang = time.Month.ToString("D2");
            string ngay = time.Day.ToString("D2");
            string gio = sogio.ToString("D2");
            string phut = sophut.ToString("D2");

            string xuly = nam + "-" + thang + "-" + ngay + "T" + gio + ":" + phut;
            return xuly;
        }

        public ActionResult AddItem(long maph, int soluong, DateTime? ngayden = null, DateTime? ngaydi = null,
                                    DateTime? batdau = null, DateTime? ketthuc = null)
        {

            var Phong = db.phongs.FirstOrDefault(c => c.MaPhong == maph);
            var cart = Session[giohang];
            if (cart != null)
            {
                var list = (List<Cart>)cart;
                if (list.Exists(x => x.htphong.MaKhachSan != Phong.MaKhachSan))
                {
                    return RedirectToAction("khachsan", "khachsan", new {batdau = batdau, ketthuc = ketthuc});
                }
                else
                {

                    if (list.Exists(x => x.htphong.MaPhong == maph))
                    {

                        return RedirectToAction("khachsan", "khachsan", new { batdau = batdau, ketthuc = ketthuc });
                    }
                    else
                    {
                        //tạo mới đối tượng cart item
                        var item = new Cart();
                        item.htphong = Phong;
                        item.htsoluong = soluong;
                        list.Add(item);
                    }
                    //Gán vào session
                    Session[giohang] = list;
                }
            }
            else
            {
                //tạo mới đối tượng cart item
                var item = new Cart();
                item.htphong = Phong;
                item.htsoluong = soluong;
                var list = new List<Cart>();
                list.Add(item);
                //Gán vào session
                Session[giohang] = list;

            }
            return RedirectToAction("Next", "GioHang", new { maksphong = Phong.MaKhachSan, ngayden = ngayden, ngaydi = ngaydi });
        }

        public ActionResult DeleteAll()
        {
            Session[giohang] = null;
            Session["TongSoLuong"] = 0;
            return RedirectToAction("khachsan", "khachsan");
        }

        public ActionResult Delete(long? id, long? sd)
        {
            var sessionCart = (List<Cart>)Session[giohang];
            sessionCart.RemoveAll(x => x.htphong.MaPhong == id);
            Session[giohang] = sessionCart;
            return Redirect("~/GioHang/DatPhong?sodem=" + sd);    
        }

        [HttpPost]
        public ActionResult TiepTheo(long? makh, string hoten, long? sodienthoai, long? cmnd, 
            string gmail, DateTime ngayden, DateTime ngaydi, long? maks, string htthanhtoan)
        {
            DateTime now = DateTime.Now;
            if (ngayden.Day == now.Day && ngayden.Month == now.Month && ngayden.Year == now.Year)
            {
                ngayden = now;
            }

            if (ngayden >= now && ngayden <= ngaydi)
            {
                var cart = (List<Cart>)Session[giohang];
                var list = (List<Cart>)cart;
                decimal total = list.Sum(item => item.TongTien()) * demsodem(ngayden, ngaydi);
                decimal tongsoluong = list.Sum(a => a.TongSoLuong());

                var order = new hoadon();
                if (makh != null)
                {
                    order.MaKh = makh;
                }
                order.NgayDat = DateTime.Now;
                order.MaKhachSan = maks;
                order.HoTen = hoten;
                order.SoDienThoai = sodienthoai;
                order.CMND = cmnd;
                order.SoLuongPhong = (long)tongsoluong;
                
                if(htthanhtoan == "taiquay")
                {
                    double tiencoc = (double)total * 0.2;
                    order.TongTien = (long)total - (long)tiencoc;
                    order.DatCoc = (long)tiencoc;
                } else if(htthanhtoan == "chuyenkhoan")
                {
                    order.DatCoc = 0;
                    order.TongTien = (long)total;
                }

                order.Gmail = gmail;
                order.HinhThuc = htthanhtoan;


                //Thêm Order               
                db.hoadons.Add(order);
                db.SaveChanges();
                var id = order.MaHoaDon;
                long mahoadon = order.MaHoaDon;

                foreach (var dem in cart)
                {
                    var cthoadon = new chitiethoadon();
                    cthoadon.MaPhong = dem.htphong.MaPhong;
                    cthoadon.MaHoaDon = id;
                    cthoadon.Gia = dem.htphong.Gia;
                    cthoadon.NgayDen = ngayden;
                    cthoadon.NgayDi = ngaydi;
                    db.chitiethoadons.Add(cthoadon);
                    db.SaveChanges();
                }

                //Xóa hết giỏ hàng
                Session[giohang] = null;
                Session["TongSoLuong"] = 0;
                return RedirectToAction("Payment", "PayNganHang", new {id = mahoadon});

            }
            else
            {
                ngayden = DateTime.Now;
                ngaydi = DateTime.Now.AddDays(1);
                Session["ngayden"] = ngayden;
                Session["ngaydi"] = ngaydi;
                return RedirectToAction("DatPhong", "GioHang", new {maks = maks, sodem = demsodem(ngayden, ngaydi) });
            }
        }


        public ActionResult Next(long? maksphong, DateTime? ngayden = null, DateTime? ngaydi = null)
        {

            if (ngayden == null && ngaydi == null)
            {
                ngayden = DateTime.Now;
                ngaydi = DateTime.Now.AddDays(1);
                Session["ngayden"] = ngayden;
                Session["ngaydi"] = ngaydi;
            }
            else
            {
                DateTime timenow = DateTime.Now;
                if (ngayden.Value.Day == timenow.Day && ngayden.Value.Month == timenow.Month && ngayden.Value.Year == timenow.Year)
                {
                    ngayden = timenow;
                }
                if (ngayden >= timenow && ngayden <= ngaydi)
                {
                    Session["ngayden"] = ngayden;
                    Session["ngaydi"] = ngaydi;
                }
            }

            long sodem = demsodem(ngayden.Value, ngaydi.Value);
            Session["sodem"] = sodem;

            return RedirectToAction("DatPhong", "GioHang", new { maks = maksphong, sodem = sodem });
        }


        public ActionResult CapNhat(long? makh, string hoten, long? sodienthoai, long? cmnd,
                                    string gmail, long? maks, long? maksphong, 
                                    DateTime ngayden, DateTime ngaydi)
        {
            Session["makhachhang"] = makh;
            Session["tenkhachhang"] = hoten;
            Session["sodienthoai"] = sodienthoai;
            Session["gmail"] = gmail;
            Session["cmnd"] = cmnd;

            if (ngayden == null && ngaydi == null)
            {
                ngayden = DateTime.Now;
                ngaydi = DateTime.Now.AddDays(1);
                Session["ngayden"] = ngayden;
                Session["ngaydi"] = ngaydi;
            }
            else
            {
                DateTime timenow = DateTime.Now;
                if (ngayden.Day == timenow.Day && ngayden.Month == timenow.Month && ngayden.Year == timenow.Year)
                {
                    ngayden = timenow;
                }
                if (ngayden >= timenow && ngayden <= ngaydi)
                {
                    Session["ngayden"] = ngayden;
                    Session["ngaydi"] = ngaydi;
                }
            }

            long sodem = demsodem(ngayden, ngaydi);
            Session["sodem"] = sodem;

            return RedirectToAction("DatPhong", "GioHang", new { maks = maks, sodem = sodem });
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

        public ActionResult LichSu(long? makh)
        {
            if (makh == null)
            {
                return RedirectToAction("lichsu_new");
            }
            List<khuvuc> KhuVuc = new List<khuvuc>();
            KhuVuc = db.khuvucs.ToList();
            ViewBag.ListKhuVuc = KhuVuc;

            var list_ls = db.hoadons.Where(m => m.MaKh == makh).OrderByDescending(m => m.NgayDat).ToList();
            return View(list_ls);
        }

        public ActionResult lichsu_new(long? mahd)
        {
            var list = db.chitiethoadons.Where(m => m.MaHoaDon == mahd).ToList();
            return View(list);
        }

        [HttpPost]
        public ActionResult TimKiemHd(long? mahd, string hoten, long? cmnd, long? sdt)
        {
            hoadon hd = db.hoadons.FirstOrDefault(m => m.MaHoaDon == mahd && m.HoTen == hoten
                                                  && m.CMND == cmnd && m.SoDienThoai == sdt);
            if(hd != null)
            {
                Session["MaHoaDon_a"] = hd.MaHoaDon;
                Session["TenKhachSan_a"] = hd.khachsan.TenKhachSan;
                Session["HoTen_a"] = hd.HoTen;
                Session["Sdt_a"] = hd.SoDienThoai;
                Session["Cmnd_a"] = hd.CMND;
                Session["SoLuong_a"] = hd.SoLuongPhong;
                Session["NgayDat_a"] = hd.NgayDat;
                Session["TongTien_a"] = hd.TongTien;
                return RedirectToAction("lichsu_new", "GioHang", new { mahd = hd.MaHoaDon });
            }
            else
            {
                return RedirectToAction("lichsu_new");
            }
        }


        public bool GmailHoaDon(string hoten, long sodienthoai, string gmail, 
                                decimal tongtien, long tongsoluong, long mahd,DateTime ngaydat)
        {
            try
            {
                string content = System.IO.File.ReadAllText(Server.MapPath("~/content/template/hoadon.html"));
                content = content.Replace("{{Hoten}}", hoten);
                content = content.Replace("{{Sdt}}", sodienthoai.ToString());
                content = content.Replace("{{Email}}", gmail);
                content = content.Replace("{{TongTien}}", tongtien.ToString("NO"));
                content = content.Replace("{{Soluongphong}}", tongsoluong.ToString());
                content = content.Replace("{{Mahoadon}}", mahd.ToString());
                content = content.Replace("{{Ngaydat}}", ngaydat.ToString());

                var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
                new MailHelper().SendMail(gmail, "Xác nhận Gmail", content);
                new MailHelper().SendMail(toEmail, "Xác nhận Gmail", content);
            }
            catch (Exception)
            {
                //ghi log
                return false;
            }
            return true;
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
