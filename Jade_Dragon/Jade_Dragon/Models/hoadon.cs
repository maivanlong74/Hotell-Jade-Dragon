//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Jade_Dragon.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class hoadon
    {
        public long MaHoaDon { get; set; }
        public Nullable<long> MaKh { get; set; }
        public Nullable<long> MaKhachSan { get; set; }
        public string HoTen { get; set; }
        public Nullable<long> SoDienThoai { get; set; }
        public Nullable<long> CMND { get; set; }
        public string Gmail { get; set; }
        public Nullable<long> SoLuongPhong { get; set; }
        public Nullable<System.DateTime> NgayDat { get; set; }
        public Nullable<long> TongTien { get; set; }
        public Nullable<long> DatCoc { get; set; }
        public string HinhThuc { get; set; }
        public string MaError { get; set; }
        public Nullable<int> SoLuongCTHD { get; set; }
    
        public virtual ErrorPay ErrorPay { get; set; }
        public virtual khachhang khachhang { get; set; }
        public virtual khachsan khachsan { get; set; }
    }
}
