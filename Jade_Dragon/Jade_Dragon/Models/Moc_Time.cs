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
    
    public partial class Moc_Time
    {
        public long stt { get; set; }
        public Nullable<long> MaPhong { get; set; }
        public Nullable<System.DateTime> NgayDen { get; set; }
        public Nullable<System.DateTime> NgayDi { get; set; }
    
        public virtual phong phong { get; set; }
    }
}
