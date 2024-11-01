USE [master]
GO
/****** Object:  Database [Trade_KT6]    Script Date: 31.10.2024 13:42:58 ******/
CREATE DATABASE [Trade_KT6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade_KT6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Trade_KT6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_KT6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Trade_KT6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade_KT6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade_KT6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade_KT6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade_KT6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade_KT6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade_KT6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade_KT6] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade_KT6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade_KT6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade_KT6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade_KT6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade_KT6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade_KT6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade_KT6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade_KT6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade_KT6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade_KT6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade_KT6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade_KT6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade_KT6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade_KT6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade_KT6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade_KT6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade_KT6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade_KT6] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade_KT6] SET  MULTI_USER 
GO
ALTER DATABASE [Trade_KT6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade_KT6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade_KT6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade_KT6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade_KT6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade_KT6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade_KT6', N'ON'
GO
ALTER DATABASE [Trade_KT6] SET QUERY_STORE = OFF
GO
USE [Trade_KT6]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoriesId] [int] IDENTITY(1,1) NOT NULL,
	[CategoriesName] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Names]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Names](
	[NamesId] [int] IDENTITY(1,1) NOT NULL,
	[NamesName] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Names] PRIMARY KEY CLUSTERED 
(
	[NamesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPointId] [int] NOT NULL,
	[OrderUserId] [int] NULL,
	[OrderCode] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFC9911FEB] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickUpPoint]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickUpPoint](
	[OrderPickUpPointId] [int] IDENTITY(1,1) NOT NULL,
	[OrderPickUpPointCity] [nvarchar](200) NOT NULL,
	[OrderPickUpPointStreet] [nvarchar](200) NOT NULL,
	[OrderPickUpPointBuilding] [nvarchar](200) NULL,
	[OrderPickUpPointIndex] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_OrderPickUpPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickUpPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderProductItem] [int] NOT NULL,
	[OrderProductCount] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticle] [nvarchar](100) NOT NULL,
	[ProductNameId] [int] NOT NULL,
	[ProductUnitId] [int] NOT NULL,
	[ProductPrice] [decimal](19, 4) NOT NULL,
	[ProductMaxDiscount] [int] NULL,
	[ProductManufacturerId] [int] NOT NULL,
	[ProductSupplierId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductDiscountNow] [int] NOT NULL,
	[ProductStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](500) NOT NULL,
	[ProductPhotoImage] [image] NULL,
	[ProductPhotoName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ProductSupplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[UnitsId] [int] IDENTITY(1,1) NOT NULL,
	[UnitsName] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.10.2024 13:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoriesId], [CategoriesName]) VALUES (1, N'Для животных')
INSERT [dbo].[Categories] ([CategoriesId], [CategoriesName]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Categories] ([CategoriesId], [CategoriesName]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacturer] ([ManufacturerId], [ManufacturerName]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Names] ON 

INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (1, N'Игрушка')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (2, N'Клетка')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (3, N'Лакомство')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (4, N'Лежак')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (5, N'Миска')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (6, N'Мячик')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (7, N'Сухой корм')
INSERT [dbo].[Names] ([NamesId], [NamesName]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[Names] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, NULL, 601, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, NULL, 602, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 8, 603, 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, NULL, 604, 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (5, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, NULL, 605, 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 7, 606, 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (7, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, NULL, 607, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (8, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, NULL, 608, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (9, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 10, 609, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPointId], [OrderUserId], [OrderCode], [OrderStatusId]) VALUES (10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 9, 610, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderPickUpPoint] ON 

INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (1, N'Нефтеюганск', N'Чехова', N'1', N'344288')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (2, N'Нефтеюганск', N'Степная', N'30', N'614164')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (3, N'Нефтеюганск', N'Коммунистическая', N'43', N'394242')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (4, N'Нефтеюганск', N'Солнечная', N'25', N'660540')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (5, N'Нефтеюганск', N'Шоссейная', N'40', N'125837')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (6, N'Нефтеюганск', N'Партизанская', N'49', N'125703')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (7, N'Нефтеюганск', N'Победы', N'46', N'625283')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (8, N'Нефтеюганск', N'Молодежная', N'50', N'614611')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (9, N'Нефтеюганск', N'Новая', N'19', N'454311')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (10, N'Нефтеюганск', N'Октябрьская', N'19', N'660007')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (11, N'Нефтеюганск', N'Садовая', N'4', N'603036')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (12, N'Нефтеюганск', N'Комсомольская', N'26', N'450983')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (13, N'Нефтеюганск', N'Чехова', N'3', N'394782')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (14, N'Нефтеюганск', N'Дзержинского', N'28', N'603002')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (15, N'Нефтеюганск', N'Набережная', N'30', N'450558')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (16, N'Нефтеюганск', N'Фрунзе', N'43', N'394060')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (17, N'Нефтеюганск', N'Школьная', N'50', N'410661')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (18, N'Нефтеюганск', N'Коммунистическая', N'20', N'625590')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (19, N'Нефтеюганск', N'8 Марта', NULL, N'625683')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (20, N'Нефтеюганск', N'Зеленая', N'32', N'400562')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (21, N'Нефтеюганск', N'Маяковского', N'47', N'614510')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (22, N'Нефтеюганск', N'Светлая', N'46', N'410542')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (23, N'Нефтеюганск', N'Цветочная', N'8', N'620839')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (24, N'Нефтеюганск', N'Коммунистическая', N'1', N'443890')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (25, N'Нефтеюганск', N'Спортивная', N'46', N'603379')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (26, N'Нефтеюганск', N'Гоголя', N'41', N'603721')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (27, N'Нефтеюганск', N'Северная', N'13', N'410172')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (28, N'Нефтеюганск', N'Вишневая', N'32', N'420151')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (29, N'Нефтеюганск', N'Подгорная', N'8', N'125061')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (30, N'Нефтеюганск', N'Шоссейная', N'24', N'630370')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (31, N'Нефтеюганск', N'Полевая', N'35', N'614753')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (32, N'Нефтеюганск', N'Маяковского', N'44', N'426030')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (33, N'Нефтеюганск', N'Клубная', N'44', N'450375')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (34, N'Нефтеюганск', N'Некрасова', N'12', N'625560')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (35, N'Нефтеюганск', N'Комсомольская', N'17', N'630201')
INSERT [dbo].[OrderPickUpPoint] ([OrderPickUpPointId], [OrderPickUpPointCity], [OrderPickUpPointStreet], [OrderPickUpPointBuilding], [OrderPickUpPointIndex]) VALUES (36, N'Нефтеюганск', N'Мичурина', N'26', N'190949')
SET IDENTITY_INSERT [dbo].[OrderPickUpPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (1, 1, 30, 15)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (2, 2, 3, 15)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (3, 3, 5, 10)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (4, 4, 7, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (5, 5, 14, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (6, 6, 14, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (7, 7, 13, 2)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (8, 8, 14, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (9, 9, 29, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (10, 10, 14, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (11, 1, 13, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (12, 2, 30, 15)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (13, 3, 29, 10)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (14, 4, 8, 2)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (15, 5, 10, 10)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (16, 6, 13, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (17, 7, 14, 2)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (18, 8, 29, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (19, 9, 14, 1)
INSERT [dbo].[OrderProduct] ([OrderProductId], [OrderId], [OrderProductItem], [OrderProductCount]) VALUES (20, 10, 30, 1)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusName]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([OrderStatusId], [OrderStatusName]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (1, N'А112Т4', 3, 1, CAST(123.0000 AS Decimal(19, 4)), 30, 4, 1, 2, 3, 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', NULL, N'А112Т4.png')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (2, N'G453T5', 8, 1, CAST(149.0000 AS Decimal(19, 4)), 15, 12, 2, 1, 2, 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', NULL, N'G453T5.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (3, N'F432F4', 7, 1, CAST(1200.0000 AS Decimal(19, 4)), 10, 8, 2, 2, 3, 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', NULL, N'F432F4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (4, N'Y324F4', 3, 1, CAST(86.0000 AS Decimal(19, 4)), 5, 9, 1, 3, 4, 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', NULL, N'Y324F4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (5, N'E532Q5', 3, 1, CAST(166.0000 AS Decimal(19, 4)), 15, 9, 1, 3, 5, 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', NULL, N'E532Q5.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (6, N'T432F4', 7, 1, CAST(1700.0000 AS Decimal(19, 4)), 25, 2, 2, 3, 2, 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', NULL, N'T432F4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (7, N'G345E4', 6, 1, CAST(300.0000 AS Decimal(19, 4)), 5, 6, 2, 3, 3, 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', NULL, N'G345E4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (8, N'E345R4', 1, 1, CAST(199.0000 AS Decimal(19, 4)), 5, 5, 2, 2, 5, 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', NULL, N'E345R4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (9, N'R356F4', 5, 1, CAST(234.0000 AS Decimal(19, 4)), 10, 7, 1, 3, 3, 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', NULL, N'R356F4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (10, N'E431R5', 3, 1, CAST(170.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 5, 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', NULL, N'E431R5.png')
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (11, N'D563F4', 1, 1, CAST(600.0000 AS Decimal(19, 4)), 10, 10, 1, 3, 5, 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (12, N'H436R4', 1, 1, CAST(300.0000 AS Decimal(19, 4)), 15, 10, 1, 3, 2, 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (13, N'D643B5', 7, 1, CAST(4100.0000 AS Decimal(19, 4)), 30, 1, 1, 2, 4, 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (14, N'H432F4', 5, 1, CAST(385.0000 AS Decimal(19, 4)), 10, 10, 2, 1, 2, 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (15, N'S245R4', 7, 1, CAST(280.0000 AS Decimal(19, 4)), 15, 1, 2, 2, 3, 8, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (16, N'V352R4', 7, 1, CAST(1700.0000 AS Decimal(19, 4)), 25, 2, 1, 3, 4, 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (17, N'H342F5', 1, 1, CAST(510.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (18, N'Q245F5', 1, 1, CAST(510.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (19, N'G542F5', 7, 1, CAST(2190.0000 AS Decimal(19, 4)), 30, 8, 1, 3, 4, 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (20, N'H542R6', 3, 1, CAST(177.0000 AS Decimal(19, 4)), 15, 10, 2, 3, 3, 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (21, N'K436T5', 6, 1, CAST(100.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 4, 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (22, N'V527T5', 1, 1, CAST(640.0000 AS Decimal(19, 4)), 5, 10, 1, 3, 5, 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (23, N'K452T5', 4, 1, CAST(800.0000 AS Decimal(19, 4)), 25, 13, 2, 3, 2, 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (24, N'E466T6', 2, 1, CAST(3500.0000 AS Decimal(19, 4)), 30, 10, 2, 3, 5, 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (25, N'B427R5', 5, 1, CAST(400.0000 AS Decimal(19, 4)), 15, 10, 2, 1, 4, 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (26, N'H643W2', 5, 1, CAST(292.0000 AS Decimal(19, 4)), 25, 10, 1, 1, 3, 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (27, N'D356R4', 6, 1, CAST(600.0000 AS Decimal(19, 4)), 15, 11, 1, 3, 2, 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (28, N'E434U6', 3, 1, CAST(140.0000 AS Decimal(19, 4)), 20, 9, 2, 3, 3, 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (29, N'M356R4', 3, 1, CAST(50.0000 AS Decimal(19, 4)), 5, 9, 2, 3, 4, 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductId], [ProductArticle], [ProductNameId], [ProductUnitId], [ProductPrice], [ProductMaxDiscount], [ProductManufacturerId], [ProductSupplierId], [ProductCategoryId], [ProductDiscountNow], [ProductStock], [ProductDescription], [ProductPhotoImage], [ProductPhotoName]) VALUES (30, N'W548O7', 7, 1, CAST(600.0000 AS Decimal(19, 4)), 15, 3, 1, 3, 5, 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([UnitsId], [UnitsName]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (2, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (3, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (4, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (5, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (6, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (7, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (8, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (9, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (10, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickUpPoint] FOREIGN KEY([OrderPickupPointId])
REFERENCES [dbo].[OrderPickUpPoint] ([OrderPickUpPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([OrderUserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([OrderProductItem])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[Categories] ([CategoriesId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Names] FOREIGN KEY([ProductNameId])
REFERENCES [dbo].[Names] ([NamesId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Names]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([ProductSupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Units] FOREIGN KEY([ProductUnitId])
REFERENCES [dbo].[Units] ([UnitsId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Units]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade_KT6] SET  READ_WRITE 
GO
