using Jade_Dragon.common;
using Jade_Dragon.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Jade_Dragon.Controllers
{
    public class UserController : Controller
    {
        private Connect db = new Connect();
        // GET: User
        public ActionResult TrangCaNhan(long? id)
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
            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name", khachhang.IDGroup);
            return View(khachhang);
        }

        // POST: Admin/Test/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TrangCaNhan([Bind(Include = "MaKh,HoTen,SoDienThoai,CMND,DiaChi,Gmail,TheNganHang," +
            "TenNganHang,Avt,TenDn,Mk,IDGroup,Code,DaXacMinh")] khachhang khachhang, HttpPostedFileBase uploadhinh)
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

                if (unv.Mk != khachhang.Mk)
                {
                    unv.Mk = GetMD5(khachhang.Mk);
                }

                unv.DaXacMinh = khachhang.DaXacMinh;

                if (uploadhinh != null && uploadhinh.ContentLength > 0)
                {
                    long id = khachhang.MaKh;
                    string _FileName = "";
                    string code_name = GenerateVerificationCode();
                    int index = uploadhinh.FileName.IndexOf('.');
                    _FileName = "nv" + code_name + "a" + "." + uploadhinh.FileName.Substring(index + 1);
                    string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachHang"), _FileName);
                    uploadhinh.SaveAs(_path);
                    unv.Avt = _FileName;
                }

                db.SaveChanges();
                return Redirect("~/User/TrangCaNhan/" + khachhang.MaKh);
            }
            ViewBag.IDGroup = new SelectList(db.UserGroups, "IDGroup", "Name", khachhang.IDGroup);
            return View(khachhang);
        }

        public ActionResult QuenMatKhau(long? id)
        {
            khachhang kh = db.khachhangs.Find(id);
            kh.Code = GenerateVerificationCode();
            db.SaveChanges();
            Session["MaKh"] = kh.MaKh;
            XacNhanGmail(kh.HoTen, "", kh.Gmail, "", "", kh.Code);
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult XacNhan(string Code, long MaKH, string Mk, string NhapLai)
        {
            if (Request.Cookies["Code"] != null)
            {
                Code = Request.Cookies["Code"].Value;
                MaKH = long.Parse(Request.Cookies["MaKH"].Value);
                Mk = Request.Cookies["Mk"].Value;
            }
            khachhang KhachHang = db.khachhangs.Find(MaKH);
            if (db.khachhangs.Where(m => m.Code == Code).Count() > 0)
            {
                if(KhachHang.Mk == GetMD5(Mk))
                {
                    KhachHang.Mk = GetMD5(NhapLai);
                    db.SaveChanges();
                    return Redirect("~/Admin/Account/Login");
                }
                else
                {
                    return Redirect("~/trangchu/trangchu");
                }
            }
            else
                return Redirect("~/trangchu/trangchu");
        }

        [HttpPost]
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
                string code_name = GenerateVerificationCode();
                int index = uploadhinh.FileName.IndexOf('.');
                _FileName = "nv" + code_name + "." + uploadhinh.FileName.Substring(index + 1);
                string _path = Path.Combine(Server.MapPath("~/UpLoad_Img/KhachHang"), _FileName);
                uploadhinh.SaveAs(_path);

                khachhang unv = db.khachhangs.FirstOrDefault(x => x.MaKh == id);
                unv.Avt = _FileName;
                db.SaveChanges();
            }
            return View();
        }

        public ActionResult XoaAnh(long? kh)
        {
            khachhang khachhang = db.khachhangs.Find(kh);
            khachhang.Avt = null;
            db.SaveChanges();
            return Redirect("~/Admin/QLKhachHang/Details/" + khachhang.MaKh);
        }

        public bool XacNhanGmail(string HoTen, string sdt, string Gmail, string DiaChi, string CMND, string Ma)
        {
            try
            {
                string content = System.IO.File.ReadAllText(Server.MapPath("~/content/template/QuenMatKhau.html"));
                content = content.Replace("{{CustomerName}}", HoTen);
                content = content.Replace("{{Phone}}", sdt);
                content = content.Replace("{{Email}}", Gmail);
                content = content.Replace("{{Address}}", DiaChi);
                content = content.Replace("{{CMND}}", CMND);
                content = content.Replace("{{MaXacNhan}}", Ma);
                var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();

                // Để Gmail cho phép SmtpClient kết nối đến server SMTP của nó với xác thực 
                //là tài khoản gmail của bạn, bạn cần thiết lập tài khoản email của bạn như sau:
                //Vào địa chỉ https://myaccount.google.com/security  Ở menu trái chọn mục Bảo mật, sau đó tại mục Quyền truy cập 
                //của ứng dụng kém an toàn phải ở chế độ bật
                //  Đồng thời tài khoản Gmail cũng cần bật IMAP
                //Truy cập địa chỉ https://mail.google.com/mail/#settings/fwdandpop

                new MailHelper().SendMail(Gmail, "Xác nhận Gmail", content);
                new MailHelper().SendMail(toEmail, "Xác nhận Gmail", content);
            }
            catch (Exception)
            {
                //ghi log
                return false;
            }
            return true;
        }

        public string GenerateVerificationCode()
        {
            int codeLength = 6; // Độ dài của mã xác minh
            Random random = new Random();
            string code = "";

            for (int i = 0; i < codeLength; i++)
            {
                int digit = random.Next(0, 9); // Lấy ngẫu nhiên một số từ 0 đến 9
                code += digit.ToString(); // Thêm số vào chuỗi mã xác minh
            }

            return code;
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