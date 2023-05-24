using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;

namespace Jade_Dragon.Controllers
{
    public class trangchuController : Controller
    {
        private Connect db = new Connect();

        // GET: trangchu
        public ActionResult trangchu(long? ma, string searchTerm, string searchType)
        {
            var ksks = db.PhongKhachSans.ToList();
            foreach (var k in ksks)
            {
                if (k.TrangThai == false)
                {
                    k.TrangThai = true;
                    db.SaveChanges();
                }
            }

            Session["DongTime"] = "mo";
            DateTime timenow = DateTime.Now;
            if (ksks != null)
            {
                foreach (var mm in ksks)
                {
                    if (mm.KhoaPhong == true)
                    {
                        mm.TrangThai = false; db.SaveChanges();
                    }
                    else
                    {
                        var cthd = db.chitiethoadons.Where(m => m.MaPhong == mm.MaPhong).ToList();
                        if (cthd.Count() > 0)
                        {
                            foreach (var ct in cthd)
                            {
                                if(ct.HoanThanh == false)
                                {
                                    if (ct.hoadon.DaDat == true)
                                    {
                                        if (ct.NgayDen <= timenow && timenow <= ct.NgayDi)
                                        {
                                            mm.TrangThai = false;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            KhachSanTrinhChieu m = new KhachSanTrinhChieu();
            var khachsans = db.khachsans.Include(k => k.khuvuc);

            foreach (var i in khachsans)
            {
                var phong = db.PhongKhachSans.Where(m => m.MaKhachSan == i.MaKhachSan).ToList();

                bool tatCaPhongFalse = true;

                foreach (var p in phong)
                {
                    if (p.TrangThai == true)
                    {
                        tatCaPhongFalse = false;
                        break;
                    }
                }

                if (tatCaPhongFalse)
                {
                    i.TrangThaiKs = false;
                }
                else
                {
                    i.TrangThaiKs = true;
                }
            }

            db.SaveChanges();


            // Thực hiện tìm kiếm nếu có giá trị tìm kiếm được truyền vào
            if (!string.IsNullOrEmpty(searchTerm) && !string.IsNullOrEmpty(searchType))
            {
                var searchResult = TimKiem(searchTerm, searchType);
                m.ks = searchResult;
            }
            else if (ma != null)
            {
                m.ks = khachsans.Where(n => n.MaKhuVuc == ma).ToList();
            }
            else
            {
                m.ks = khachsans.ToList();
            }

            m.kv = db.khuvucs.ToList();

            return View("trangchu", m);
        }

        public List<khachsan> TimKiem(string searchTerm, string searchType)
        {
            IQueryable<khachsan> query = db.khachsans;
            switch (searchType.ToLower())
            {
                case "name":
                    query = query.Where(c => c.TenKhachSan.Contains(searchTerm));
                    break;
                case "address":
                    query = query.Where(c => c.DiaChi.Contains(searchTerm));
                    break;
                case "phone":
                    long phoneNumber;
                    if (long.TryParse(searchTerm, out phoneNumber))
                    {
                        query = query.Where(c => c.SoDienThoai == phoneNumber);
                    }
                    break;
                case "khuvuc":
                    query = query.Where(c => c.khuvuc.TenKhuVuc.Contains(searchTerm));
                    break;
                case "all":
                    query = query.Where(c =>
                        c.TenKhachSan.Contains(searchTerm) ||
                        c.DiaChi.Contains(searchTerm) ||
                        c.SoDienThoai.ToString().Contains(searchTerm) ||
                        c.khuvuc.TenKhuVuc.Contains(searchTerm)
                    );
                    break;
                default:
                    break;
            }
            return query.ToList();
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
