USE [Jade_Dragon]
GO
/****** Object:  Table [dbo].[khachsan]    Script Date: 4/29/2023 5:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachsan](
	[MaKhachSan] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKhachSan] [nvarchar](50) NULL,
	[SoDienThoai] [bigint] NULL,
	[Gmail] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Gia] [bigint] NULL,
	[AnhKs] [nvarchar](50) NULL,
	[MaKhuVuc] [bigint] NULL,
	[TrangThaiKs] [bit] NULL,
 CONSTRAINT [PK_khachsan] PRIMARY KEY CLUSTERED 
(
	[MaKhachSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 4/29/2023 5:54:02 AM ******/
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
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKh] [bigint] NULL,
	[MaKhachSan] [bigint] NULL,
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
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khuvuc]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khuvuc](
	[MaKhuVuc] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKhuVuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_khuvuc] PRIMARY KEY CLUSTERED 
(
	[MaKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[lichsu]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[lichsu]
AS
SELECT        dbo.hoadon.MaHoaDon, dbo.hoadon.HoTen, dbo.khachsan.TenKhachSan, dbo.khuvuc.TenKhuVuc, dbo.hoadon.NgayDat
FROM            dbo.hoadon INNER JOIN
                         dbo.khachhang ON dbo.hoadon.MaKh = dbo.khachhang.MaKh INNER JOIN
                         dbo.khachsan ON dbo.hoadon.MaKhachSan = dbo.khachsan.MaKhachSan INNER JOIN
                         dbo.khuvuc ON dbo.khachsan.MaKhuVuc = dbo.khuvuc.MaKhuVuc
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 4/29/2023 5:54:03 AM ******/
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
 CONSTRAINT [PK_machitiethoadon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorPay]    Script Date: 4/29/2023 5:54:03 AM ******/
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
/****** Object:  Table [dbo].[Moc_Time]    Script Date: 4/29/2023 5:54:03 AM ******/
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
/****** Object:  Table [dbo].[phanhoi]    Script Date: 4/29/2023 5:54:03 AM ******/
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
/****** Object:  Table [dbo].[phong]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phong](
	[MaPhong] [bigint] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[LoaiHinh] [nvarchar](50) NULL,
	[Gia] [bigint] NULL,
	[VIP] [bit] NOT NULL,
	[MaKhachSan] [bigint] NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongChat]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChat](
	[MaPhongChat] [bigint] IDENTITY(1,1) NOT NULL,
	[TenPhongChat] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhongChat] PRIMARY KEY CLUSTERED 
(
	[MaPhongChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tinnhan]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinnhan](
	[MaTinNhan] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tinnhanAdmin]    Script Date: 4/29/2023 5:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinnhanAdmin](
	[MaChatAdmin] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/29/2023 5:54:03 AM ******/
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

INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30085, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime), 600000, 10014, 30063)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30086, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime), 200000, 10015, 30063)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30087, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime), 400000, 10016, 30063)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30088, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime), 600000, 10017, 30063)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30089, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime), 600000, 10014, 30064)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30090, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime), 200000, 10015, 30064)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30091, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime), 400000, 10016, 30064)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30092, CAST(N'2023-04-22T17:58:56.753' AS DateTime), CAST(N'2023-04-23T17:58:36.000' AS DateTime), 600000, 10017, 30065)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (30093, CAST(N'2023-04-22T18:00:05.797' AS DateTime), CAST(N'2023-04-23T17:59:51.000' AS DateTime), 600000, 10017, 30066)
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

INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (30063, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 4, CAST(N'2023-04-18T22:15:21.110' AS DateTime), 1440000, 360000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (30064, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 3, CAST(N'2023-04-18T22:35:16.887' AS DateTime), 1920000, 480000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (30065, NULL, 1, N'a', 2132321, 12321321, N'haha@gmail.com', 1, CAST(N'2023-04-22T17:58:56.753' AS DateTime), 480000, 120000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (30066, NULL, 1, N'f', 423423423, 32423423, N'hihi@gmail.com', 1, CAST(N'2023-04-22T18:00:05.797' AS DateTime), 480000, 120000, N'taiquay', N'24')
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (10040, N'Hồ Thị Như Ngọc', 823873287, 234234124, N'Nguyễn Trãi', N'longmai143@gmail.com', N'nv10040.jpg', N'ngoc', N'202cb962ac59075b964b07152d234b70', 2, NULL, 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20047, N'Mai Văn Long', 1673213087, 726389284998, N'haha', N'longmai143@gmail.com', N'nv2063.jpg', N'long', N'202cb962ac59075b964b07152d234b70', 2, N'706233    ', 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20089, N'Hoàng Văn A', 389742174, 982364826, N'Nguyễn Huệ', N'maivanlong143@gmail.com', N'nv20089.jpg', N'a3', N'202cb962ac59075b964b07152d234b70', 2, N'843165    ', 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20091, N'admin', NULL, NULL, NULL, NULL, N'nv20091.jpg', N'admin', N'202cb962ac59075b964b07152d234b70', 1, NULL, 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20103, N'Nam', 28632137812, 1273621876387, N'haha', N'longmai143@gmail.com', NULL, N'long1', N'202cb962ac59075b964b07152d234b70', 2, N'305756    ', 0)
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
SET IDENTITY_INSERT [dbo].[khachsan] ON 

INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (1, N'Haleaaa', 534488, N'htrumanb@storify.com', N'Gabapentin', 300000, N'nv1.jpg', 18, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (4, N'Ethe', 455363, N'eredhousei@mapquest.com', N'Furosemide', 400000, N'nv4.jpg', 2, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (7, N'Arv', 693585, N'afurminger12@utexas.edu', N'Citalopram', 600000, NULL, 1, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (9, N'Lin', 495418, N'lwoolmingtong@last.fm', N'Kroger', 700000, N'nv9.jpg', 6, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (11, N'Liza', 840162, N'lgellettj@furl.net', N'Hydralazine ', 700000, N'nv11.jpg', 8, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (12, N'Janos', 247865, N'jalessandone15@g.co', N'Allerstat', 500000, N'nv12.jpg', 9, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (14, N'Kamilah', 913969, N'ktidmas0@dell.com', N'ProBLEN HGH ', 200000, N'nv14.jpg', 12, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (15, N'Mortimer', 165533, N'mbonno@webs.com', N'Light Foundation ', 500000, N'nv15.jpg', 11, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (16, N'Garek', 677183, N'gboughtwooda@fotki.com', N'SOTALOL ', 800000, N'nv16.jpg', 14, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (18, N'Edik', 471653, N'egianullix@timesonline.co.uk', N'Tussin DM', 200000, N'nv18.jpg', 15, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (19, N'Hervey', 146712, N'hstocks3@xinhuanet.com', N'Solar Protection Formula', 400000, N'nv19.jpg', 16, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (20, N'Gunilla', 462757, N'gsampler@rakuten.co.jp', N'Flulaval Quadrivalent', 600000, N'nv20.jpg', 23, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (26, N'Malena', 823820, N'mdyzart1@mysql.com', N'Naproxen', 500000, N'nv26.jpg', 4, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (28, N'Mường Thanh', 238297321, N'muongthanh@gmail.com', N'22 Hà Nội', 100000, N'nv28.jpg', 6, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (30, N'Ferd', 435204, N'frobbel9@dell.com', N'Listerine Essential Care', 400000, N'nv30.jpg', 11, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (31, N'Carmine', 785893, N'caartsen1b@cnet.com', N'Citalopram', 600000, N'nv31.jpg', 1, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (32, N'Jocelin', 794058, N'jjackettn@loc.gov', N'Nicotine ', 400000, N'nv32.jpg', 12, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (33, N'Nadiya', 720535, N'nbonnick13@wikimedia.org', N'Griseofulvin', 400000, N'nv33.jpg', 11, NULL)
INSERT [dbo].[khachsan] ([MaKhachSan], [TenKhachSan], [SoDienThoai], [Gmail], [DiaChi], [Gia], [AnhKs], [MaKhuVuc], [TrangThaiKs]) VALUES (34, N'Kevin', 439294, N'kdeknevet7@techcrunch.com', N'Fexofenadine', 400000, N'nv34.jpg', 24, NULL)
SET IDENTITY_INSERT [dbo].[khachsan] OFF
GO
SET IDENTITY_INSERT [dbo].[khuvuc] ON 

INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (1, N'Duy Tân')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (2, N'An Cựu')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (3, N'Hà Nội')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (4, N'Đống Đa')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (5, N'An Dương Vương')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (6, N'Hùng Vương')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (7, N'Nguyễn Khuyến')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (8, N'Nguyễn Huệ')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (9, N'Ngự Bình')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (10, N'Phan Bội Châu')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (11, N'Phan Chu Trinh')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (12, N'Lê Lợi')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (13, N'Tam Thai')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (14, N'Hồ Đắc Di')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (15, N'Điện Biên Phủ')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (16, N'Nguyễn Trãi')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (17, N'Nguyễn Khoa Chiêm')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (18, N'Lâm Hoàng')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (19, N'Phạm Văn Đồng')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (20, N'Bà Triệu')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (21, N'Hai Bà Trưng')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (22, N'Lương Văn Can')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (23, N'Võ Thị Sáu')
INSERT [dbo].[khuvuc] ([MaKhuVuc], [TenKhuVuc]) VALUES (24, N'Đặng Huy Trứ')
SET IDENTITY_INSERT [dbo].[khuvuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Moc_Time] ON 

INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (1, 10014, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (2, 10015, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (3, 10016, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (4, 10017, CAST(N'2023-04-18T22:15:21.110' AS DateTime), CAST(N'2023-04-19T22:15:04.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (5, 10014, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (6, 10015, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime))
INSERT [dbo].[Moc_Time] ([stt], [MaPhong], [NgayDen], [NgayDi]) VALUES (7, 10016, CAST(N'2023-04-21T22:33:00.000' AS DateTime), CAST(N'2023-04-23T22:33:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Moc_Time] OFF
GO
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AJK03', 20047, N'xxxxxxxxxxxxxxxxxxxxxxxxssss', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'akkk3', NULL, N'sabsa suihai ausid asdbia ádi', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AQJ05', 20047, N'ádasdasd', CAST(N'2023-03-30T17:56:34.857' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'FFR11', 10040, N'hihi', CAST(N'2023-04-21T23:54:14.330' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'GSX26', 20047, N'haha', CAST(N'2023-04-21T23:54:55.570' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HGU22', 20047, N'ádas', CAST(N'2023-03-30T17:56:22.603' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HUL27', 20047, N'ádasdasdas', CAST(N'2023-03-30T17:56:25.217' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HVY27', 20047, N'qưeqweqwe', CAST(N'2023-03-30T17:56:27.777' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'HXD28', 20047, N'susisusi', CAST(N'2023-03-30T21:44:12.883' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'LTB46', 20047, N'sxX', CAST(N'2023-03-30T17:56:19.877' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'RKV63', 20047, N'sssssssssss', CAST(N'2023-03-30T17:55:53.220' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'RYJ68', 20047, N'new', CAST(N'2023-03-30T18:00:23.047' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'sssd1', 10040, N'abcdef shabd áhdiua', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'ZFI81', 20047, N'âcscascas', CAST(N'2023-03-30T17:56:30.570' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[phong] ON 

INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (5, N'B201', N'Đôi', 2222222, 0, 7, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (20, N'B303', N'Đôi', 1000000, 0, 7, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (21, N'B308', N'Đơn', 200000, 0, 7, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (23, N'B406', N'Đôi', 300000, 0, 7, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (30, N'B108', N'Đôi', 200000, 0, 7, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10009, N'B202', N'Đơn', 100000, 0, 30, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10012, N'B201', N'Đơn', 400000, 1, 30, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10014, N'B101', N'Đôi', 600000, 1, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10015, N'B102', N'Đơn', 200000, 0, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10016, N'B103', N'Đôi', 400000, 0, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10017, N'B104', N'Đôi', 600000, 1, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10018, N'B105', N'Đơn', 200000, 0, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10019, N'B106', N'Đơn', 200000, 0, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10020, N'B107', N'Đơn', 400000, 1, 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10021, N'B201', N'Đôi', 300000, 0, 4, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10022, N'B202', N'Đôi', 300000, 0, 4, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10023, N'B203', N'Đôi', 300000, 0, 4, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10024, N'B204', N'Đơn', 400000, 1, 4, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai]) VALUES (10025, N'B205', N'Đơn', 400000, 1, 4, 1)
SET IDENTITY_INSERT [dbo].[phong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongChat] ON 

INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat]) VALUES (20045, N'Tất cả')
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat]) VALUES (20052, N'Phòng 1')
INSERT [dbo].[PhongChat] ([MaPhongChat], [TenPhongChat]) VALUES (20053, N'Phòng 2')
SET IDENTITY_INSERT [dbo].[PhongChat] OFF
GO
SET IDENTITY_INSERT [dbo].[tinnhan] ON 

INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70118, 20091, N'Xin chào bạn', NULL, 20045, CAST(N'2023-04-28T20:47:01.423' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70120, 20091, N'hehehe', NULL, 20045, CAST(N'2023-04-28T20:47:21.827' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70124, 20091, N'ksdjksadkas', NULL, 20045, CAST(N'2023-04-28T20:48:27.383' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70131, 10040, N'sdsd', NULL, 20045, CAST(N'2023-04-28T23:49:04.377' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70133, 10040, N'dddddddd', NULL, 20045, CAST(N'2023-04-28T23:49:11.910' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70134, 20047, N'xxxxxxxx', NULL, 20045, CAST(N'2023-04-29T01:39:15.540' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70140, 20047, NULL, N'data:image/jpeg;base64,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', 20045, CAST(N'2023-04-29T02:56:08.117' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70141, 20047, NULL, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExEWFRMVFxUVFRgWGRsaGhUYFhYYFhoYGBcYHiggGRsmGxcXITEhJTUuLi4uFx8zODMsNygtLisBCgoKDg0OGxAQGzAlICUuODAtLS03LTctLS8vLTItLSs1LS03LS0tLS0tLS0tLy0tKy0tMS8tLS0tLS0tLS0tLf/AABEIAOEA4AMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABAcDBQYCAQj/xABKEAACAgEBBAYGBgcEBwkAAAABAgADEQQFEiExBhNBUWFxByJSgZGhFDIzcpKxI0JTYqLB0RVjgvA1Q2Rzg6PhJCU0ssLD0tPx/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAIDBAEF/8QAKREAAgIBAgYCAQUBAAAAAAAAAAECEQMSIQQUIjFBYTJRcRMzQpHwsf/aAAwDAQACEQMRAD8AuqIiAIiIAiIgCIiAIiIAiIgCJzvTHpZXoUUbptvsz1VQON7HNmb9RB2n3DM4Nenu0w28forDOTV1bgEeyLd8kHxI90hLJGPdk445S3SLeiazo1tpNZpq9QgKh8gq3NHVijoe/DAjPbzmzkyAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAImDXayumtrbXVK0BZmY4AAlWdIOnuo1WU0m9ptOcjrSP09o70B4Uqe85b7sjKSirZOEHN0jSdNdr1/2lq2tcbyvXRWvNtxK0bCqOPF3c++aj+0LW+z0zkd9hFY+HFvlN10Q6I2ax36g9TSrEXakjfssfmyVlvrNx4u2QCeRM79fRTod3BfUs3tnUOGz34GF+WJQ8Wt6v+mlZv01p+vor/o10j2hpKnqr+ihWte0by2OV38ZAwyDmM+8zYN0z2oTn6TSvgNPw/isJmHpV0Zu2c6lnN2ksIRLWAFlTnkl26ACG7HGOPAjlnXSqc8kHTLcePFNWkbqrpxtNedumt8HpZfdlLOHwm72d6UMHGr0b1j9pQ3XJ5suFce4NOJZgBknA7zIY2vp846+vP31/rEc+T8ifD4/wXxsfbOn1SdZp7ktTtKnip7mXmp8DgyfPz+lZVxdTY1Nw5W1HBI7m7HXwbIlg9EvSDvsun127Xcx3arVyKrieSnP2dn7pOD2HsmjHmUtvJlyYJQ38HfxNNtzpTo9IQuo1KI54hOLOR3itAW+U+7C6U6TWErp9QruoyyEMrgd5RwGx44lxRRuIiIAiIgCIiAIiIAiIgCIiAIic90k6ZaXRncsdnuIyKahv2Y7CRyQeLECAlZ0Mi7T2hXp6nuucJVWpZ2PYB4dp7AO0mV4/pO1BPqbOQDs6zUet7wlZA+JnKdLumN2rsqGpp+j6av1gFfrEe3PBrHwMBf1QRjJznlK3lj4ZasM73VGXb22rdo2i25SlCHOn057O6y4cmtPYOS5wOOTNdtO1lqcr9fGF+8xCr8yJKkPa2RUzAZKFbAO/q3WzH8Mw69c05HoaFCDUS/dgbKTS6erT1jC1IF8z+sx8S2ST3kyufT/tjW6fT6f6M9lVTu4usrJVgQFNa76nKg+v57vxtDRapLa0tRgyWKroRyKsAQR7jNTtnpVoNOSmo1dCN2ozqW96DJ+U9I8o4joGdTtDYF6a0sxZbkpsfizoqApYSeLFbM4Y+wPM8NpNWDQlrnANaux7vVyZZHSv0m7PGi1Ao1StcanSpQrDLsu6v1lAwCQT4CVgK6zTUm8Gq39NWxBBBTra1bJ8Rn4zPnWrSvZq4ZuOp+ixeg/QGu6tNXr6+sLgPVp3+zqQjKmxDwewg5O9wGcYyMzqdNtrZdtx0SWaZ7RlTSAp4rneUDG6SMHKjiMHunSEcMSh+jHob1tG0qrXtr+j03LaLFY79gRt5Ru44E4AOeAyeJ7b0klSM0pOTtnQekDoWmjQ6zRruUqR9JoH1FUnHXVL+oVJG8o4EZPDHHk76VdSrAMrDBB5GXb0ydBoNWbPqfR797xHVtwlH6AHqq97624mfPdGZk4mKTUkbeEk2nFmu0KdRYa34i0kpaeLMee5Yx4lu49oE3GmtNeo0tycLE1FCqRzK22LW6eIKseHlMGt0q2oUbkeRHNSOIYeIPGbj0Y7Kt1eqWy5QK9E2X4/a6jBFeB7IU9ZnvK+Mjjuck/7LMrUIOL7eC6YiJuPNEREAREQBERAERPjHAyeAHEk9kA+xON2h6S9ChK1m3UkcD9HTeXPhYxVD7jIVnpY0iozWafVV7qkjerUhiBkLvVuwXJ4ZOBOakS0urokekLpa2nxpdMR9KsXeZ+Y01Z4b5HbYeIVT3EngONbabThM4yWYlnZiWd2PNnY8WJ7zPtNr2F77WDW3t1tjDlkgYVf3VUBR4CeNVqN3gOZ+UwZsjk6XY9HBiUI2+5InxlBGCMg8CD2zVm5vaMl6TUZ4Hn+cqovIulHUWirP6J8mrP6jDi1ee7HEeREn6nULWpdzhVGSf8APM+EjbXpLICoy6PW6+5hn+EtM2p0gdkZjkISwXsLdjHy4485J06bIK1aRH021NYukatr7atInWWJQh3X3Mb241i+sF54QHhvYPLAru3almfUPVL2LX6oHw4nzOZabDM5fX9DK2Oa7Cmf1SN4Dy4gj5zRjzr+Rmy8O6Wg5nR7e1FZyLWYdquSwPuP8p2n9l06moOFNTWICSnDmM4YcmHn8pA0XQtFObLC49kDdB8zkn4YnUogAAAwAMADsA7JHLlj/AlhxSp6+xYvQfp7XYiabWWLVq1AUM53U1IHDfRjw3jwynMHlwnbajW11qXexEQDJZmCqB3kk4n502rqAf0K1rbYwzut9VR7b9w+Z7JG0HRulDvOodzx4gBR4KnIDzyZYuI6bkVS4a5VFnY+kb0iUav/ALFpmZ9PvA6i1EZhbunIqTA4qSBvNyIGBnOZy52zX2raPOqz/wCM2CjHAcp9lGTKpvdGnHheNUmRNJtKqw4SxSfZ5N+E8Z1Po513U7R6vOE1dTDH97R66nzNZsH+Ed05nV6Ku0YsQN3E8x5EcQfKYND12l1GnvRmurotWwoftd3BRlV+Ab1Wbg3HlxncTipWiOaMnBpo/RMSsttekw2gLs4DGPXvuRsIfYSo4LsO0nAHjOdO29ocztLUZ8BSB7l6vhNUs0Y7MxwwTkrSLviVXsH0h30MF1+LaOXXou69fjbWvBl72XBHdLRqsDKGUhlYAqQcgg8QQRzEnGSkrRXODi6Z7iIkiIiIgGHWapKq3ssYJWilnY8lVRkkymek3SO3aLetvV6MH9HTnBuA5PfjmDzFfIduTNv6TdtG/UDRKf0FG4+o/vLTh66z3qow5HeV7pXVd6blbdc51htAsr3jhV3yHU1/VVAnHPkcyjJJvpiacMEuqSNqWtazqaEryqB2LkqoBJVQAoJzwPgJ70Oo6xMld05ZWXnhkYqwz2jIMgahusxctOo3VBAtqO5lM5OAGDOvby8p606oz1U13dTS1b2B1Iy5BHqhnB4+sWPafjM2i17Neum3ex601fUWisfZW7xQew44so/dIywHZgz5qz65/wA9kjXXlqBYWD9VqBuuOVirb1e9w4cVY8uHOTtdVg57D+cjJfZKD+iLMmmPrDzmOStDVx3uwcpEmifPFlqrjJAycDJxknsHjwnuYtVp1sUo4yp5j/PI+MivZ1+jLE1q06ivgjLcnYLDuuB98AhvePfPv9oWdultz4Gsj478lo+iOv7NjIu0dX1abwG8xIVF9p24Af57AZgOsvb6mm3fGx1A+CbxkbS1WNqf0rq3VIGAUYVWsyBzOSd0Hie+SjDyyLn4RP2do+rU5O9Y53rG9pv5KOQHYJLJiQNdbx3ewfnIN29yaSSpGdtYviZ7qvVuRmrn0GKFm4kDa1rYWpDh7TugjmqgZdh4gcB4kSXp7N5QfjNPtN2621kJzXSgBAyVFlhLsB2kInyksauRHI6iS9fRuUqiBhWrVhwmd7qt4b+7jjnGfHnPGlFPXD6KrrTuHrN4OFL5G7uizjvY3skeEaK6sWP1N1llArDM9hJAcE5CswyfV4kchiStNVqrlFlYrrRhlOs3mZgeRKqQFB58yZZuk0V7Np/7YjtqrjUdSK0OnG8SCx6wopKlgMbvYTumdv6Mttmi8aFm/QXbzabP+rsGWaodysuWA7CGHaJwVWzhvvTaGUjFhrWxjTYGJ9cJ3bwOQe0Sfr94Jv18LaittR7nrO+vzGPImSU1CSojKDnB2foOJF2XrlvpqvT6ltaWL5OoYfnJU2nnCRto61aarLn+pUj2N5IpY/lJM4/0r6grs2xB/rnpoP3bLVDD8AYQzqVsq3RM7KbLPtbWa6z79h3iPdkL5ATztSkvTaq/WZGA8SQeElRPL1PVZ6+lKOkl6TbGn6lbOsREVRkEgFMDG6V5gjliaLZ+lV6jv1jdayyxUdQd1XdmXgeRwfnJbaKstvmtC/tFRn44zM865LwcUXe5rdvKBprABjCgADs9YYxNkwmu25xRE9u2pfcHDn5KZsZx/FHV8mYfoyezMwiJEkIiIAiIgCa/Zn2moPb1oHuWpMfnNhNdpvU1FqnlYEtXzA6tvyQ++Sj2ZGXdGxmr1Q9czaTBqdPvcuYnESZrYntqmH6pmSnSk8+AnSJK0A9XzJ/pI2j/APE6j7tHww//AFmwUYGB2TX18NU49ulCP8DsD/5x8Yj5OS8fkmaqnfRkPJlZfxAj+c97N6Q0pWiXuKrUUIysCMlRjeTh6wOMjHfPUQpbUzrTu0RDqOv1BuVWFa19WhYFS5LbxYKeIXgAM+MlxE5J2zsVSLL9FN2dm1pn7F76fIJc+6PwFZ184T0RWZo1S+zqmx5NTS35kzu56cXaTPImqk0JwXpfY9RpV7G1aZ/w03MPmBO9nBemBT1GlbHBdWmfDepuQfMge+J/FncfzX5OCiInlnriInmxwoLMcAAkk9gHEmAQLzv6mteypWsP3n9RPlvmbGa7YyEq1rDDXNv4PNUAwi/h4+ZM2MlPvX0Rh2v7EREiSEREAREQBMVunVmRyPWTO6fvDBHiP6CZYiwIiIAiIgCa7aHq3UWdm81R/wCIMr/EgHvmxkbaWmNlTIDhiMqe5lO8p+IElB0yM1aJMSPs/VdbWr4wTwYeyw4Mp8iDJEi1ToknasREQDu/RAP0WsP+1AfDT0f1nfzivRJTjRPZ+21F7+YVhSD8Kp2s9SCqKPIm7kxOY9JOz2u2deEGXrC3oBzJocWYHmFI986eJIgUHVYGUMpyGAIPeCMiepI29sg6HVNpiMUuWs0p7ChOWqz7SE4x7O6ZHnlzjplR6+OanG0Jz219WbildfGo2ojt2Oc5KL3gBSSfITeanTrYpRhlTzGSM+HDskG1B9IprUALWj2YAwByrX82ksdJ2cyJtUbOIiVlgiIgCIiAIiIAiIgCIiAIiIAiIgEajSbljsD6tmCV/fHAsPMYz5STEQ3YSoSPr7ylbMBlsYQe07eqo97ECSJu/R5sX6ZqF1LL/wBk0z71ZPK+9eAK96VnjntYDHIyzFBzkV5cihGyzejWyxpdJRpxx6qtEJ72A9Y+9sn3zZRE9I8kREQDV9I9gUa2k03rlchlZTh63HJ0YcVYf9DkSt9b0A2hUxFTU6qv9Us3U2Y7mGChPiCM9wluRIyhGXcnDJKHZlRaboHtKz6w01A72drW/CigfOc3fsltPrdTW93XNX1Ne/uhB9mLSFUE4A6wDmeU/QMobUX9ZqNVb+01N5Hkjmpf4axM+aEYQ2RpwZJTnuz5ERMZuEREARIdm0BvFKla6wc1r47v32Pqp7zJFeytTZ9e1KB7NY3397t6o9wMkoPzsR1rxuZJGu2hUv1rUXzYD+cmp0Y0/wDrN+499rsR+EEL8pO0+y6E+pRWvkij+U7UTlyOdO3NN+3T3HP5T4Nu6b9unxnXKMchiDHSd6vv/f2cxTtGl+C3Vse4MM/DMlTaajZ1Nn16a2+8in8xNfZ0apH2RspP92x3fwNlflFRFyMcSPfptTTxKjUIO2sbtgHjWThv8J909aTVJYN5GyM4PYQe5geIPgZxxa3CknsZoiJEka+36SuSvUuOJAO8hx3ZG8D8p0Owuie0NVRVen0VK7kV1LWWMwDDIyq14z4Zmulj+iXUb2zxXnjRdfV5DrDYv8FizTgUZ3aMvESlBJxZrtmei9SQ2t1JvH7KteqqPgxyXceGQPCWBRSqKERQqqAFVQAFA5AAcAJkibFFLsYJSct2IiJ04IiIAiIgHi+zdVmPJQW+AzPz3sYk0Vk82UOfN/WPzMvDphfuaDVv7OmvPDwqaUvpE3UQdyqPgAJl4p7I2cIt2zLERMZuPFtgUFmICgZJPICYNJobNT6zlqtOfqqOFlo72PNEPcOJ8Ip041Go3G41UBXcdj2NncU94ABbHlOnli6V7IfJ+jFpNKlShK0VFHIKMD/98ZliJFskIiJw6IiIAiIgCabbeyyc30jF6jJA4C5R+o3j3N2GbmfZ1OiLVo5zS6hbEV1+qwBHvmWQtlDAtA+qL7wvl1jfzzJs5JU2jsXaTE7P0RajD62n96i4f8Ss1n50/OcZOj9GFmNo2rn6+kBx/u7gP/dl3DvrKOKVwLXiIm880REQBERAEREA5r0lWbuytaf7h1/F6v8AOVUBLT9Jv+itX/u//WsqwzJxXg3cH5EREyGwdHCBbql/W363/wALVKB81YTezl79+uxdRWu8VG7Yg52V5zw/eU8R5kds6DQ61LkD1tvKfiD3MOYPgZY91ZCO2xIiIkCYiIgCIiAIiIAkDbW0hRXkDesY7tSdrueXuHMnsAmDaO3URjXWOuu9hTwTxsfkg+fhNbp9MxY23MHuIxkcFQezWOwePMyaVbsg3e0T3s7TdXWqZyRxY+0xOWPvJMkRErbt2TSpUJuvR+2Nq1fvabUr8Gpb+U0s2/QRc7V0/hTqif8AlD8yJbg+aKeI/bZccRE9E8sREQBERAEREA5j0m/6K1n+6z8GUyrJbXpBr3tma0f7NcfwoW/lKjRsgHvAMycV4NvB+T1ERMhtEiW6H1zZU5qtPNk5N99TwcefGS4nU2uxxpPueKttXpwuo6we3QePvrc5+BMlVdJdKeBtFZ7rQaz/ABgTBPjKDwIyPGS1LyiOlrszcVaytuK2Iw8GB/IzLvDvHxnL2bKoPE0Vk/cX+k8f2Jp/2Ff4RHSOr0dLbrK1+tai+bAfmZBt6S6UcOvVj3V5c/BAZq02VQOIorB+4v8ASSkQDkAB4cIuI6vR9s6Qu32Olsb960itfPBy3ykS6u+37a7C/s6covkz/Xb5SZEa67I7ovuzFptMla7qKFXuAxMsRIN2SoREQBN36Px/3pV4abUn+KgTSTovRlWDtJ27U0jf8y5P/rMu4f5oo4n9tlsRET0DzBERAEREAREQCFtrTdZp76/bqtT8SFf5yh9lXb1FTZ51oT57on6FmIadPYX4CVZcWtF2HL+m3sUTvDvjeHfL36hPYX4COoT2F+AlHK+zRznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfG8O+Xv1CewvwEdQnsL8BHK+xznoojeHfOw9EdWb9bZ2AaaoeYFlh+Viyx+oT2F+AnpKwOQAzzwMSzFg0O7KsvEa41R6iImgzCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIB/9k=', 20045, CAST(N'2023-04-29T02:56:31.587' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70142, 20047, NULL, N'data:image/jpeg;base64,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', 20045, CAST(N'2023-04-29T02:59:54.797' AS DateTime))
INSERT [dbo].[tinnhan] ([MaTinNhan], [MaKh], [NoiDungTinNhanClient], [LinkAnh], [MaPhongChat], [NgayGui]) VALUES (70143, 20047, NULL, N'data:image/jpeg;base64,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', 20045, CAST(N'2023-04-29T03:01:41.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[tinnhan] OFF
GO
SET IDENTITY_INSERT [dbo].[tinnhanAdmin] ON 

INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (17, 20091, 10040, N'Xin chào admin', CAST(N'2023-04-26T04:57:43.057' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (18, 20091, 10040, N'Hello', CAST(N'2023-04-26T04:57:46.767' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (19, 20091, 10040, N'Hahah', CAST(N'2023-04-26T04:57:50.580' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (20, 10040, 20091, N'rrrrrrrrrrr', CAST(N'2023-04-26T04:58:55.930' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (21, 20091, 10040, N'ffffffffffffffffffffff', CAST(N'2023-04-26T04:59:02.520' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (22, 10040, 20091, N'uhgcylvvhjvjh', CAST(N'2023-04-26T05:18:40.010' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (10010, 20047, 20091, N'hihihih', CAST(N'2023-04-26T14:38:46.050' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (20025, 20047, 20091, N'sssssssssss', CAST(N'2023-04-28T16:43:22.610' AS DateTime), NULL)
INSERT [dbo].[tinnhanAdmin] ([MaChatAdmin], [IdNguoiNhan], [IdNguoiGui], [NoiDungChat], [NgayGuiChat], [LinkAnhAdmin]) VALUES (20026, 20091, 20047, N'aaaaaaaaaaaa', CAST(N'2023-04-28T16:43:31.860' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tinnhanAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([IDGroup], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserGroup] ([IDGroup], [Name]) VALUES (2, N'Client')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
GO
ALTER TABLE [dbo].[khachhang] ADD  CONSTRAINT [DF_khachhang_isActive]  DEFAULT ((0)) FOR [DaXacMinh]
GO
ALTER TABLE [dbo].[phong] ADD  CONSTRAINT [DF_phong_VIP]  DEFAULT ((0)) FOR [VIP]
GO
ALTER TABLE [dbo].[phong] ADD  CONSTRAINT [DF_phong_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH NOCHECK ADD  CONSTRAINT [FK_machitiethoadon_phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[phong] ([MaPhong])
GO
ALTER TABLE [dbo].[chitiethoadon] NOCHECK CONSTRAINT [FK_machitiethoadon_phong]
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
REFERENCES [dbo].[phong] ([MaPhong])
GO
ALTER TABLE [dbo].[Moc_Time] CHECK CONSTRAINT [FK_Moc_Time_phong]
GO
ALTER TABLE [dbo].[phanhoi]  WITH NOCHECK ADD  CONSTRAINT [FK_phanhoi_khachhang1] FOREIGN KEY([MaKh])
REFERENCES [dbo].[khachhang] ([MaKh])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[phanhoi] NOCHECK CONSTRAINT [FK_phanhoi_khachhang1]
GO
ALTER TABLE [dbo].[phong]  WITH NOCHECK ADD  CONSTRAINT [FK_phong_khachsan1] FOREIGN KEY([MaKhachSan])
REFERENCES [dbo].[khachsan] ([MaKhachSan])
GO
ALTER TABLE [dbo].[phong] NOCHECK CONSTRAINT [FK_phong_khachsan1]
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
            TopColumn = 5
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachsan"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "khuvuc"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
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
