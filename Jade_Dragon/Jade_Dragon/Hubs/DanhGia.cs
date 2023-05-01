using DocumentFormat.OpenXml.Presentation;
using DocumentFormat.OpenXml.Wordprocessing;
using Jade_Dragon.Models;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Jade_Dragon.Hubs
{
    [HubName("danhgia")]
    public class DanhGia : Hub
    {
        private Connect db = new Connect();

        public void Create_DanhGia(long sosao, long maks, long makh)
        {
            DanhGiaK ks = db.DanhGiaKs.FirstOrDefault(m => m.MaKh == makh && m.MaKs == maks);
            if(ks != null)
            {
                var dg = new DanhGiaK();
                {
                    dg.MaKh = makh;
                    dg.MaKs = maks;
                    dg.SoSao = sosao;
                }
                db.DanhGiaKs.Add(dg);
                db.SaveChanges();
            }

            Clients.All.DanhGia(sosao, maks, makh);
        }

        public void Get_DanhGia(long maks, long makh)
        {
            DanhGiaK dg = db.DanhGiaKs.FirstOrDefault(m => m.MaKs == maks && m.MaKh == makh);
            if(dg != null)
            {
                Clients.Caller.DanhGia(dg.SoSao, maks, makh);
            }
            else
            {
                return;
            }
        }
    }
}