using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Areas.Admin.Controllers;
using Jade_Dragon.common;
using Jade_Dragon.Models;
using PagedList;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Menu;

namespace Jade_Dragon.Controllers
{
    public class khachsanController : Controller
    {
        private Connect db = new Connect();
        private const string giohang = "giohang";

        // GET: khachsan
        public ActionResult khachsan(int? page, string searchTerm, string searchType, 
            long? ma, string loai, long? gia, string vip, string trangthai, DateTime? batdau = null, DateTime? ketthuc = null)
        {
            hienthiphong m = new hienthiphong();
            List<khachsan> list = new List<khachsan>();
            list = db.khachsans.ToList();

            DateTime timenow = DateTime.Now;
            List<phong> list2 = new List<phong>();
            list2 = db.phongs.ToList();

            if(batdau == null && ketthuc == null)
            {
                foreach (var item in list2)
                {
                    if (item.NgayBatDau != null && item.NgayKetThuc != null)
                    {
                        if (item.NgayBatDau <= timenow && timenow <= item.NgayKetThuc)
                        {
                            item.TrangThai = false;
                        }
                        else
                        {
                            item.TrangThai = true;
                        }
                    }
                }
            }
            else
            {
                if(batdau > ketthuc)
                {
                    DateTime tam = (DateTime)batdau;
                    batdau = ketthuc;
                    ketthuc = tam;

                }
                long sodem = demsodem((DateTime)batdau, (DateTime)ketthuc);
                for(long i=0; i<= sodem; i++)
                {
                    DateTime day = batdau.Value.AddDays(i);
                    foreach (var item in list2)
                    {
                        if (item.NgayBatDau != null && item.NgayKetThuc != null)
                        {
                            if (item.NgayBatDau <= day && day <= item.NgayKetThuc)
                            {
                                item.TrangThai = false;
                                i = sodem;
                            }
                            else
                            {
                                item.TrangThai = true;
                            }
                        }
                    }
                }
            }
            db.SaveChanges();
            

            int pageSize = 6; // số lượng phần tử hiển thị trong mỗi trang
            int pageNumber = (page ?? 1); // trang hiện tại, mặc định là trang đầu tiên
            var Phong = db.phongs.Include(k => k.khachsan);

            if (ma != null)
            {
                Phong = Phong.Where(a => a.MaKhachSan == ma);
            }
            if (loai != null)
            {
                Phong = Phong.Where(a => a.LoaiHinh == loai);
            }
            if (gia != null)
            {
                Phong = Phong.Where(a => a.Gia == gia);
            }
            if (vip != null)
            {
                bool isVip = vip.ToLower() == "true";
                Phong = Phong.Where(a => a.VIP == isVip);
            }
            if (trangthai != null)
            {
                bool isTrangThai = trangthai.ToLower() == "true";
                Phong = Phong.Where(a => a.TrangThai == isTrangThai);
            }

            m.ph = Phong.OrderBy(x => x.TenPhong)
                         .Skip((pageNumber - 1) * pageSize)
                         .Take(pageSize)
                         .ToList();

            int totalItems = Phong.Count();
            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            ViewBag.TotalItems = totalItems;
            ViewBag.TotalPages = totalPages;
            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;

            m.ks = list;
            m.ctphong = list2;

            if (!string.IsNullOrEmpty(searchTerm) && !string.IsNullOrEmpty(searchType))
            {
                var searchResult = TimKiem(searchTerm, searchType);
                m.ph = searchResult.OrderBy(x => x.TenPhong).ToList();
                m.ph = m.ph.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
                ViewBag.TotalItems = m.ph.Count();
                ViewBag.TotalPages = (int)Math.Ceiling((double)m.ph.Count() / pageSize);
                ViewBag.PageNumber = pageNumber;
                ViewBag.PageSize = pageSize;
            }
            DateTime time_now = DateTime.Now.AddDays(-1);
            DateTime time_max = DateTime.Now.AddDays(30);
            ViewBag.time_now = loadtime(time_now);
            ViewBag.time_max = loadtime(time_max);
            Session["batdau"] = batdau;
            Session["ketthuc"] = ketthuc;

            return View("khachsan", m);
        }

        public List<phong> TimKiem(string searchTerm, string searchType)
        {
            IQueryable<phong> query = db.phongs;
            switch (searchType.ToLower())
            {
                case "khachsan":
                    query = query.Where(c => c.khachsan.TenKhachSan.Contains(searchTerm));
                    break;
                case "name":
                    query = query.Where(c => c.TenPhong.Contains(searchTerm));
                    break;
                case "gia":
                    long Gia;
                    if (long.TryParse(searchTerm, out Gia))
                    {
                        query = query.Where(c => c.Gia == Gia);
                    }
                    break;
                case "all":
                    query = query.Where(c =>
                        c.khachsan.TenKhachSan.Contains(searchTerm) ||
                        c.TenPhong.Contains(searchTerm) ||
                        c.Gia.ToString().Contains(searchTerm)
                    );
                    break;
                default:
                    break;
            }
            return query.ToList();
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

        public ActionResult QuayVe()
        {
            Session["batdau"] = null;
            Session["ketthuc"] = null;
            return Redirect("khachsan");
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
