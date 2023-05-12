using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using DocumentFormat.OpenXml.EMMA;
using Jade_Dragon.common;
using Jade_Dragon.Models;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class QLKhachHangController : baseController
    {
        private Connect db = new Connect();

        // GET: Admin/QLKhachHang
        public ActionResult QuanLyKh()
        {
            var khachhangs = db.khachhangs.Include(k => k.UserGroup);
            var ListKh = db.khachhangs.ToList();    
            return View("QuanLyKh", ListKh);
        }

        public ActionResult QuanLyKhManage()
        {
            var khachhangs = db.khachhangs.Include(k => k.UserGroup);
            var ListKh = db.khachhangs.Where(m => m.IDGroup == 2 || m.IDGroup == 3).ToList();
            return View("QuanLyKhManage", ListKh);
        }

        // GET: Admin/QLKhachHang/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khachhang khachhang = db.khachhangs.Find(id);
            if (khachhang == null)
            {
                return HttpNotFound();
            }
            return View(khachhang);
        }

        // GET: Admin/Test/Create
        public ActionResult Create()
        {
            ViewBag.KhachSans = new List<SelectListItem>
            {
                new SelectListItem { Text = "Không chọn khách sạn", Value = "" }
            }.Concat(db.khachsans.Select(k => new SelectListItem { Text = k.TenKhachSan, Value = k.MaKhachSan.ToString() }));

            ViewBag.QLKhachSan = new SelectList(db.khachsans, "MaKhachSan", "TenKhachSan");
            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name");
            return View();
        }

        // POST: Admin/Test/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaKh,HoTen,SoDienThoai,CMND,DiaChi,Gmail,Avt,TenDn,Mk,IDGroup,Code,DaXacMinh,QLKhachSan")] khachhang khachhang, HttpPostedFileBase uploadhinh)
        {
            if (ModelState.IsValid)
            {
                db.khachhangs.Add(khachhang);
                khachhang.DaXacMinh = true;
                khachhang.Mk = GetMD5(khachhang.Mk);
                db.SaveChanges();
                Up_IMG(khachhang, uploadhinh);
                return RedirectToAction("QuanLyKh");
            }

            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name", khachhang.IDGroup);
            return View(khachhang);
        }

        // GET: Admin/Test/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khachhang khachhang = db.khachhangs.Find(id);
            if (khachhang == null)
            {
                return HttpNotFound();
            }
            ViewBag.KhachSans = new List<SelectListItem>
            {
                new SelectListItem { Text = "Không chọn khách sạn", Value = "" }
            }.Concat(db.khachsans.Select(k => new SelectListItem { Text = k.TenKhachSan, Value = k.MaKhachSan.ToString() }));
            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name", khachhang.IDGroup);
            Session["HoTen"] = khachhang.HoTen;
            return View(khachhang);
        }

        // POST: Admin/Test/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaKh,HoTen,SoDienThoai,CMND,DiaChi,Gmail," +
            "Avt,TenDn,Mk,IDGroup,Code,DaXacMinh,QLKhachSan")] khachhang khachhang, HttpPostedFileBase uploadhinh)
        {
            if (ModelState.IsValid)
            {
                /*db.Entry(khachhang).State = EntityState.Modified;*/

                khachhang unv = db.khachhangs.FirstOrDefault(x => x.MaKh == khachhang.MaKh);

                unv.HoTen = khachhang.HoTen;
                unv.SoDienThoai = khachhang.SoDienThoai;
                unv.CMND = khachhang.CMND;
                unv.DiaChi = khachhang.DiaChi;
                unv.Gmail = khachhang.Gmail;
                unv.TenDn = khachhang.TenDn;
                unv.IDGroup = khachhang.IDGroup;
                unv.QLKhachSan = khachhang.QLKhachSan;

                if (unv.Mk != khachhang.Mk)
                {
                    unv.Mk = GetMD5(khachhang.Mk);
                } 

                unv.DaXacMinh = khachhang.DaXacMinh;

                if (uploadhinh != null && uploadhinh.ContentLength > 0)
                {
                    long id = khachhang.MaKh;

                    string _FileName = "";
                    string code = RandomCode();
                    int index = uploadhinh.FileName.IndexOf('.');
                    _FileName = "nv" + code + "." + uploadhinh.FileName.Substring(index + 1);
                    string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachHang"), _FileName);
                    uploadhinh.SaveAs(_path);
                    unv.Avt = _FileName;
                }

                db.SaveChanges();
                return Redirect("~/Admin/QLKhachHang/Details/" + khachhang.MaKh);
            }
            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name", khachhang.IDGroup);
            return View(khachhang);
        }

        // GET: Admin/QLKhachHang/Delete/5
        public ActionResult Delete(long id)
        {
            List<tinnhan> tn = db.tinnhans.Where(m => m.MaKh == id).ToList();
            List<tinnhanAdmin> tnAdmin = db.tinnhanAdmins.Where(n => n.IdNguoiGui == id || n.IdNguoiNhan == id).ToList();
            List<hoadon> hd = db.hoadons.Where(c => c.MaKh == id).ToList();

            if(tn != null)
            {
                foreach(var i in tn)
                {
                    db.tinnhans.Remove(i);
                }
            }
            if(tnAdmin != null)
            {
                foreach(var o in tnAdmin)
                {
                    db.tinnhanAdmins.Remove(o);
                }
            }
            if(hd != null)
            {
                foreach (var j in hd)
                {
                    j.MaKh = null;
                }
            }
            db.SaveChanges();

            khachhang kh = db.khachhangs.FirstOrDefault(x => x.MaKh == id);
            db.khachhangs.Remove(kh);
            db.SaveChanges();
            return RedirectToAction("QuanLyKh");
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        [HttpPost]
        public ActionResult Up_IMG(khachhang kh, HttpPostedFileBase uploadhinh)
        {
            if (uploadhinh != null && uploadhinh.ContentLength > 0)
            {
                int id = int.Parse(db.khachhangs.ToList().Last().MaKh.ToString());

                string _FileName = "";
                string code = RandomCode();
                int index = uploadhinh.FileName.IndexOf('.');
                _FileName = "nv" + code + "." + uploadhinh.FileName.Substring(index + 1);
                string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachHang"), _FileName);
                uploadhinh.SaveAs(_path);

                khachhang unv = db.khachhangs.FirstOrDefault(x => x.MaKh == id);
                unv.Avt = _FileName;
                db.SaveChanges();
            }
            return View();
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

        public ActionResult XoaAnh(long? kh)
        {
            khachhang khachhang = db.khachhangs.Find(kh);
            khachhang.Avt = null;
            db.SaveChanges();
            return Redirect("~/Admin/QLKhachHang/Details/" + khachhang.MaKh);
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
