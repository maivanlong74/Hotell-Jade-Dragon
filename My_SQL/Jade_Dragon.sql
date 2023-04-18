USE [Jade_Dragon]
GO
/****** Object:  Table [dbo].[khachsan]    Script Date: 4/18/2023 5:06:06 PM ******/
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
/****** Object:  Table [dbo].[khachhang]    Script Date: 4/18/2023 5:06:07 PM ******/
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
	[TheNganHang] [bigint] NULL,
	[TenNganHang] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[hoadon]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  Table [dbo].[khuvuc]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  View [dbo].[lichsu]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  Table [dbo].[ErrorPay]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  Table [dbo].[phanhoi]    Script Date: 4/18/2023 5:06:07 PM ******/
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
/****** Object:  Table [dbo].[phong]    Script Date: 4/18/2023 5:06:07 PM ******/
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
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tinnhan]    Script Date: 4/18/2023 5:06:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinnhan](
	[MaTinNhan] [bigint] IDENTITY(1,1) NOT NULL,
	[MaKh] [bigint] NULL,
	[NoiDungTinNhanClient] [nvarchar](max) NULL,
	[NoiDungTinNhanAdmin] [nvarchar](max) NULL,
 CONSTRAINT [PK_tinnhan] PRIMARY KEY CLUSTERED 
(
	[MaTinNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/18/2023 5:06:07 PM ******/
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

INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20058, CAST(N'2023-04-16T07:17:07.373' AS DateTime), CAST(N'2023-04-17T07:16:54.000' AS DateTime), 600000, 10014, 20043)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20059, CAST(N'2023-04-16T07:19:00.637' AS DateTime), CAST(N'2023-04-17T07:18:40.000' AS DateTime), 600000, 10014, 20044)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20061, CAST(N'2023-04-16T08:10:59.030' AS DateTime), CAST(N'2023-04-17T08:10:38.000' AS DateTime), 600000, 10014, 20046)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20068, CAST(N'2023-04-16T08:45:55.957' AS DateTime), CAST(N'2023-04-19T08:43:00.000' AS DateTime), 600000, 10014, 20051)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20069, CAST(N'2023-04-16T09:35:27.540' AS DateTime), CAST(N'2023-04-17T09:33:07.000' AS DateTime), 600000, 10014, 20052)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20070, CAST(N'2023-04-16T09:35:27.540' AS DateTime), CAST(N'2023-04-17T09:33:07.000' AS DateTime), 200000, 10015, 20052)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20071, CAST(N'2023-04-16T09:41:22.170' AS DateTime), CAST(N'2023-04-17T09:41:18.000' AS DateTime), 600000, 10014, 20053)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20072, CAST(N'2023-04-16T12:31:39.963' AS DateTime), CAST(N'2023-04-18T12:31:00.000' AS DateTime), 600000, 10014, 20054)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20073, CAST(N'2023-04-16T12:34:33.957' AS DateTime), CAST(N'2023-04-17T12:34:09.000' AS DateTime), 600000, 10014, 20055)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20074, CAST(N'2023-04-17T04:57:00.367' AS DateTime), CAST(N'2023-04-18T04:56:37.000' AS DateTime), 600000, 10014, 20056)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20075, CAST(N'2023-04-20T07:07:00.000' AS DateTime), CAST(N'2023-04-23T07:07:00.000' AS DateTime), 200000, 10015, 20057)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20076, CAST(N'2023-04-17T07:09:25.813' AS DateTime), CAST(N'2023-04-19T07:09:00.000' AS DateTime), 400000, 10016, 20058)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20077, CAST(N'2023-04-17T14:41:11.397' AS DateTime), CAST(N'2023-04-18T14:41:00.000' AS DateTime), 200000, 10015, 20059)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20078, CAST(N'2023-04-17T15:15:44.127' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 600000, 10017, 20060)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20079, CAST(N'2023-04-17T15:22:14.767' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 600000, 10017, 20061)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20080, CAST(N'2023-04-17T15:22:32.197' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 200000, 10018, 20062)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20081, CAST(N'2023-04-17T15:25:24.657' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 600000, 10017, 20063)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20082, CAST(N'2023-04-17T15:25:55.533' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 200000, 10018, 20064)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20083, CAST(N'2023-04-17T15:26:09.333' AS DateTime), CAST(N'2023-04-18T15:15:39.000' AS DateTime), 200000, 10019, 20065)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20084, CAST(N'2023-04-17T17:14:29.347' AS DateTime), CAST(N'2023-04-18T17:11:37.000' AS DateTime), 600000, 10014, 20066)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20085, CAST(N'2023-04-17T17:14:29.347' AS DateTime), CAST(N'2023-04-18T17:11:37.000' AS DateTime), 200000, 10018, 20066)
INSERT [dbo].[chitiethoadon] ([MaChiTietHoaDon], [NgayDen], [NgayDi], [Gia], [MaPhong], [MaHoaDon]) VALUES (20086, CAST(N'2023-04-19T23:06:00.000' AS DateTime), CAST(N'2023-04-22T23:06:00.000' AS DateTime), 600000, 10014, 20067)
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

INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20044, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-16T07:19:00.637' AS DateTime), 600000, NULL, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20052, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 2, CAST(N'2023-04-16T09:35:27.540' AS DateTime), 640000, 160000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20053, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-16T09:41:22.170' AS DateTime), 480000, 120000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20054, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-16T12:31:39.963' AS DateTime), 1200000, 0, N'chuyenkhoan', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20055, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-16T12:34:33.957' AS DateTime), 600000, 0, N'chuyenkhoan', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20056, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T04:57:00.367' AS DateTime), 480000, 120000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20057, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T07:08:00.030' AS DateTime), 480000, 120000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20058, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T07:09:25.813' AS DateTime), 640000, 160000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20059, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T14:41:11.397' AS DateTime), 160000, 40000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20060, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:15:44.127' AS DateTime), 480000, 120000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20061, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:22:14.767' AS DateTime), 480000, 120000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20062, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:22:32.197' AS DateTime), 160000, 40000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20063, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:25:24.657' AS DateTime), 480000, 120000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20064, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:25:55.533' AS DateTime), 160000, 40000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20065, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T15:26:09.333' AS DateTime), 160000, 40000, N'taiquay', N'24')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20066, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 2, CAST(N'2023-04-17T17:14:29.347' AS DateTime), 640000, 160000, N'taiquay', N'00')
INSERT [dbo].[hoadon] ([MaHoaDon], [MaKh], [MaKhachSan], [HoTen], [SoDienThoai], [CMND], [Gmail], [SoLuongPhong], [NgayDat], [TongTien], [DatCoc], [HinhThuc], [MaError]) VALUES (20067, 20047, 1, N'Mai Văn Long', 1673213087, 726389284998, N'longmai143@gmail.com', 1, CAST(N'2023-04-17T23:08:41.053' AS DateTime), 1440000, 360000, N'taiquay', N'00')
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (10040, N'Hồ Thị Như Ngọc', 823873287, 234234124, N'Nguyễn Trãi', N'longmai143@gmail.com', 23423423423, N'Viettin', N'nv10040.jpg', N'ngoc', N'202cb962ac59075b964b07152d234b70', 2, NULL, 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20047, N'Mai Văn Long', 1673213087, 726389284998, N'haha', N'longmai143@gmail.com', 7346816498273, N'haha', N'nv2063.jpg', N'long', N'202cb962ac59075b964b07152d234b70', 2, N'704567    ', 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20081, N'Nguyễn Văn A', 634876327, 4732746823, N'haha', N'longmai143@gmail.com', 823167832, N'Viettin', N'nv20081.jpg', N'a1', N'1cc39ffd758234422e1f75beadfc5fb2', 2, NULL, 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20082, N'Mai Văn C', 2678164876, 7868686, N'Xóm chùa', N'maivanlong143@gmail.com', 2658471648, N'ahha', N'nv7208.jpg', N'a2', N'd9b1d7db4cd6e70935368a1efb10e377', 2, NULL, 0)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20089, N'Hoàng Văn A', 389742174, 982364826, N'Nguyễn Huệ', N'maivanlong143@gmail.com', 32964872634, N'VietCom', N'nv20089.jpg', N'a3', N'202cb962ac59075b964b07152d234b70', 2, N'843165    ', 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20091, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, N'nv20091.jpg', N'admin', N'202cb962ac59075b964b07152d234b70', 1, NULL, 1)
INSERT [dbo].[khachhang] ([MaKh], [HoTen], [SoDienThoai], [CMND], [DiaChi], [Gmail], [TheNganHang], [TenNganHang], [Avt], [TenDn], [Mk], [IDGroup], [Code], [DaXacMinh]) VALUES (20103, N'Nam', 28632137812, 1273621876387, N'haha', N'longmai143@gmail.com', 2173863712, N'kkk', NULL, N'long1', N'202cb962ac59075b964b07152d234b70', 2, N'305756    ', 0)
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
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'aac2', 20082, N'dsicb asdasb sadhaui saduiais asduias sadiua', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AJK03', 20047, N'xxxxxxxxxxxxxxxxxxxxxxxxssss', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'akkk3', 20081, N'sabsa suihai ausid asdbia ádi', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[phanhoi] ([MaPhanHoi], [MaKh], [NoiDung], [ThoiGian]) VALUES (N'AQJ05', 20047, N'ádasdasd', CAST(N'2023-03-30T17:56:34.857' AS DateTime))
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

INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (5, N'B201', N'Đôi', 2222222, 0, 7, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (20, N'B303', N'Đôi', 1000000, 0, 7, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (21, N'B308', N'Đơn', 200000, 0, 7, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (23, N'B406', N'Đôi', 300000, 0, 7, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (30, N'B108', N'Đôi', 200000, 0, 7, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10009, N'B202', N'Đơn', 100000, 0, 30, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10012, N'B201', N'Đơn', 400000, 1, 30, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10014, N'B101', N'Đôi', 600000, 1, 1, 1, CAST(N'2023-04-19T23:06:00.000' AS DateTime), CAST(N'2023-04-22T23:06:00.000' AS DateTime))
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10015, N'B102', N'Đơn', 200000, 0, 1, 0, CAST(N'2023-04-17T14:41:11.397' AS DateTime), CAST(N'2023-04-18T14:41:00.000' AS DateTime))
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10016, N'B103', N'Đôi', 400000, 0, 1, 0, CAST(N'2023-04-17T07:09:25.813' AS DateTime), CAST(N'2023-04-19T07:09:00.000' AS DateTime))
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10017, N'B104', N'Đôi', 600000, 1, 1, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10018, N'B105', N'Đơn', 200000, 0, 1, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10019, N'B106', N'Đơn', 200000, 0, 1, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10020, N'B107', N'Đơn', 400000, 1, 1, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10021, N'B201', N'Đôi', 300000, 0, 4, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10022, N'B202', N'Đôi', 300000, 0, 4, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10023, N'B203', N'Đôi', 300000, 0, 4, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10024, N'B204', N'Đơn', 400000, 1, 4, 1, NULL, NULL)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [LoaiHinh], [Gia], [VIP], [MaKhachSan], [TrangThai], [NgayBatDau], [NgayKetThuc]) VALUES (10025, N'B205', N'Đơn', 400000, 1, 4, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[phong] OFF
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
