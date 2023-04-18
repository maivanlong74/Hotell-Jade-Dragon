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
            KhachSanTrinhChieu m = new KhachSanTrinhChieu();
            List<khuvuc> list = new List<khuvuc>();
            list = db.khuvucs.ToList();

            var khachsans = db.khachsans.Include(k => k.khuvuc);

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

            m.kv = list;

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
