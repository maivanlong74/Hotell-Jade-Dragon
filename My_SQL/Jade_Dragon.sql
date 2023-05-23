USE [Jade_Dragon]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKh] [bigint] NULL,
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
	[MaError] [varchar](10) NULL,
	[SoLuongCTHD] [int] NULL,
	[DaDat] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachsan]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachsan](
	[MaKhachSan] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKhachSan] [nvarchar](50) NULL,
	[SoDienThoai] [bigint] NULL,
	[Gmail] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[KinhDo] [nvarchar](50) NULL,
	[ViDo] [nvarchar](50) NULL,
	[Gia] [bigint] NULL,
	[AnhKs] [nvarchar](50) NULL,
	[SoTang] [bigint] NULL,
	[MaKhuVuc] [bigint] NULL,
	[TrangThaiKs] [bit] NULL,
 CONSTRAINT [PK_khachsan] PRIMARY KEY CLUSTERED 
(
	[MaKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khuvuc]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khuvuc](
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
/****** Object:  View [dbo].[lichsu]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[lichsu]
AS
SELECT        dbo.hoadon.MaHoaDon, dbo.hoadon.HoTen, dbo.khachsan.TenKhachSan, dbo.hoadon.SoLuongCTHD, dbo.hoadon.NgayDat, dbo.hoadon.TongTien, dbo.khachsan.MaKhachSan
FROM            dbo.hoadon INNER JOIN
                         dbo.khachsan ON dbo.hoadon.MaKhachSan = dbo.khachsan.MaKhachSan INNER JOIN
                         dbo.khuvuc ON dbo.khachsan.MaKhuVuc = dbo.khuvuc.MaKhuVuc
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[MaChiTietHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[Gia] [bigint] NULL,
	[MaPhong] [bigint] NULL,
	[MaHoaDon] [bigint] NULL,
	[TenPhong] [nvarchar](50) NULL,
	[DaDen] [bit] NULL,
 CONSTRAINT [PK_machitiethoadon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaKs]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaKs](
	[MaDanhGia] [bigint] IDENTITY(1,1) NOT NULL,
	[SoSao] [bigint] NULL,
	[MaKh] [bigint] NULL,
	[MaKs] [bigint] NULL,
 CONSTRAINT [PK_DanhGiaKs] PRIMARY KEY CLUSTERED 
(
	[MaDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorPay]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorPay](
	[MaError] [varchar](10) NOT NULL,
	[TenError] [nvarchar](max) NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[MaError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[MaKh] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[SoDienThoai] [bigint] NULL,
	[CMND] [bigint] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Gmail] [nvarchar](50) NULL,
	[Avt] [nvarchar](50) NULL,
	[TenDn] [nvarchar](50) NULL,
	[Mk] [nvarchar](50) NULL,
	[IDGroup] [bigint] NULL,
	[Code] [nchar](10) NULL,
	[DaXacMinh] [bit] NOT NULL,
	[QLKhachSan] [bigint] NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moc_Time]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moc_Time](
	[stt] [bigint] IDENTITY(1,1) NOT NULL,
	[MaPhong] [bigint] NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
 CONSTRAINT [PK_Moc_Time] PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanhoi]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanhoi](
	[MaPhanHoi] [nvarchar](50) NOT NULL,
	[MaKh] [bigint] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGian] [datetime] NULL,
 CONSTRAINT [PK_phanhoi] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChat]    Script Date: 5/23/2023 7:03:39 PM ******/
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
/****** Object:  Table [dbo].[PhongKhachSan]    Script Date: 5/23/2023 7:03:39 PM ******/
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
/****** Object:  Table [dbo].[SoLuongNguoiTruyCap]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLuongNguoiTruyCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SoLuongNguoi] [bigint] NULL,
 CONSTRAINT [PK_SoLuongNguoiTruyCap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoPhongKhachSan]    Script Date: 5/23/2023 7:03:39 PM ******/
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
/****** Object:  Table [dbo].[SoTangKhachSan]    Script Date: 5/23/2023 7:03:39 PM ******/
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
/****** Object:  Table [dbo].[tinnhan]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinnhan](
	[MaTinNhan] [nvarchar](50) NOT NULL,
	[MaKh] [bigint] NULL,
	[NoiDungTinNhanClient] [nvarchar](max) NULL,
	[LinkAnh] [nvarchar](max) NULL,
	[MaPhongChat] [bigint] NULL,
	[NgayGui] [datetime] NULL,
 CONSTRAINT [PK_tinnhan] PRIMARY KEY CLUSTERED 
(
	[MaTinNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tinnhanAdmin]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinnhanAdmin](
	[MaChatAdmin] [nvarchar](50) NOT NULL,
	[IdNguoiNhan] [bigint] NULL,
	[IdNguoiGui] [bigint] NULL,
	[NoiDungChat] [nvarchar](max) NULL,
	[NgayGuiChat] [datetime] NULL,
	[LinkAnhAdmin] [nvarchar](max) NULL,
 CONSTRAINT [PK_tinnhanAdmin] PRIMARY KEY CLUSTERED 
(
	[MaChatAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 5/23/2023 7:03:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[IDGroup] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[IDGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chitiethoadon] ON 

INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon], [TenPhong], [DaDen]) VALUES (60097, CAST(N'2023-05-24T12:22:00.000' AS DateTime), CAST(N'2023-05-27T12:22:00.000' AS DateTime), 200000, 1, 60071, N'B101', 0)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon], [TenPhong], [DaDen]) VALUES (60100, CAST(N'2023-05-24T12:22:00.000' AS DateTime), CAST(N'2023-05-27T12:22:00.000' AS DateTime), 100000, 40, 70072, N'B202', 0)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon], [TenPhong], [DaDen]) VALUES (60101, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime), 200000, 45, 70073, N'B101', 0)
SET IDENTITY_INSERT [dbo].[chitiethoadon] OFF
GO
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'00', N'Giao dịch thành công')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'07', N'Trừ tiền thành công. Giao dịch bị nghi ngờ (liên quan tới lừa đảo, giao dịch bất thường).')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'09', N'Thẻ/Tài khoản của khách hàng chưa đăng ký dịch vụ InternetBanking tại ngân hàng.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'10', N'Khách hàng xác thực thông tin thẻ/tài khoản không đúng quá 3 lần')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'11', N'Đã hết hạn chờ thanh toán. Xin quý khách vui lòng thực hiện lại giao dịch.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'12', N'Thẻ/Tài khoản của khách hàng bị khóa.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'13', N'Quý khách nhập sai mật khẩu xác thực giao dịch (OTP). Xin quý khách vui lòng thực hiện lại giao dịch.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'24', N'Khách hàng hủy giao dịch')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'51', N'Tài khoản của quý khách không đủ số dư để thực hiện giao dịch.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'65', N'Tài khoản của Quý khách đã vượt quá hạn mức giao dịch trong ngày.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'75', N'Ngân hàng thanh toán đang bảo trì.')
INSERT [dbo].[ErrorPay] ([MaError], [TenError]) VALUES (N'79', N'KH nhập sai mật khẩu thanh toán quá số lần quy định. Xin quý khách vui lòng thực hiện lại giao dịch')
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [TenKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError], [SoLuongCTHD], [DaDat]) VALUES (60071, 10040, 20039, N'Love You', N'Hồ Thị Như Ngọc', 823873287, 234234124, N'longmai143@gmail.com', 1, CAST(N'2023-05-22T12:22:24.760' AS DateTime), 720000, 180000, N'taiquay', N'00', 1, 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [TenKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError], [SoLuongCTHD], [DaDat]) VALUES (70072, 10040, 20039, N'Love You', N'Hồ Thị Như Ngọc', 823873287, 234234124, N'longmai143@gmail.com', 1, CAST(N'2023-05-22T12:22:24.760' AS DateTime), 720000, 180000, N'taiquay', N'00', 1, 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [TenKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError], [SoLuongCTHD], [DaDat]) VALUES (70073, NULL, 20041, N'LyLy', N'abc', 4324234234, 4234234324, N'longmai143@gmail.com', 1, CAST(N'2023-05-23T08:50:13.897' AS DateTime), 200000, 0, N'chuyenkhoan', N'00', 1, 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh], [QLKhachSan]) VALUES (10040, N'Hồ Thị Như Ngọc', 823873287, 234234124, N'Nguyễn Trãi', N'longmai143@gmail.com', N'nv10040.jpg', N'ngoc', N'202cb962ac59075b964b07152d234b70', 2, NULL, 1, NULL)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh], [QLKhachSan]) VALUES (20089, N'Hoàng Văn A', 389742174, 982364826, N'Nguyễn Huệ', N'maivanlong143@gmail.com', N'nv20089.jpg', N'a3', N'202cb962ac59075b964b07152d234b70', 2, N'843165    ', 1, NULL)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh], [QLKhachSan]) VALUES (20091, N'admin', NULL, NULL, NULL, NULL, N'nv20091.jpg', N'admin', N'202cb962ac59075b964b07152d234b70', 1, NULL, 1, NULL)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh], [QLKhachSan]) VALUES (20103, N'Nam', 28632137812, 1273621876387, N'haha', N'longmai143@gmail.com', NULL, N'long1', N'202cb962ac59075b964b07152d234b70', 2, N'305756    ', 0, NULL)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh], [QLKhachSan]) VALUES (30107, N'Mai Văn Long', 23672536725, 34386432764, N'Duy Tân', N'longmai143@gmail.com', N'nv6440.jpg', N'long', N'202cb962ac59075b964b07152d234b70', 3, NULL, 1, 20039)
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
SET IDENTITY_INSERT [dbo].[khachsan] ON 

INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20039, N'Love You', 349238492, N'longmai143@gmail.com', N' Đường Nguyễn Trãi, Phường Tây Lộc, Thành phố Huế, Thừa Thiên Huế', N'107.56711721420288', N'16.474670385888146', 300000, N'nv1485.jpg', 2, 50042, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20040, N'Mường Thanh', 3472394792, N'longmai143@gmail.com', N'70 Nguyễn Huệ, Phường Vĩnh Ninh, Thành phố Huế, Thừa Thiên Huế', N'107.58758783340453', N'16.45759094606207', 250000, N'nv20040.jpg', 1, 30038, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20041, N'LyLy', 324237846847, N'longmai143@gmail.com', N' Huỳnh Thúc Kháng, Phường Đông Ba, Thành phố Huế, Thừa Thiên Huế', N'107.5835967063904', N'16.480390632839914', 230000, N'nv4853.jpg', 1, 50043, 0)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (20042, N'Ngọc Long', 8324792347, N'longmai143@gmail.com', N' Nhật Lệ, Phường Đông Ba, Thành phố Huế, Thừa Thiên Huế', N'107.57896184921266', N'16.476275364311405', 300000, N'nv20042.jpg', 1, 50043, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30035, N'Jade Jade', 32748236487, N'longmai143@gmail.com', N' Lê Quý Đôn, Phường Phú Hội, Thành phố Huế, Thừa Thiên Huế', N'107.5987458229065', N'16.466851070084715', 200000, N'nv30035.jpg', 1, 50040, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30036, N'Gam', 823873287, N'LoveYou@gmail.com', N' Tú Xương, Phường Tây Lộc, Thành phố Huế, Thừa Thiên Huế', N'107.56395488977432', N'16.48049608544696', 230000, N'nv30036.jpg', 3, 50042, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30037, N'Stay', 3246328764, N'll@gmail.com', N'235 Đường Nguyễn Tất Thành, Thủy Dương, Thị xã Hương Thuỷ, Thừa Thiên Huế', N'107.62616872787476', N'16.438740083413165', 300000, N'nv30037.jpg', 1, 60039, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30045, N'LyLy(1)', 43534534534, N'dd@gmail.com', N' Huỳnh Thúc Kháng, Phường Đông Ba, Thành phố Huế, Thừa Thiên Huế', N'107.58445501327516', N'16.47936182390478', 3534543, NULL, 1, 50043, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30046, N'Ngôi Sao', 1673213087, N'maivanlong143@gmail.com', N' Phạm Văn Đồng, Phường Vỹ Dạ, Thành phố Huế, Thừa Thiên Huế', N'107.60050535202025', N'16.472489240052496', 400000, N'nv30046.jpg', 1, 70041, 1)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [KinhDo], [ViDo], [Gia], [AnhKs], [SoTang], [MaKhuVuc], [TrangThaiKs]) VALUES (30048, N'a', 222, N'a@gmail.com', N' Điện Biên Phủ, Phường Trường An, Thành phố Huế, Thừa Thiên Huế', N'107.58149385452269', N'16.450182528496256', 200002, NULL, 1, 60046, 1)
SET IDENTITY_INSERT [dbo].[khachsan] OFF
GO
SET IDENTITY_INSERT [dbo].[khuvuc] ON 

INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (30038, N'Phường Vĩnh Ninh', N'107.58861780166626', N'16.463723255433322')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (50040, N'Phường Phú Hội', N'107.59831666946408', N'16.460471920925514')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (50042, N'Phường Tây Lộc', N'107.56711721420288', N'16.474670385888146')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (50043, N'Phường Đông Ba', N'107.5835967063904', N'16.480390632839914')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60039, N'Thủy Dương', N'107.62616872787476', N'16.438740083413165')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60040, N'Phường Thuận Hòa', N'107.57226705551147', N'16.473600392885942')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60041, N'Phường Phước Vĩnh', N'107.587995529175', N'16.4553684504986')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60042, N'Phường An Cựu', N'107.604517936707', N'16.4411685723824')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60043, N'Phường Thủy Xuân', N'107.580571174622', N'16.4406334842015')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60044, N'Phường Phú Nhuận', N'107.591857910156', N'16.4575497889683')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60045, N'Phường An Đông', N'107.609281539917', N'16.4544218242851')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60046, N'Phường Trường An', N'107.581171989441', N'16.4517053929838')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60047, N'Phường Xuân Phú', N'107.602415084839', N'16.4637232554333')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (60048, N'Phường Thuận Lộc', N'107.579326629639', N'16.4761107517517')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc], [KinhDo], [ViDo]) VALUES (70041, N'Phường Vỹ Dạ', N'107.60050535202025', N'16.472489240052496')
SET IDENTITY_INSERT [dbo].[khuvuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Moc_Time] ON 

INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10015, 1, CAST(N'2023-05-24T12:22:00.000' AS DateTime), CAST(N'2023-05-27T12:22:00.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10017, 1, CAST(N'2023-05-24T12:22:00.000' AS DateTime), CAST(N'2023-05-27T12:22:00.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10019, 40, CAST(N'2023-05-24T12:22:00.000' AS DateTime), CAST(N'2023-05-27T12:22:00.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10020, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10021, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10022, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10023, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10024, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10025, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10026, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10027, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10028, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10029, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10030, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10031, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10032, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10033, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (10034, 45, CAST(N'2023-05-23T08:50:13.897' AS DateTime), CAST(N'2023-05-24T08:48:53.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Moc_Time] OFF
GO
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AJK03', NULL, N'xxxxxxxxxxxxxxxxxxxxxxxxssss', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'akkk3', NULL, N'sabsa suihai ausid asdbia ádi', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AQJ05', NULL, N'ádasdasd', CAST(N'2023-03-30T17:56:34.857' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'FFR11', 10040, N'hihi', CAST(N'2023-04-21T23:54:14.330' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'GSX26', NULL, N'haha', CAST(N'2023-04-21T23:54:55.570' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HGU22', NULL, N'ádas', CAST(N'2023-03-30T17:56:22.603' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HUL27', NULL, N'ádasdasdas', CAST(N'2023-03-30T17:56:25.217' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HVY27', NULL, N'qưeqweqwe', CAST(N'2023-03-30T17:56:27.777' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HXD28', NULL, N'susisusi', CAST(N'2023-03-30T21:44:12.883' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'LTB46', NULL, N'sxX', CAST(N'2023-03-30T17:56:19.877' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'RKV63', NULL, N'sssssssssss', CAST(N'2023-03-30T17:55:53.220' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'RYJ68', NULL, N'new', CAST(N'2023-03-30T18:00:23.047' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'sssd1', 10040, N'abcdef shabd áhdiua', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'ZFI81', NULL, N'âcscascas', CAST(N'2023-03-30T17:56:30.570' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PhongChat] ON 

INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (20045, N'Tất cả', NULL)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (20052, N'Phòng 1', 20042)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (20053, N'Phòng 2', 20042)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (30056, N'ola', 20040)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (30057, N'kkk', NULL)
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat], [MaKhachSan]) VALUES (30060, N'hihi', NULL)
SET IDENTITY_INSERT [dbo].[PhongChat] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongKhachSan] ON 

INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (1, 20039, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (2, 20039, 1, 2, N'B102', N'Đôi', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (39, 20039, 2, 1, N'B201', N'Đôi', 500000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (40, 20039, 2, 2, N'B202', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (41, 20039, 2, 3, N'B203', N'Đơn', 200000, 0, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (44, 20040, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (45, 20041, 1, 1, N'B101', N'Đơn', 200000, 0, 0, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (46, 20042, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (47, 30035, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (48, 30036, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (49, 30037, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (51, 30045, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (52, 30046, 1, 1, N'B101', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (54, 30048, 1, 1, N'B101', N'Đơn', 200002, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (55, 30048, 1, 2, N'B102', N'Đơn', 0, 0, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (57, 20039, 1, 3, N'B103', N'Đơn', 100000, 1, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (60, 20039, 2, 4, N'B204', N'Đơn', 0, 0, 0, 1)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (61, 30036, 1, 2, N'B102', N'Đơn', 300000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (62, 30036, 2, 1, N'B201', N'Đơn', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (63, 30036, 2, 2, N'B202', N'Đôi', 200000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (64, 30036, 2, 3, N'B203', N'Đơn', 100000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (65, 30036, 3, 1, N'B301', N'Đơn', 230000, 0, 1, 0)
INSERT [dbo].[PhongKhachSan] ([MaPhong], [MaKhachSan], [MaSoTang], [MaSoPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [TrangThai], [KhoaPhong]) VALUES (66, 30036, 3, 2, N'B302', N'Đơn', 230000, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[PhongKhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[SoLuongNguoiTruyCap] ON 

INSERT [dbo].[SoLuongNguoiTruyCap] ([id], [SoLuongNguoi]) VALUES (1, 211)
SET IDENTITY_INSERT [dbo].[SoLuongNguoiTruyCap] OFF
GO
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (1, N'01        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (2, N'02        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (3, N'03        ')
INSERT [dbo].[SoPhongKhachSan] ([MaSoPhong], [SoPhong]) VALUES (4, N'04        ')
GO
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (1, N'B1        ')
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (2, N'B2        ')
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (3, N'B3        ')
INSERT [dbo].[SoTangKhachSan] ([MaSoTang], [SoTang]) VALUES (4, N'B4        ')
GO
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'70118', 20091, N'Xin chào bạn', NULL, 20045, CAST(N'2023-04-28T20:47:01.423' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'70120', 20091, N'hehehe', NULL, 20045, CAST(N'2023-04-28T20:47:21.827' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'70124', 20091, N'ksdjksadkas', NULL, 20045, CAST(N'2023-04-28T20:48:27.383' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'70131', 10040, N'sdsd', NULL, 20045, CAST(N'2023-04-28T23:49:04.377' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'70145', 20091, NULL, N'data:image/jpeg;base64,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84gZB3Y103lS/Oip/eHZdfg8Ndhph6qMfVtnQ/2KC3BwuJF9DzP8nNar57n49ZzeDN2rBiZSbQOU0Sm9KsfamV5wC5Dp6k3OzrNG1OQHtFNFnWyk154c9gO0NAI6kS6ZUqVfuPadk9+8RD3Cplt8wZVDuipinL7UNfuY8NwHUzyc+0wXWaOh2D8y43PrFhfwGQm30hIWC5kzv5S7+JCvvUskCUnyNTQgwak18j4l2psB58CzSaAodVO3O3HnkVhbVevACI6Msf7N2+/0MYqp/Ql67F7eG1dt15owuxetBo+lTqPSdV6TFhekqvHNUBALo1HgBLmFmX7wcxhILkzDqiL0llMDCbRKKzfCdZ6TrvSdd6TrvSdd6TrvSdd6TrvSdd6TrPSdZ6SmVt3bBnQfSW5MtyY8C9RDRciv/EVFtQjt01Eh/wDtr//aAAwDAQACAAMAAAAQ99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999995899998Q999999999999999999999999999co7G5980Zaq99999999999999999999999999+6RGeUl++X9UR1999999999999999999999999qVTpb399e68WT0999999999999999999999999t99tdt9td9ttt99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999/wDfffffffffffffffffffffffffffffffffffbzV/ffffffffffffffffffffffffffffffffeWQZ3PfffffffffffffffffffffffffffeaXXP/j3s/fffffffffffffffffffffffffff53d0jPvvvrTd/fffffffffffffffffffffffUbJoOdmg+Pt9PrRPffffffffffffffffffffX3V39fX/ANEN8van778H33333333333333333339IAsnG8K5KjxqB2+Bfj33333333333333333330NpnY7777746+ytTmO4P3333333333333333331ugf77777777654TVRIfX333333333333333333kz7777777777746SAvSg733333333333333332nk6qXuh77DzT767+cMvv733333333333333332Ajpd9S+4FbfkSl6etqAVH3333333333333332TlFW2wiL7t+fdvvdw0gn/AN9999999999999999u3X8R6swcG+rxVIVea5E999999999999999999t+aMXT69NvvJZ6pwK7Tf999999999999999999ilbvCL/wD/AL3L2+ew57Hf33333333333333333331n3oKut6x1/wKx8r++P333333333333333333252FjTqRoRXUtM2HDXh33333333333333333330rWoKCZTixNAoQyfyf333333333333333333330Qitdu4AIIIIMIILH33333333333333333333333qzlIjIZYoE0IILb3333333333333333333333tO+iRAeuFknXRPIL33333333333333333333322MAD1o/8AMu8N4h7L99999999999999999999999t9t9//wD/AH/333183333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333/xAAoEQEAAgIBBAEDBQEBAAAAAAABABEhMUEQQFFhIHGRoTBQcIGxYNH/2gAIAQMBAT8Q/gJQMw+K0QbO7Wi4NkWkInRAzTLLrotEGyCu4quIMd3rAVRFtMRVaJZsuI2ZhZuBpzAm2KxWWpa1FcpbV91rNI7IlKuoN6ImHTSaQNJCjZmJTUOIfx43xOf2W7mYd6C4JpivrC5/acBc46RLVR4lhsq49Q7wFaJnMSBWE4PHlmwX9Qoqt5r4iULJT/jERp7mlEAty+YZgyxPF8R8RU1EN8lkWAME09LgJZ0EswxAFPbZkMRZCmEMu/Us5zMdRbvrnnBNkt7JdrEShM+WBaPUKHfDEGw7StL1LBWBGG3JqYs7jLNpbLlsFCSTwliUlwvTJ4giWQxCAm4iNPaUt8TYPGYwsv5XBgjojG9m5vJoSjHtGVkrPlL/AEx6I3KChBQfdLk7U0T9UekNwoqiMW8QCw0EQ0bOzoBcES5I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', 20045, CAST(N'2023-04-29T08:04:27.910' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'ChatGroup113', 20091, N'sssssssssssss', NULL, 20045, CAST(N'2023-05-03T01:43:52.503' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'ChatGroup448', 30107, NULL, N'data:image/jpeg;base64,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', 30060, CAST(N'2023-05-17T14:38:11.547' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (N'ChatGroup581', 20091, N'ddd', NULL, 20045, CAST(N'2023-05-03T01:16:04.177' AS DateTime))
GO
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (N'17', 20091, 10040, N'Xin chào admin', CAST(N'2023-04-26T04:57:43.057' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (N'18', 20091, 10040, N'Hello', CAST(N'2023-04-26T04:57:46.767' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (N'20', 10040, 20091, N'rrrrrrrrrrr', CAST(N'2023-04-26T04:58:55.930' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (N'21', 20091, 10040, N'ffffffffffffffffffffff', CAST(N'2023-04-26T04:59:02.520' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (N'22', 10040, 20091, N'uhgcylvvhjvjh', CAST(N'2023-04-26T05:18:40.010' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([IDGroup], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserGroup] ([IDGroup], [Name]) VALUES (2, N'Client')
INSERT [dbo].[UserGroup] ([IDGroup], [Name]) VALUES (3, N'Manage')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
GO
ALTER TABLE [dbo].[khachhang] ADD  CONSTRAINT [DF_khachhang_isActive]  DEFAULT ((0)) FOR [DaXacMinh]
GO
ALTER TABLE [dbo].[PhongKhachSan] ADD  CONSTRAINT [DF_phong_VIP]  DEFAULT ((0)) FOR [VIP]
GO
ALTER TABLE [dbo].[PhongKhachSan] ADD  CONSTRAINT [DF_phong_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_hoadon]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH NOCHECK ADD  CONSTRAINT [FK_machitiethoadon_phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongKhachSan] ([MaPhong])
GO
ALTER TABLE [dbo].[chitiethoadon] NOCHECK CONSTRAINT [FK_machitiethoadon_phong]
GO
ALTER TABLE [dbo].[DanhGiaKs]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaKs_khachhang] FOREIGN KEY([MaKh])
REFERENCES [dbo].[khachhang] ([MaKh])
GO
ALTER TABLE [dbo].[DanhGiaKs] CHECK CONSTRAINT [FK_DanhGiaKs_khachhang]
GO
ALTER TABLE [dbo].[DanhGiaKs]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaKs_khachsan] FOREIGN KEY([MaKs])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[DanhGiaKs] CHECK CONSTRAINT [FK_DanhGiaKs_khachsan]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_ErrorPay] FOREIGN KEY([MaError])
REFERENCES [dbo].[ErrorPay] ([MaError])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_ErrorPay]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([MaKh])
REFERENCES [dbo].[khachhang] ([MaKh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachsan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachsan]
GO
ALTER TABLE [dbo].[khachhang]  WITH CHECK ADD  CONSTRAINT [FK_khachhang_khachsan] FOREIGN KEY([QLKhachSan])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[khachhang] CHECK CONSTRAINT [FK_khachhang_khachsan]
GO
ALTER TABLE [dbo].[khachhang]  WITH CHECK ADD  CONSTRAINT [FK_khachhang_UserGroup] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[UserGroup] ([IDGroup])
GO
ALTER TABLE [dbo].[khachhang] CHECK CONSTRAINT [FK_khachhang_UserGroup]
GO
ALTER TABLE [dbo].[khachsan]  WITH NOCHECK ADD  CONSTRAINT [FK_khachsan_khuvuc1] FOREIGN KEY([MaKhuVuc])
REFERENCES [dbo].[khuvuc] ([MaKhuVuc])
GO
ALTER TABLE [dbo].[khachsan] NOCHECK CONSTRAINT [FK_khachsan_khuvuc1]
GO
ALTER TABLE [dbo].[Moc_Time]  WITH CHECK ADD  CONSTRAINT [FK_Moc_Time_phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongKhachSan] ([MaPhong])
GO
ALTER TABLE [dbo].[Moc_Time] CHECK CONSTRAINT [FK_Moc_Time_phong]
GO
ALTER TABLE [dbo].[phanhoi]  WITH NOCHECK ADD  CONSTRAINT [FK_phanhoi_khachhang1] FOREIGN KEY([MaKh])
REFERENCES [dbo].[khachhang] ([MaKh])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[phanhoi] NOCHECK CONSTRAINT [FK_phanhoi_khachhang1]
GO
ALTER TABLE [dbo].[PhongChat]  WITH CHECK ADD  CONSTRAINT [FK_PhongChat_khachsan] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[PhongChat] CHECK CONSTRAINT [FK_PhongChat_khachsan]
GO
ALTER TABLE [dbo].[PhongKhachSan]  WITH NOCHECK ADD  CONSTRAINT [FK_phong_khachsan1] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[PhongKhachSan] NOCHECK CONSTRAINT [FK_phong_khachsan1]
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
ALTER TABLE [dbo].[tinnhan]  WITH NOCHECK ADD  CONSTRAINT [FK_tinnhan_khachhang1] FOREIGN KEY([MaKh])
REFERENCES [dbo].[khachhang] ([MaKh])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tinnhan] NOCHECK CONSTRAINT [FK_tinnhan_khachhang1]
GO
ALTER TABLE [dbo].[tinnhan]  WITH CHECK ADD  CONSTRAINT [FK_tinnhan_PhongChat] FOREIGN KEY([MaPhongChat])
REFERENCES [dbo].[PhongChat] ([MaPhongChat])
GO
ALTER TABLE [dbo].[tinnhan] CHECK CONSTRAINT [FK_tinnhan_PhongChat]
GO
ALTER TABLE [dbo].[tinnhanAdmin]  WITH CHECK ADD  CONSTRAINT [FK_tinnhanAdmin_khachhang] FOREIGN KEY([IdNguoiNhan])
REFERENCES [dbo].[khachhang] ([MaKh])
GO
ALTER TABLE [dbo].[tinnhanAdmin] CHECK CONSTRAINT [FK_tinnhanAdmin_khachhang]
GO
ALTER TABLE [dbo].[tinnhanAdmin]  WITH CHECK ADD  CONSTRAINT [FK_tinnhanAdmin_khachhang1] FOREIGN KEY([IdNguoiGui])
REFERENCES [dbo].[khachhang] ([MaKh])
GO
ALTER TABLE [dbo].[tinnhanAdmin] CHECK CONSTRAINT [FK_tinnhanAdmin_khachhang1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[31] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "khachsan"
            Begin Extent = 
               Top = 15
               Left = 241
               Bottom = 145
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khuvuc"
            Begin Extent = 
               Top = 19
               Left = 445
               Bottom = 115
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'lichsu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'lichsu'
GO
