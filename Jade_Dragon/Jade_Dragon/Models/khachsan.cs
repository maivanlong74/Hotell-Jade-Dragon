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
    
    public partial class khachsan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public khachsan()
        {
            this.DanhGiaKs = new HashSet<DanhGiaK>();
            this.hoadons = new HashSet<hoadon>();
            this.khachhangs = new HashSet<khachhang>();
            this.PhongKhachSans = new HashSet<PhongKhachSan>();
            this.PhongChats = new HashSet<PhongChat>();
            this.SoSaoDanhGias = new HashSet<SoSaoDanhGia>();
            this.ThongKeDanhGias = new HashSet<ThongKeDanhGia>();
        }
    
        public long MaKhachSan { get; set; }
        public string TenKhachSan { get; set; }
        public Nullable<long> SoDienThoai { get; set; }
        public string Gmail { get; set; }
        public string DiaChi { get; set; }
        public string KinhDo { get; set; }
        public string ViDo { get; set; }
        public Nullable<long> Gia { get; set; }
        public Nullable<double> ThangDiem { get; set; }
        public string AnhKs { get; set; }
        public Nullable<long> SoTang { get; set; }
        public Nullable<long> MaKhuVuc { get; set; }
        public Nullable<bool> TrangThaiKs { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGiaK> DanhGiaKs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hoadon> hoadons { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<khachhang> khachhangs { get; set; }
        public virtual khuvuc khuvuc { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhongKhachSan> PhongKhachSans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhongChat> PhongChats { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SoSaoDanhGia> SoSaoDanhGias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThongKeDanhGia> ThongKeDanhGias { get; set; }
    }
}
