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
            var ks = db.khachsans.ToList();
            if(ks.Count() > 0)
            {
                foreach(var k in ks)
                {
                    ThongKeDanhGia tk = db.ThongKeDanhGias.FirstOrDefault(a => a.MaKhachSan == k.MaKhachSan);
                    k.ThangDiem = ((tk.MotSao * 1) + (tk.HaiSao * 2) + (tk.BaSao * 3) + (tk.BonSao * 4) + (tk.NamSao * 5)) / 5;
                    db.SaveChanges();
                }
            }
            
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
            var ks = db.khachsans.ToList();
            return View("Create", ks);
        }

        // POST: Admin/khachsans/Create
        [HttpPost]
        public ActionResult DangKyKs(string TenKhachSan, long SoDienThoai, string Gmail, string DiaChi,
            string GiaTien, string KinhDo, string ViDo, string TenKhuVuc, HttpPostedFileBase Avt)
        {
            int dem = 1;
            var ten = db.khachsans.ToList();
            if(ten.Count > 0)
            {
                foreach (var kss in ten)
                {
                    if (TenKhachSan == kss.TenKhachSan)
                    {
                        TenKhachSan = TenKhachSan + "(" + dem.ToString() + ")";
                        dem++;
                    }
                }
            }
            khuvuc khuvuc = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);
            decimal Gia = decimal.Parse(GiaTien);
            if (khuvuc == null)
            {
                var kv = new khuvuc();
                {
                    kv.TenKhuVuc = TenKhuVuc;
                    kv.KinhDo = KinhDo.ToString();
                    kv.ViDo = ViDo.ToString();
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
                    ks.KinhDo = KinhDo.ToString();
                    ks.ViDo = ViDo.ToString();
                    ks.Gia = (long?)Gia;
                    ks.SoTang = 1;
                    ks.MaKhuVuc = k_v.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, Avt);
            }
            else
            {
                var ks = new khachsan();
                {
                    ks.TenKhachSan = TenKhachSan;
                    ks.SoDienThoai = SoDienThoai;
                    ks.Gmail = Gmail;
                    ks.DiaChi = DiaChi;
                    ks.KinhDo = KinhDo.ToString();
                    ks.ViDo = ViDo.ToString();
                    ks.Gia = (long?)Gia;
                    ks.SoTang = 1;
                    ks.MaKhuVuc = khuvuc.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, Avt);
            }

            khachsan khach__san = db.khachsans.FirstOrDefault(k => k.TenKhachSan == TenKhachSan);
            PhongKhachSan phks = new PhongKhachSan();
            phks.MaKhachSan = khach__san.MaKhachSan;
            phks.MaSoTang = 1;
            phks.MaSoPhong = 1;
            phks.TenPhong = "B101";
            phks.LoaiHinh = "Đơn";
            phks.Gia = (long?)Gia;
            phks.VIP = false;
            phks.TrangThai = false;
            phks.KhoaPhong = true;
            db.PhongKhachSans.Add(phks);
            db.SaveChanges();

            ThongKeDanhGia moi = new ThongKeDanhGia();
            moi.MotSao = 0;
            moi.HaiSao = 0;
            moi.BaSao = 0;
            moi.BonSao = 0;
            moi.NamSao = 0;
            moi.TongSao = 0;
            moi.MaKhachSan = khach__san.MaKhachSan;
            db.ThongKeDanhGias.Add(moi);
            db.SaveChanges();
            return Redirect("Create");
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
            khachhang kh = db.khachhangs.FirstOrDefault(m => m.QLKhachSan == id);
            if(kh != null)
            {
                kh.QLKhachSan = null;
            }

            List<hoadon> hd = db.hoadons.Where(c => c.MaKhachSan == id).ToList();
            if(hd != null)
            {
                foreach(hoadon h in hd)
                {
                    h.MaKhachSan = null;
                    db.SaveChanges();
                }
            }
            List<SoSaoDanhGia> so = db.SoSaoDanhGias.Where(a => a.MaKhachSan == id).ToList();
            if (so != null)
            {
                foreach (var l in so)
                {
                    db.SoSaoDanhGias.Remove(l);
                }
            }
            List<ThongKeDanhGia> tk = db.ThongKeDanhGias.Where(a => a.MaKhachSan == id).ToList();
            if (tk != null)
            {
                foreach (var q in tk)
                {
                    db.ThongKeDanhGias.Remove(q);
                }
            }
            List<PhongKhachSan> phong = db.PhongKhachSans.Where(x => x.MaKhachSan == id).ToList();
            if (phong != null)
            {
                foreach (var dem in phong)
                {
                    db.PhongKhachSans.Remove(dem);
                }
            }
            List<PhongChat> phongChat = db.PhongChats.Where(l => l.MaKhachSan == id).ToList();
            if (phongChat != null)
            {
                foreach (var chat in phongChat)
                {
                    List<tinnhan> tn = db.tinnhans.Where(k => k.MaPhongChat == chat.MaPhongChat).ToList();
                    if (tn != null)
                    {
                        foreach (var t in tn)
                        {
                            db.tinnhans.Remove(t);
                        }
                    }
                    db.SaveChanges();
                    db.PhongChats.Remove(chat);
                }
            }
            db.SaveChanges();

            khachsan ks = db.khachsans.FirstOrDefault(x => x.MaKhachSan == id);
            db.khachsans.Remove(ks);
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

        /*------------------Manage------------------------*/

        public ActionResult CreateManage()
        {
            var ks = db.khachsans.ToList();
            return View("CreateManage", ks);
        }

        // POST: Admin/khachsans/Create
        [HttpPost]
        public ActionResult CreateManage(string TenKhachSan, long SoDienThoai, string Gmail, string DiaChi,
            string GiaTien, string KinhDo, string ViDo, string TenKhuVuc, long khachhang_map, HttpPostedFileBase Avt)
        {
            khuvuc khuvuc = db.khuvucs.FirstOrDefault(m => m.TenKhuVuc == TenKhuVuc);
            decimal Gia = decimal.Parse(GiaTien);
            if (khuvuc == null)
            {
                var kv = new khuvuc();
                {
                    kv.TenKhuVuc = TenKhuVuc;
                    kv.KinhDo = KinhDo.ToString();
                    kv.ViDo = ViDo.ToString();
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
                    ks.KinhDo = KinhDo.ToString();
                    ks.ViDo = ViDo.ToString();
                    ks.Gia = (long?)Gia;
                    ks.SoTang = 1;
                    ks.MaKhuVuc = k_v.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, Avt);
            }
            else
            {
                var ks = new khachsan();
                {
                    ks.TenKhachSan = TenKhachSan;
                    ks.SoDienThoai = SoDienThoai;
                    ks.Gmail = Gmail;
                    ks.DiaChi = DiaChi;
                    ks.KinhDo = KinhDo.ToString();
                    ks.ViDo = ViDo.ToString();
                    ks.Gia = (long?)Gia;
                    ks.SoTang = 1;
                    ks.MaKhuVuc = khuvuc.MaKhuVuc;
                    ks.TrangThaiKs = true;
                }
                db.khachsans.Add(ks);
                db.SaveChanges();
                Up_IMG(ks, Avt);
            }
            khachsan ksks = db.khachsans.FirstOrDefault(m => m.TenKhachSan == TenKhachSan);
            khachhang khkh = db.khachhangs.Find(khachhang_map);
            khkh.QLKhachSan = ksks.MaKhachSan;
            db.SaveChanges();
            Session["MaKhachSan_ks"] = ksks.MaKhachSan;

            PhongKhachSan phks = new PhongKhachSan();
            phks.MaKhachSan = ksks.MaKhachSan;
            phks.MaSoTang = 1;
            phks.MaSoPhong = 1;
            phks.TenPhong = "B101";
            phks.LoaiHinh = "Đơn";
            phks.Gia = (long?)Gia;
            phks.VIP = false;
            phks.TrangThai = false;
            phks.KhoaPhong = true;
            db.PhongKhachSans.Add(phks);
            db.SaveChanges();
            return Redirect("~/Admin/QLKhachSan/EditManage/" + ksks.MaKhachSan);
        }

        // GET: Admin/khachsans/Edit/5
        public ActionResult EditManage(long? id)
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
        public ActionResult EditManage(long MaKhachSan, string TenKhachSan, long SoDienThoai, string Gmail, string DiaChi,
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
                    return Redirect("~/Admin/QLKhachSan/EditManage/" + ks.MaKhachSan);
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
            return Redirect("~/Admin/QLKhachSan/EditManage/" + ks.MaKhachSan);
        }

        public ActionResult DeleteManage(long? id)
        {
            khachhang kh = db.khachhangs.FirstOrDefault(m => m.QLKhachSan == id);
            kh.QLKhachSan = null;

            List<hoadon> hd = db.hoadons.Where(c => c.MaKhachSan == id).ToList();
            if (hd != null)
            {
                foreach (hoadon h in hd)
                {
                    h.MaKhachSan = null;
                    db.SaveChanges();
                }
            }
            List<PhongKhachSan> phong = db.PhongKhachSans.Where(x => x.MaKhachSan == id).ToList();
            if (phong != null)
            {
                foreach (var dem in phong)
                {
                    db.PhongKhachSans.Remove(dem);
                }
            }
            List<PhongChat> phongChat = db.PhongChats.Where(l => l.MaKhachSan == id).ToList();
            if(phongChat != null)
            {
                foreach (var chat in phongChat)
                {
                    List<tinnhan> tn = db.tinnhans.Where(k => k.MaPhongChat == chat.MaPhongChat).ToList();
                    if (tn != null)
                    {
                        foreach(var t in tn)
                        {
                            db.tinnhans.Remove(t);
                        }
                    }
                    db.SaveChanges();
                    db.PhongChats.Remove(chat);
                }
            }
            db.SaveChanges();

            khachsan ks = db.khachsans.FirstOrDefault(x => x.MaKhachSan == id);
            db.khachsans.Remove(ks);
            db.SaveChanges();
            Session["MaKhachSan_ks"] = null;
            return RedirectToAction("CreateManage");
        }

        public ActionResult XoaAnhManage(long? ks)
        {
            khachsan khachsan = db.khachsans.Find(ks);
            khachsan.AnhKs = null;

            db.SaveChanges();
            return Redirect("~/Admin/QLKhachSan/EditManage/" + khachsan.MaKhachSan);
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
