﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Connect : DbContext
    {
        public Connect()
            : base("name=Connect")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AnhKhachSan> AnhKhachSans { get; set; }
        public virtual DbSet<AnhPhongKhachSan> AnhPhongKhachSans { get; set; }
        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<DanhGiaKhachSan> DanhGiaKhachSans { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachSan> KhachSans { get; set; }
        public virtual DbSet<KhuVuc> KhuVucs { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<PhongChat> PhongChats { get; set; }
        public virtual DbSet<PhongKhachSan> PhongKhachSans { get; set; }
        public virtual DbSet<SoNguoiTruyCap> SoNguoiTruyCaps { get; set; }
        public virtual DbSet<SoPhongKhachSan> SoPhongKhachSans { get; set; }
        public virtual DbSet<SoTangKhachSan> SoTangKhachSans { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<ThongKeDanhGia> ThongKeDanhGias { get; set; }
        public virtual DbSet<TinNhanNguoiDung> TinNhanNguoiDungs { get; set; }
        public virtual DbSet<TinNhanNhom> TinNhanNhoms { get; set; }
    }
}
