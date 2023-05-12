﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;
using static Xamarin.Essentials.Permissions;

namespace Jade_Dragon.Areas.Admin.Controllers
{
    public class PhongManageController : baseController
    {
            private Connect db = new Connect();

            // GET: Admin/QuanLyPhong
            public ActionResult PhongManage(int? MaKS)
            {
                var phongs = db.phongs.Include(p => p.khachsan);
                khachsan ks = db.khachsans.Find(MaKS);
                ViewBag.MaKS = MaKS;
                Session["TenKhachSan"] = ks.TenKhachSan;
                var ListPhong = db.phongs.Where(p => p.MaKhachSan == MaKS).ToList();
                return View("PhongManage", ListPhong);
            }

            // GET: Admin/QuanLyPhong/Details/5
            public ActionResult DetailsManage(int? id, int? MaKS)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                phong phong = db.phongs.Find(id);
                khachsan ks = db.khachsans.Find(MaKS);
                if (phong == null)
                {
                    return HttpNotFound();
                }
                ViewBag.MaKS = MaKS;
                Session["TenKhachSan"] = ks.TenKhachSan;
                return View(phong);
            }


            // GET: Admin/QuanLyPhong/Create
            public ActionResult CreateManage(int? MaKS)
            {
                ViewBag.MaKS = MaKS;

                return View();
            }

            // POST: Admin/QuanLyPhong/Create
            // To protect from overposting attacks, enable the specific properties you want to bind to, for 
            // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
            [HttpPost]
            [ValidateAntiForgeryToken]
            public ActionResult CreateManage(string TenPhong, string LoaiHinh, string Gia, bool VIP, bool? KhoaPhong, long? MaKS)
            {
                decimal GiaTien = decimal.Parse(Gia);
                var ph = db.phongs.Where(m => m.MaKhachSan == MaKS).ToList();
                foreach (var Phong in ph)
                {
                    if (TenPhong == Phong.TenPhong)
                    {
                        return View();
                    }
                }

                if (KhoaPhong != true && KhoaPhong != false)
                {
                    KhoaPhong = false;
                }

                var phph = new phong();
                {
                    phph.TenPhong = TenPhong;
                    phph.LoaiHinh = LoaiHinh;
                    phph.Gia = (long?)GiaTien;
                    phph.VIP = VIP;
                    phph.MaKhachSan = MaKS;
                    phph.TrangThai = !KhoaPhong;
                    phph.KhoaPhong = KhoaPhong;
                }
                db.phongs.Add(phph);
                db.SaveChanges();

                return Redirect("~/Admin/PhongManage/PhongManage?MaKS=" + MaKS);
            }

            // GET: Admin/QuanLyPhong/Edit/5
            public ActionResult EditManage(int? id, int? MaKS)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                phong phong = db.phongs.Find(id);
                khachsan ks = db.khachsans.Find(MaKS);
                if (phong == null)
                {
                    return HttpNotFound();
                }
                ViewBag.MaKhachSan = new SelectList(db.khachsans, "MaKhachSan", "TenKhachSan", phong.MaKhachSan);
                ViewBag.MaKS = MaKS;
                Session["TenKhachSan"] = ks.TenKhachSan;
                Session["TenPhong"] = phong.TenPhong;
                return View(phong);
            }

            // POST: Admin/QuanLyPhong/Edit/5
            // To protect from overposting attacks, enable the specific properties you want to bind to, for 
            // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
            [HttpPost]
            [ValidateAntiForgeryToken]
            public ActionResult EditManage([Bind(Include = "MaPhong,TenPhong,LoaiHinh,Gia,VIP,MaKhachSan,TrangThai,KhoaPhong")] phong phong, int? MaKS)
            {
                if (ModelState.IsValid)
                {
                    db.Entry(phong).State = EntityState.Modified;
                    phong.TrangThai = !phong.KhoaPhong;
                    db.SaveChanges();
                    return Redirect("~/Admin/PhongManage/PhongManage?MaKS=" + MaKS);
                }
                ViewBag.MaKhachSan = new SelectList(db.khachsans, "MaKhachSan", "TenKhachSan", phong.MaKhachSan);
                return View(phong);
            }

            // GET: Admin/QuanLyPhong/Delete/5
            public ActionResult DeleteManage(int? id, int? MaKS)
            {
                phong ph = db.phongs.FirstOrDefault(x => x.MaPhong == id);
                db.phongs.Remove(ph);
                db.SaveChanges();
                return Redirect("~/Admin/PhongManage/PhongManage?MaKS=" + MaKS);
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