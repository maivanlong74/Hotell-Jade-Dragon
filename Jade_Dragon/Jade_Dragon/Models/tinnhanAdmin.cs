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
    
    public partial class tinnhanAdmin
    {
        public long MaChatAdmin { get; set; }
        public Nullable<long> IdAdmin { get; set; }
        public Nullable<long> IdClient { get; set; }
        public string NoiDungChat { get; set; }
        public Nullable<System.DateTime> NgayGuiChat { get; set; }
        public Nullable<long> IDGroup { get; set; }
    
        public virtual khachhang khachhang { get; set; }
        public virtual khachhang khachhang1 { get; set; }
        public virtual UserGroup UserGroup { get; set; }
    }
}