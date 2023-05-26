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
    
    public partial class khachhang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public khachhang()
        {
            this.DanhGiaKs = new HashSet<DanhGiaK>();
            this.hoadons = new HashSet<hoadon>();
            this.phanhois = new HashSet<phanhoi>();
            this.SoSaoDanhGias = new HashSet<SoSaoDanhGia>();
            this.tinnhans = new HashSet<tinnhan>();
            this.tinnhanAdmins = new HashSet<tinnhanAdmin>();
            this.tinnhanAdmins1 = new HashSet<tinnhanAdmin>();
        }
    
        public long MaKh { get; set; }
        public string HoTen { get; set; }
        public Nullable<long> SoDienThoai { get; set; }
        public Nullable<long> CMND { get; set; }
        public string DiaChi { get; set; }
        public string Gmail { get; set; }
        public string Avt { get; set; }
        public string TenDn { get; set; }
        public string Mk { get; set; }
        public Nullable<long> IDGroup { get; set; }
        public string Code { get; set; }
        public bool DaXacMinh { get; set; }
        public Nullable<long> QLKhachSan { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGiaK> DanhGiaKs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<hoadon> hoadons { get; set; }
        public virtual khachsan khachsan { get; set; }
        public virtual UserGroup UserGroup { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<phanhoi> phanhois { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SoSaoDanhGia> SoSaoDanhGias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tinnhan> tinnhans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tinnhanAdmin> tinnhanAdmins { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tinnhanAdmin> tinnhanAdmins1 { get; set; }
    }
}
