using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Models
{
    [Serializable]
    public class hienthiphong
    {
        /*=====Khách sạn=========*/
        public List<KhachSan> ks { get; set; }
        public List<AnhKhachSan> AnhKs { get; set; }

        /*=====Phòng Khách Sạn====*/
        public List<PhongKhachSan> ph { get; set; }
        public List<PhongKhachSan> ctphong { get; set; }
        public List<AnhPhongKhachSan> AnhPhong { get; set; }

        public List<KhuVuc> khu_vuc { get; set; }
        public PhongKhachSan giodonhang { get; set; }

        /*========Thông tin phòng==================*/
        public List<SoTangKhachSan> sotang { get; set; }
        public List<SoPhongKhachSan> soph { get; set; }

        public List<BinhLuan> cmt { get; set; }

        /*======Hóa đơn=======================*/
        public List<HoaDon> hd { get; set; }
        public List<ChiTietHoaDon> cthd { get; set; }

        /*=========Đánh giá==================*/
        public List<ThongKeDanhGia> tkdg { get; set; }
        public List<DanhGiaKhachSan> dg { get; set; }

        /*======Ảnh======================*/
        public List<AnhKhachSan> anhks { get; set; }
        public List<AnhPhongKhachSan> anhph { get; set; }
    }



}