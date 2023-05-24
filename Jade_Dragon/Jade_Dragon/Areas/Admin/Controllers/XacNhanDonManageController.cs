using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class XacNhanDonManageController : baseController
    {
        private Connect db = new Connect();
        public ActionResult DanhSachDon(long maks)
        {
            HtLichSu ls = new HtLichSu();
            ls.hd = db.hoadons.Where(m => m.MaKhachSan == maks).ToList();
            ls.cthd = db.chitiethoadons.ToList();
            return View("DanhSachDon", ls);
        }

        public ActionResult XacNhanDon(long mahd)
        {
            hoadon hd = db.hoadons.Find(mahd);
            long ma = (long)hd.MaKhachSan;
            if (hd == null)
            {
                return Redirect("~/trangchu/trangchu");
            }
            else
            {
                hd.DaDat = true;
                hd.MaError = "00";
                db.SaveChanges();
            }
            return RedirectToAction("DanhSachDon", "XacNhanDonManage", new {maks = ma});
        }

        public ActionResult XoaDon(long mahd)
        {
            hoadon hd = db.hoadons.Find(mahd);
            long ma = (long)hd.MaHoaDon;
            if (hd == null)
            {
                return Redirect("~/trangchu/tramhchu");
            }
            else
            {
                var ct = db.chitiethoadons.Where(m => m.MaHoaDon == mahd).ToList();
                if (ct.Any())
                {
                    foreach (var m in ct)
                    {
                        var Time = db.Moc_Time.Where(n => n.MaPhong == m.MaPhong &&
                                                          n.NgayDen == m.NgayDen &&
                                                          n.NgayDi == m.NgayDi).ToList();
                        foreach (var m2 in Time)
                        {
                            db.Moc_Time.Remove(m2);
                            db.SaveChanges();
                        }
                        db.chitiethoadons.Remove(m);
                    }
                    db.SaveChanges();
                }
                db.hoadons.Remove(hd);
            }
            db.SaveChanges();
            return RedirectToAction("DanhSachDon", "XacNhanDonManage", new { maks = ma });
        }

        public ActionResult XoaChiTietDon(long? mact)
        {
            chitiethoadon ct = db.chitiethoadons.Find(mact);
            long mahoadon = (long)ct.MaHoaDon;
            hoadon hoadonn = db.hoadons.Find(mahoadon);
            if (ct == null)
            {
                return Redirect("DanhSachDon");
            }
            else
            {
                Moc_Time time = db.Moc_Time.FirstOrDefault(n => n.MaPhong == ct.MaPhong &&
                                                          n.NgayDen == ct.NgayDen &&
                                                          n.NgayDi == ct.NgayDi);
                db.Moc_Time.Remove(time);
                db.chitiethoadons.Remove(ct);
                hoadonn.SoLuongCTHD = hoadonn.SoLuongCTHD - 1;
                hoadonn.SoLuongPhong = hoadonn.SoLuongPhong - 1;
                db.SaveChanges();
            }
            var cthd = db.chitiethoadons.Where(c => c.MaHoaDon == mahoadon).ToList();
            if (cthd.Count() == 0)
            {
                db.hoadons.Remove(hoadonn);
                db.SaveChanges();
            }
            return RedirectToAction("DanhSachDon", "XacNhanDonManage", new { maks = hoadonn.MaHoaDon });
        }
    }
}