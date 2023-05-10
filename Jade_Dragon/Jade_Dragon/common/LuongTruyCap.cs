using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Jade_Dragon.Models;

namespace Jade_Dragon.common
{
    public class LuongTruyCap
    {
        public static void TangSoLuongTruyCap()
        {
            using (var context = new Connect())
            {
                var nguoiTruyCap = context.SoLuongNguoiTruyCaps.FirstOrDefault();
                if (nguoiTruyCap == null)
                {
                    nguoiTruyCap = new SoLuongNguoiTruyCap { SoLuongNguoi = 1 };
                    context.SoLuongNguoiTruyCaps.Add(nguoiTruyCap);
                }
                else
                {
                    nguoiTruyCap.SoLuongNguoi += 1;
                    context.Entry(nguoiTruyCap).State = EntityState.Modified;
                }
                context.SaveChanges();
            }
        }


    }
}