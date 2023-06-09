USE [SQL_JadeDragon]
GO
/****** Object:  Table [dbo].[AnhKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhKhachSan](
	[MaAnhKhachSan] [bigint] IDENTITY(1,1) NOT NULL,
	[LinkAnhKhachSan] [nvarchar](max) NULL,
	[MaKhachSan] [bigint] NULL,
 CONSTRAINT [PK_AnhKhachSan] PRIMARY KEY CLUSTERED 
(
	[MaAnhKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnhPhongKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhPhongKhachSan](
	[MaAnhPhong] [bigint] IDENTITY(1,1) NOT NULL,
	[LinkAnhPhong] [nvarchar](max) NULL,
	[MaPhong] [bigint] NULL,
	[MaKhachSan] [bigint] NULL,
 CONSTRAINT [PK_AnhPhongKhachSan] PRIMARY KEY CLUSTERED 
(
	[MaAnhPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [bigint] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[MaKhachSan] [bigint] NULL,
	[MaNguoiDung] [bigint] NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[Gia] [bigint] NULL,
	[MaPhong] [bigint] NULL,
	[MaHoaDon] [bigint] NULL,
	[TenPhong] [nvarchar](50) NULL,
	[DaDen] [bit] NULL,
	[HoanThanh] [bit] NULL,
 CONSTRAINT [PK_machitiethoadon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaKhachSan](
	[MaDanhGia] [bigint] IDENTITY(1,1) NOT NULL,
	[SoSao] [bigint] NULL,
	[MaNguoiDung] [bigint] NULL,
	[MaKhachSan] [bigint] NULL,
 CONSTRAINT [PK_DanhGiaKs] PRIMARY KEY CLUSTERED 
(
	[MaDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [bigint] NULL,
	[MaKhachSan] [bigint] NULL,
	[TenKhachSan] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SoDienThoai] [bigint] NULL,
	[CMND] [bigint] NULL,
	[Gmail] [nvarchar](50) NULL,
	[SoLuongPhong] [bigint] NULL,
	[NgayDat] [datetime] NULL,
	[TongTien] [bigint] NULL,
	[DatCoc] [bigint] NULL,
	[HinhThuc] [nvarchar](50) NULL,
	[DaDat] [bit] NULL,
	[HuyDat] [bit] NULL,
	[TrangThaiDon] [nvarchar](max) NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachSan](
	[MaKhachSan] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKhachSan] [nvarchar](50) NULL,
	[SoDienThoai] [bigint] NULL,
	[Gmail] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[KinhDo] [nvarchar](50) NULL,
	[ViDo] [nvarchar](50) NULL,
	[Gia] [bigint] NULL,
	[ThangDiem] [float] NULL,
	[SoTang] [bigint] NULL,
	[MaKhuVuc] [bigint] NULL,
	[TrangThaiKs] [bit] NULL,
 CONSTRAINT [PK_khachsan] PRIMARY KEY CLUSTERED 
(
	[MaKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[MaKhuVuc] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKhuVuc] [nvarchar](50) NULL,
	[KinhDo] [nvarchar](50) NULL,
	[ViDo] [nvarchar](50) NULL,
 CONSTRAINT [PK_khuvuc] PRIMARY KEY CLUSTERED 
(
	[MaKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[SoDienThoai] [bigint] NULL,
	[CMND] [bigint] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Gmail] [nvarchar](50) NULL,
	[Avt] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[MaKhachSan] [bigint] NULL,
	[MaPhanQuyen] [bigint] NULL,
	[Code] [nchar](10) NULL,
	[DaXacMinh] [bit] NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPhanQuyen] [bigint] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[MaPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChat]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChat](
	[MaPhongChat] [bigint] IDENTITY(1,1) NOT NULL,
	[TenPhongChat] [nvarchar](50) NULL,
	[MaKhachSan] [bigint] NULL,
 CONSTRAINT [PK_PhongChat] PRIMARY KEY CLUSTERED 
(
	[MaPhongChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongKhachSan](
	[MaPhong] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKhachSan] [bigint] NULL,
	[MaSoTang] [bigint] NULL,
	[MaSoPhong] [bigint] NULL,
	[TenPhong] [nvarchar](50) NULL,
	[LoaiHinh] [nvarchar](50) NULL,
	[Gia] [bigint] NULL,
	[VIP] [bit] NULL,
	[TrangThai] [bit] NULL,
	[KhoaPhong] [bit] NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoNguoiTruyCap]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoNguoiTruyCap](
	[MaTruyCap] [bigint] IDENTITY(1,1) NOT NULL,
	[SoLuongNguoi] [bigint] NULL,
 CONSTRAINT [PK_SoLuongTruyCap] PRIMARY KEY CLUSTERED 
(
	[MaTruyCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoPhongKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoPhongKhachSan](
	[MaSoPhong] [bigint] NOT NULL,
	[SoPhong] [nchar](10) NULL,
 CONSTRAINT [PK_SoPhongKhachSan] PRIMARY KEY CLUSTERED 
(
	[MaSoPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoTangKhachSan]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoTangKhachSan](
	[MaSoTang] [bigint] NOT NULL,
	[SoTang] [nchar](10) NULL,
 CONSTRAINT [PK_SoTangKhachSan] PRIMARY KEY CLUSTERED 
(
	[MaSoTang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKeDanhGia]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeDanhGia](
	[MaThongKeDanhGia] [bigint] IDENTITY(1,1) NOT NULL,
	[MotSao] [bigint] NULL,
	[HaiSao] [bigint] NULL,
	[BaSao] [bigint] NULL,
	[BonSao] [bigint] NULL,
	[NamSao] [bigint] NULL,
	[MaKhachSan] [bigint] NULL,
	[TongSao] [bigint] NULL,
 CONSTRAINT [PK_ThongKeDanhGia] PRIMARY KEY CLUSTERED 
(
	[MaThongKeDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinNhanNguoiDung]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhanNguoiDung](
	[MaChatNguoiDung] [nvarchar](50) NOT NULL,
	[IdNguoiNhan] [bigint] NULL,
	[IdNguoiGui] [bigint] NULL,
	[NoiDungChat] [nvarchar](max) NULL,
	[NgayGuiChat] [datetime] NULL,
	[LinkAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_tinnhanAdmin] PRIMARY KEY CLUSTERED 
(
	[MaChatNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinNhanNhom]    Script Date: 6/4/2023 11:34:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhanNhom](
	[MaTinNhan] [nvarchar](50) NOT NULL,
	[MaNguoiDung] [bigint] NULL,
	[NoiDungChat] [nvarchar](max) NULL,
	[LinkAnh] [nvarchar](max) NULL,
	[MaPhongChat] [bigint] NULL,
	[NgayGui] [datetime] NULL,
 CONSTRAINT [PK_tinnhan] PRIMARY KEY CLUSTERED 
(
	[MaTinNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhKhachSan] ON 

INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20002, N'nv20004.jpg', 20004)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20003, N'nv20005.jpg', 20005)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20004, N'nv20006.jpg', 20006)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20005, N'nv4850.jpg', 20004)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20006, N'nv6107.jpg', 20004)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20008, N'nv4323.jpg', 20005)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20009, N'nv7665.jpg', 20006)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20010, N'nv7678.jpg', 20006)
INSERT [dbo].[AnhKhachSan] ([MaAnhKhachSan], [LinkAnhKhachSan], [MaKhachSan]) VALUES (20011, N'nv0812.jpg', 20005)
SET IDENTITY_INSERT [dbo].[AnhKhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[AnhPhongKhachSan] ON 

INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10002, N'nv0320.jpg', 30002, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10003, N'nv6015.jpg', 30002, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10005, N'nv2022.jpg', 30002, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10006, N'nv8861.jpg', 30006, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10007, N'nv8372.jpg', 30006, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10008, N'nv4300.jpg', 30006, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10009, N'nv2738.jpg', 30009, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10010, N'nv6670.jpg', 30009, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10011, N'nv7003.jpg', 30009, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10012, N'nv4776.jpg', 30008, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10013, N'nv5506.jpg', 30008, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10014, N'nv6807.jpg', 30008, 20004)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10017, N'nv8472.jpg', 30012, 20005)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10018, N'nv1550.jpg', 30012, 20005)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10019, N'nv6104.jpg', 30012, 20005)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10020, N'nv5153.jpg', 30011, 20005)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10021, N'nv5813.jpg', 30011, 20005)
INSERT [dbo].[AnhPhongKhachSan] ([MaAnhPhong], [LinkAnhPhong], [MaPhong], [MaKhachSan]) VALUES (10022, N'nv2157.jpg', 30015, 20005)
SET IDENTITY_INSERT [dbo].[AnhPhongKhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachSan] ON 

INSERT [dbo].[KhachSan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [ThangDiem], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20004, N'Jade Dragon', 1673213087, N'longmai143@gmail.com', N' Hà Nội, Phường Vĩnh Ninh, Thành phố Huế, Thừa Thiên Huế', N'107.59252309799193', N'16.46339400885023', 200000, 0, 3, 2, 1)
INSERT [dbo].[KhachSan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [ThangDiem], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20005, N'Love', 2326503039, N'longmai143@gmail.com', N' Đinh Tiên Hoàng, Phường Đông Ba, Thành phố Huế, Thừa Thiên Huế', N'107.5799059867859', N'16.47516422681919', 230000, 0, 3, 20002, 1)
INSERT [dbo].[KhachSan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [ThangDiem], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20006, N'Mộc Trà', 917236638, N'haha@gmail.com', N' Bà Triệu, Phường Xuân Phú, Thành phố Huế, Thừa Thiên Huế', N'107.59947538375852', N'16.45940184954368', 250000, 0, 1, 10002, 0)
SET IDENTITY_INSERT [dbo].[KhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuVuc] ON 

INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (1, N'Phường An Cựu', N'107.60071992874143', N'16.45314592947132')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (2, N'Phường Vĩnh Ninh', N'107.58990526199342', N'16.463599788030194')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (3, N'Phường Phường Đúc', N'107.58109688758852', N'16.455831472507683')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (4, N'Phường An Đông', N'107.60097742080688', N'16.45314592947132')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (5, N'Kiệt 33 An Dương Vương', N'107.6026028394699', N'16.45334657477629')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (10002, N'Phường Xuân Phú', N'107.60853052139282', N'16.463558632211672')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (10003, N'Phường Phước Vĩnh', N'107.59166479110716', N'16.452528558000623')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (20002, N'Phường Đông Ba', N'107.5799059867859', N'16.47516422681919')
SET IDENTITY_INSERT [dbo].[KhuVuc] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDangNhap], [MatKhau], [MaKhachSan], [MaPhanQuyen], [Code], [DaXacMinh]) VALUES (1, N'Admin', NULL, NULL, NULL, NULL, NULL, N'admin', N'202cb962ac59075b964b07152d234b70', NULL, 1, NULL, 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDangNhap], [MatKhau], [MaKhachSan], [MaPhanQuyen], [Code], [DaXacMinh]) VALUES (3, N'Mai Văn Long', 1673213087, 974982374873, N'79 Duy Tân', N'longmai143@gmail.com', N'nv310337a.jpg', N'long', N'202cb962ac59075b964b07152d234b70', NULL, 2, N'True      ', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDangNhap], [MatKhau], [MaKhachSan], [MaPhanQuyen], [Code], [DaXacMinh]) VALUES (5, N'Hồ Thị Như Ngọc', 1673213087, 36587263578643, N'Duy Tânn', N'longmai143@gmail.com', N'nv2324.jpg', N'ngoc', N'202cb962ac59075b964b07152d234b70', NULL, 2, N'136676    ', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDangNhap], [MatKhau], [MaKhachSan], [MaPhanQuyen], [Code], [DaXacMinh]) VALUES (10002, N'Love', 28409237, 8239482374, N'Duy Tân', N'haha@gmail.com', N'nv1657.jpg', N'abc', N'202cb962ac59075b964b07152d234b70', 20005, 3, NULL, 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPhanQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([MaPhanQuyen], [TenQuyen]) VALUES (2, N'Client')
INSERT [dbo].[PhanQuyen] ([MaPhanQuyen], [TenQuyen]) VALUES (3, N'Manage')
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongChat] ON 

INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (1, N'hihih', NULL)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (2, N'ddddddđ', NULL)
SET IDENTITY_INSERT [dbo].[PhongChat] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongKhachSan] ON 

INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30002, 20004, 1, 1, N'B101', N'Đơn', 300000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30003, 20005, 1, 1, N'B101', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30004, 20006, 1, 1, N'B101', N'Đơn', 250000, 0, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30005, 20004, 1, 2, N'B102', N'Đôi', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30006, 20004, 1, 3, N'B103', N'Đơn', 200000, 1, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30007, 20004, 2, 1, N'B201', N'Đơn', 200000, 0, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30008, 20004, 3, 1, N'B301', N'Đôi', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30009, 20004, 2, 2, N'B202', N'Đơn', 250000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30010, 20004, 3, 2, N'B302', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30011, 20005, 2, 1, N'B201', N'Đôi', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30012, 20005, 1, 2, N'B102', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30013, 20005, 1, 3, N'B103', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30014, 20005, 2, 2, N'B202', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30015, 20005, 3, 1, N'B301', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (30016, 20005, 3, 2, N'B302', N'Đơn', 230000, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[PhongKhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[SoNguoiTruyCap] ON 

INSERT [dbo].[SoNguoiTruyCap] ([MaTruyCap], [SoLuongNguoi]) VALUES (1, 56)
SET IDENTITY_INSERT [dbo].[SoNguoiTruyCap] OFF
GO
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (1, N'01        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (2, N'02        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (3, N'03        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (4, N'04        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (5, N'05        ')
GO
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (1, N'B1        ')
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (2, N'B2        ')
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (3, N'B3        ')
GO
SET IDENTITY_INSERT [dbo].[ThongKeDanhGia] ON 

INSERT [dbo].[ThongKeDanhGia] ([MaThongKeDanhGia], [MotSao], [HaiSao], [BaSao], [BonSao], [NamSao], [MaKhachSan], [TongSao]) VALUES (10002, 0, 0, 0, 0, 0, 20004, 0)
INSERT [dbo].[ThongKeDanhGia] ([MaThongKeDanhGia], [MotSao], [HaiSao], [BaSao], [BonSao], [NamSao], [MaKhachSan], [TongSao]) VALUES (10003, 0, 0, 0, 0, 0, 20005, 0)
INSERT [dbo].[ThongKeDanhGia] ([MaThongKeDanhGia], [MotSao], [HaiSao], [BaSao], [BonSao], [NamSao], [MaKhachSan], [TongSao]) VALUES (10004, 0, 0, 0, 0, 0, 20006, 0)
SET IDENTITY_INSERT [dbo].[ThongKeDanhGia] OFF
GO
INSERT [dbo].[TinNhanNguoiDung] ([MaChatNguoiDung], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnh]) VALUES (N'ChatClient162', 1, 3, N'aaaaaaaaaaaaa', CAST(N'2023-05-31T21:26:16.577' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhanNhom] ([MaTinNhan], [MaNguoiDung], [NoiDungChat], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'ChatGroup780', 1, NULL, N'data:image/jpeg;base64,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84gZB3Y103lS/Oip/eHZdfg8Ndhph6qMfVtnQ/2KC3BwuJF9DzP8nNar57n49ZzeDN2rBiZSbQOU0Sm9KsfamV5wC5Dp6k3OzrNG1OQHtFNFnWyk154c9gO0NAI6kS6ZUqVfuPadk9+8RD3Cplt8wZVDuipinL7UNfuY8NwHUzyc+0wXWaOh2D8y43PrFhfwGQm30hIWC5kzv5S7+JCvvUskCUnyNTQgwak18j4l2psB58CzSaAodVO3O3HnkVhbVevACI6Msf7N2+/0MYqp/Ql67F7eG1dt15owuxetBo+lTqPSdV6TFhekqvHNUBALo1HgBLmFmX7wcxhILkzDqiL0llMDCbRKKzfCdZ6TrvSdd6TrvSdd6TrvSdd6TrvSdd6TrPSdZ6SmVt3bBnQfSW5MtyY8C9RDRciv/EVFtQjt01Eh/wDtr//aAAwDAQACAAMAAAAQ99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999995899998Q999999999999999999999999999co7G5980Zaq99999999999999999999999999+6RGeUl++X9UR1999999999999999999999999qVTpb399e68WT0999999999999999999999999t99tdt9td9ttt99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999/wDfffffffffffffffffffffffffffffffffffbzV/ffffffffffffffffffffffffffffffffeWQZ3PfffffffffffffffffffffffffffeaXXP/j3s/fffffffffffffffffffffffffff53d0jPvvvrTd/fffffffffffffffffffffffUbJoOdmg+Pt9PrRPffffffffffffffffffffX3V39fX/ANEN8van778H33333333333333333339IAsnG8K5KjxqB2+Bfj33333333333333333330NpnY7777746+ytTmO4P3333333333333333331ugf77777777654TVRIfX333333333333333333kz7777777777746SAvSg733333333333333332nk6qXuh77DzT767+cMvv733333333333333332Ajpd9S+4FbfkSl6etqAVH3333333333333332TlFW2wiL7t+fdvvdw0gn/AN9999999999999999u3X8R6swcG+rxVIVea5E999999999999999999t+aMXT69NvvJZ6pwK7Tf999999999999999999ilbvCL/wD/AL3L2+ew57Hf33333333333333333331n3oKut6x1/wKx8r++P333333333333333333252FjTqRoRXUtM2HDXh33333333333333333330rWoKCZTixNAoQyfyf333333333333333333330Qitdu4AIIIIMIILH33333333333333333333333qzlIjIZYoE0IILb3333333333333333333333tO+iRAeuFknXRPIL33333333333333333333322MAD1o/8AMu8N4h7L99999999999999999999999t9t9//wD/AH/333183333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333/xAAoEQEAAgIBBAEDBQEBAAAAAAABABEhMUEQQFFhIHGRoTBQcIGxYNH/2gAIAQMBAT8Q/gJQMw+K0QbO7Wi4NkWkInRAzTLLrotEGyCu4quIMd3rAVRFtMRVaJZsuI2ZhZuBpzAm2KxWWpa1FcpbV91rNI7IlKuoN6ImHTSaQNJCjZmJTUOIfx43xOf2W7mYd6C4JpivrC5/acBc46RLVR4lhsq49Q7wFaJnMSBWE4PHlmwX9Qoqt5r4iULJT/jERp7mlEAty+YZgyxPF8R8RU1EN8lkWAME09LgJZ0EswxAFPbZkMRZCmEMu/Us5zMdRbvrnnBNkt7JdrEShM+WBaPUKHfDEGw7StL1LBWBGG3JqYs7jLNpbLlsFCSTwliUlwvTJ4giWQxCAm4iNPaUt8TYPGYwsv5XBgjojG9m5vJoSjHtGVkrPlL/AEx6I3KChBQfdLk7U0T9UekNwoqiMW8QCw0EQ0bOzoBcES5I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', 1, CAST(N'2023-05-31T20:48:33.293' AS DateTime))
INSERT [dbo].[TinNhanNhom] ([MaTinNhan], [MaNguoiDung], [NoiDungChat], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'ChatGroup822', 1, N'ssssssss', NULL, 1, CAST(N'2023-05-31T20:48:17.670' AS DateTime))
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_KhachHang_DaXacMinh]  DEFAULT ((0)) FOR [DaXacMinh]
GO
ALTER TABLE [dbo].[PhongKhachSan] ADD  CONSTRAINT [DF_phong_VIP]  DEFAULT ((0)) FOR [VIP]
GO
ALTER TABLE [dbo].[PhongKhachSan] ADD  CONSTRAINT [DF_phong_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[AnhKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_AnhKhachSan_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[AnhKhachSan] CHECK CONSTRAINT [FK_AnhKhachSan_KhachSan]
GO
ALTER TABLE [dbo].[AnhPhongKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_AnhPhongKhachSan_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[AnhPhongKhachSan] CHECK CONSTRAINT [FK_AnhPhongKhachSan_KhachSan]
GO
ALTER TABLE [dbo].[AnhPhongKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_AnhPhongKhachSan_PhongKhachSan] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongKhachSan] ([MaPhong])
GO
ALTER TABLE [dbo].[AnhPhongKhachSan] CHECK CONSTRAINT [FK_AnhPhongKhachSan_PhongKhachSan]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_KhachSan]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_NguoiDung]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_PhongKhachSan] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongKhachSan] ([MaPhong])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_PhongKhachSan]
GO
ALTER TABLE [dbo].[DanhGiaKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaKhachSan_KhachHang] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DanhGiaKhachSan] CHECK CONSTRAINT [FK_DanhGiaKhachSan_KhachHang]
GO
ALTER TABLE [dbo].[DanhGiaKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaKhachSan_KhachHang1] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DanhGiaKhachSan] CHECK CONSTRAINT [FK_DanhGiaKhachSan_KhachHang1]
GO
ALTER TABLE [dbo].[DanhGiaKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaKhachSan_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[DanhGiaKhachSan] CHECK CONSTRAINT [FK_DanhGiaKhachSan_KhachSan]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachSan]
GO
ALTER TABLE [dbo].[KhachSan]  WITH CHECK ADD  CONSTRAINT [FK_KhachSan_KhuVuc] FOREIGN KEY([MaKhuVuc])
REFERENCES [dbo].[KhuVuc] ([MaKhuVuc])
GO
ALTER TABLE [dbo].[KhachSan] CHECK CONSTRAINT [FK_KhachSan_KhuVuc]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_PhanQuyen] FOREIGN KEY([MaPhanQuyen])
REFERENCES [dbo].[PhanQuyen] ([MaPhanQuyen])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_KhachHang_PhanQuyen]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_KhachSan]
GO
ALTER TABLE [dbo].[PhongChat]  WITH CHECK ADD  CONSTRAINT [FK_PhongChat_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[PhongChat] CHECK CONSTRAINT [FK_PhongChat_KhachSan]
GO
ALTER TABLE [dbo].[PhongKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_PhongKhachSan_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[PhongKhachSan] CHECK CONSTRAINT [FK_PhongKhachSan_KhachSan]
GO
ALTER TABLE [dbo].[PhongKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_PhongKhachSan_SoPhongKhachSan] FOREIGN KEY([MaSoPhong])
REFERENCES [dbo].[SoPhongKhachSan] ([MaSoPhong])
GO
ALTER TABLE [dbo].[PhongKhachSan] CHECK CONSTRAINT [FK_PhongKhachSan_SoPhongKhachSan]
GO
ALTER TABLE [dbo].[PhongKhachSan]  WITH CHECK ADD  CONSTRAINT [FK_PhongKhachSan_SoTangKhachSan] FOREIGN KEY([MaSoTang])
REFERENCES [dbo].[SoTangKhachSan] ([MaSoTang])
GO
ALTER TABLE [dbo].[PhongKhachSan] CHECK CONSTRAINT [FK_PhongKhachSan_SoTangKhachSan]
GO
ALTER TABLE [dbo].[ThongKeDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_ThongKeDanhGia_KhachSan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[KhachSan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[ThongKeDanhGia] CHECK CONSTRAINT [FK_ThongKeDanhGia_KhachSan]
GO
ALTER TABLE [dbo].[TinNhanNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_TinNhanNguoiDung_KhachHang] FOREIGN KEY([IdNguoiNhan])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TinNhanNguoiDung] CHECK CONSTRAINT [FK_TinNhanNguoiDung_KhachHang]
GO
ALTER TABLE [dbo].[TinNhanNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_TinNhanNguoiDung_KhachHang1] FOREIGN KEY([IdNguoiGui])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TinNhanNguoiDung] CHECK CONSTRAINT [FK_TinNhanNguoiDung_KhachHang1]
GO
ALTER TABLE [dbo].[TinNhanNhom]  WITH CHECK ADD  CONSTRAINT [FK_TinNhanNhom_KhachHang] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TinNhanNhom] CHECK CONSTRAINT [FK_TinNhanNhom_KhachHang]
GO
ALTER TABLE [dbo].[TinNhanNhom]  WITH CHECK ADD  CONSTRAINT [FK_TinNhanNhom_PhongChat] FOREIGN KEY([MaPhongChat])
REFERENCES [dbo].[PhongChat] ([MaPhongChat])
GO
ALTER TABLE [dbo].[TinNhanNhom] CHECK CONSTRAINT [FK_TinNhanNhom_PhongChat]
GO
