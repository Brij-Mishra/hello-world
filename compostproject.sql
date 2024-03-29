USE [master]
GO
/****** Object:  Database [CompostProject]    Script Date: 12/8/2022 12:08:12 AM ******/
CREATE DATABASE [CompostProject]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompostProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompostProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompostProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompostProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompostProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompostProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompostProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompostProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompostProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompostProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompostProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompostProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompostProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompostProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompostProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompostProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CompostProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompostProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompostProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompostProject] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CompostProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompostProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CompostProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompostProject] SET RECOVERY FULL 
GO
ALTER DATABASE [CompostProject] SET  MULTI_USER 
GO
ALTER DATABASE [CompostProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompostProject] SET DB_CHAINING OFF 
GO
USE [CompostProject]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Commission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PaymentId] [int] NULL,
	[Marketing] [decimal](18, 0) NULL,
	[Production] [decimal](18, 0) NULL,
	[Status] [varchar](50) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommissionPayment]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommissionPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommistionType] [varchar](50) NULL,
	[Amount] [decimal](18, 0) NULL,
	[Paidon] [date] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Communication]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Communication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](200) NULL,
	[Details] [varchar](1000) NULL,
	[Date] [date] NULL,
	[CustomerId] [int] NULL,
	[FollowUp] [date] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[PrimaryPhone] [varchar](30) NULL,
	[AlterPhone1] [varchar](30) NULL,
	[AlterPhone2] [varchar](30) NULL,
	[PrimaryContact] [varchar](100) NULL,
	[AlterContact1] [varchar](100) NULL,
	[AlterContact2] [varchar](100) NULL,
	[RateId] [int] NOT NULL,
	[CustomerSince] [date] NULL,
	[WaitTime] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Customer]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Address] [varchar](500) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[PrimaryPhone] [varchar](30) NULL,
	[AlterPhone1] [varchar](30) NULL,
	[PrimaryContact] [varchar](100) NULL,
	[AlterContact1] [varchar](100) NULL,
	[CustomerSince] [date] NULL,
	[IsAdvertised] [bit] NULL,
	[ShopType] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Disable] [bit] NULL CONSTRAINT [DF_D_Customer_Disable]  DEFAULT ((0))
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Orders]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NULL,
	[OrderDate] [date] NULL,
	[Jeera_160] [float] NULL CONSTRAINT [DF_D_Orders_Jeera_160]  DEFAULT ((0)),
	[Shikanji_160] [float] NULL CONSTRAINT [DF_D_Orders_Shikanji_160]  DEFAULT ((0)),
	[Nimbu_160] [float] NULL CONSTRAINT [DF_D_Orders_Nimbu_160]  DEFAULT ((0)),
	[Status] [varchar](50) NULL,
	[Balance] [decimal](18, 0) NOT NULL CONSTRAINT [DF_D_Orders_Balance]  DEFAULT ((0)),
	[DeliveryDate] [date] NULL,
	[PaymentDate] [date] NULL,
	[CustomerId] [int] NULL,
	[CreatedTimeStamp] [datetime] NULL,
	[UpdatedTimeStamp] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Orders_Archive]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Orders_Archive](
	[Id] [int] NOT NULL,
	[Description] [varchar](250) NULL,
	[OrderDate] [date] NULL,
	[Jeera_160] [float] NULL,
	[Shikanji_160] [float] NULL,
	[Nimbu_160] [float] NULL,
	[Status] [varchar](50) NULL,
	[Balance] [decimal](18, 0) NOT NULL,
	[DeliveryDate] [date] NULL,
	[PaymentDate] [date] NULL,
	[CustomerId] [int] NULL,
	[CreatedTimeStamp] [datetime] NULL,
	[UpdatedTimeStamp] [datetime] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_OrdersBackup0728]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_OrdersBackup0728](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NULL,
	[OrderDate] [date] NULL,
	[Jeera_160] [float] NULL,
	[Shikanji_160] [float] NULL,
	[Nimbu_160] [float] NULL,
	[Status] [varchar](50) NULL,
	[Balance] [decimal](18, 0) NULL,
	[DeliveryDate] [date] NULL,
	[PaymentDate] [date] NULL,
	[CustomerId] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expense](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](200) NULL,
	[Amount] [decimal](18, 0) NULL,
	[Date] [date] NULL,
	[CommissionType] [varchar](50) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Vermi] [int] NOT NULL,
	[NeemVermi] [int] NOT NULL,
	[NewPacket] [int] NOT NULL,
	[Neem] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NULL,
	[DeliveryDate] [date] NULL,
	[CustomerId] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[Date] [date] NULL,
	[PaymentType] [varchar](50) NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 12/8/2022 12:08:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vermi] [decimal](18, 0) NULL,
	[NeemVermi] [decimal](18, 0) NULL,
	[DateCreated] [date] NULL,
	[Description] [varchar](100) NULL,
	[NewPack] [decimal](18, 0) NULL,
	[Neem] [decimal](18, 0) NULL
)

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Communication] ON 

INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (1, NULL, N'Call him tomorrow', CAST(N'2022-03-05' AS Date), 11, CAST(N'2022-03-06' AS Date))
INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (2, NULL, N'', CAST(N'2022-03-10' AS Date), 12, CAST(N'2022-03-18' AS Date))
INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (3, NULL, N'Will talk later', CAST(N'2022-03-10' AS Date), 14, CAST(N'2022-03-18' AS Date))
INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (4, NULL, N'They have packets', CAST(N'2022-03-10' AS Date), 15, CAST(N'2022-03-18' AS Date))
INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (5, NULL, N'After Holi', CAST(N'2022-03-14' AS Date), 2, CAST(N'2022-03-20' AS Date))
INSERT [dbo].[Communication] ([Id], [Description], [Details], [Date], [CustomerId], [FollowUp]) VALUES (6, NULL, N'After Holi', CAST(N'2022-03-14' AS Date), 10, CAST(N'2022-03-20' AS Date))
SET IDENTITY_INSERT [dbo].[Communication] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (1, N'Satya Prakash', N'Honeyman Chauraha', N'Lucknow', N'Uttar Pradesh', N'8188859068', N'9936433319', NULL, N'Satya Prakash', N'', NULL, 5, CAST(N'2022-02-27' AS Date), 7)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (2, N'Champion nursery', N' 131, Vikrant khand-1 gomti nager', N'Lucknow', N'Uttar Pradesh', N'7408116239', N'0', NULL, N'Madhuresh', N'0', NULL, 6, CAST(N'2022-02-27' AS Date), 10)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (3, N'Akash Netual Plant And Flowers', N' Haneyman churaha Gomti Nagar', N'Lucknow', N'Uttar Pradesh', N'7525898915', N'0', NULL, N'Akash Bhai', N'0', NULL, 7, CAST(N'2022-02-27' AS Date), 10)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (4, N'Narender Verma Nursary', N'G.I.C School ke just samne', N'Barabanki', N'Uttar Pradesh', N'9621310328', N'0', NULL, N'Narendra Shingh', N'0', NULL, 8, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (5, N'Jai Ram Nursary', N'Honeyman chauraha', N'Lucknow', N'Uttar Pradesh', N'9616127570', N'0', NULL, N'Jai Ram', N'0', NULL, 9, CAST(N'2022-02-27' AS Date), 25)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (7, N'Islam Nursury', N'GIC  School ke samne', N'Barabanki', N'Uttar Pradesh', N'9120663194', N'0', NULL, N'Islam Bhai', N'0', NULL, 11, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (8, N'Lucknow Nursury', N'6/179 Vineet khand Gomti Nagar ', N'Lucknow', N'Uttar Pradesh', N'9455448219', N'9026885584', NULL, N'Raj', N'', NULL, 12, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (11, N'Hari Om Nursery', N'Vardaan Khand-1, Near C.M.S. School , sadar tahsil', N'Lucknow', N'Uttar Pradesh', N'9519073137', N'0', NULL, N'Hari Om Mishra', N'0', NULL, 15, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (15, N'Bhagat Nursery', N'Hum Safhar Resturent , Bahraich Road ', N'Balrampur', N'Uttar Pradesh', N'7235007704', N'9161153423', NULL, N'Bhagat ', N'Vijay', NULL, 19, CAST(N'2022-02-27' AS Date), 30)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (16, N'Verma ji Nursery', N'GIC ke just Bagal main. Barabanki', N'Barabanki', N'Uttar Pradesh', N'6390832682', N'0', NULL, N'verma ji', N'0', NULL, 20, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (17, N'Moin -Gamla', N'Salimar Pairadise, Safaidabad', N'Lucknow', N'Uttar Pradesh', N'8303800968', N'8009579897', NULL, N'Moid', N'Mohit', NULL, 21, CAST(N'2022-02-27' AS Date), 21)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (18, N'Green Nursery', N'122, New Haidrabad, IT Over breze ke paas', N'Lucknow', N'Uttar Pradesh', N'9696300186', N'0', NULL, N'Gaurav Singh', N'0', NULL, 22, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (20, N'Mukesh', N'Badshah Nagar - Near IT Chauraha', N'Lucknow', N'Uttar Pradesh', N'123456709', N'0', NULL, N'Mukesh', N'', NULL, 24, CAST(N'2022-03-27' AS Date), NULL)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (6, N'Lalta Prasad Maurya nursery', N'Sadar tehsil lucknow', N'lucknow', N'Uttar Pradesh', N'8174888862', N'0', NULL, N'Lalta Prasad', N'0', NULL, 10, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (9, N'Indian Nursery', N'Vineet Khand 6, Gomti Nagar ', N'Lucknow', N'Uttar Pradesh', N'9026342628', N'0', NULL, N'Junaid', N'0', NULL, 13, CAST(N'2022-02-27' AS Date), 7)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (10, N'Chhote Lal Nursury', N'Vikrant Khand -1 , Gomti Nagar , ', N'Lucknow', N'Uttar Pradesh', N'8953212142', N'8174907265', NULL, N'Rajendra', N'Chote lal', NULL, 14, CAST(N'2022-02-27' AS Date), 30)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (12, N'Abdul Haek - Gamla', N'Salimar ke saamne, Safedabad', N'Lucknow', N'Uttar Pradesh', N'9956605940', N'0', NULL, N'Abdul Haik', N'0', NULL, 16, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (13, N'Sakeel Ahmad - Gamla', N'Salimar Piradise ke samne, Safhedabad', N'Lucknow', N'Uttar Pradesh', N'9936817850', N'0', NULL, N'Sakeel', N'0', NULL, 17, CAST(N'2022-02-27' AS Date), 15)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (14, N'Akanksha Nursery', N'Sadar Tahsil Lucknow, ', N'Lucknow', N'Uttar Pradesh', N'7522838870', N'0', NULL, N'Sachin', N'0', NULL, 18, CAST(N'2022-02-27' AS Date), 60)
INSERT [dbo].[Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [AlterPhone2], [PrimaryContact], [AlterContact1], [AlterContact2], [RateId], [CustomerSince], [WaitTime]) VALUES (19, N'Balrampur Nursery', N'Gonda Road, Near Veer Vinay Chauraha', N'Balrampur', N'Uttar Pradesh', N'7408644006', N'', NULL, N'Balrampur Nursery', N'', NULL, 23, CAST(N'2022-03-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[D_Customer] ON 

INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (1, N'Akanksha Bakery', N'St Anthony School', N'Barabanki', NULL, N'8887767431', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'Bakery', N'St Anthony', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (2, N'Arpit Bakery', N'Yes Bank, Satrikh', N'Barabanki', NULL, N'7785819925', NULL, NULL, NULL, CAST(N'2022-07-11' AS Date), 0, N'Bakery', N'Satrikh', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (3, N'Aarif Shop , Sajjid', N'Anand Nagar Deva Road', NULL, NULL, N'7007383972', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 0, N'Kirana', N'Deva Road', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (4, N'Big Bite', N'Tasty Bite Lucknow Road', NULL, NULL, N'9455187555', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'QSR', N'Tasty Bite', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (5, N'Brown Town Bakery', N'Ram Sevak, Lukhpaira Bag', NULL, NULL, N'9044994042', NULL, NULL, NULL, CAST(N'2022-07-05' AS Date), 1, N'Bakery', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (6, N'Bake N Take Bakery', N'Sec 5, Avas Vikas, Bada Park', NULL, NULL, N'6386743800', NULL, NULL, NULL, CAST(N'2022-07-05' AS Date), 0, N'Bakery', N'Avas Vikas', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (7, N'Bindra Sweets', N'Kuchehry, Lucknow Road', NULL, NULL, N'9120455131', NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'QSR', N'Kuchehry', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (8, N'Bharat Business', N'Kuchehry.. Bharat Studio', NULL, NULL, N'9450125022', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'QSR', N'Kuchehry', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (9, N'Banarshi General Store', N'Railway Station', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-19' AS Date), 0, N'Kirana', N'Railway Station', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (10, N'Best Bakery', N'Police Line Chauraha', NULL, NULL, N'7905244801', NULL, NULL, NULL, CAST(N'2022-07-20' AS Date), 1, N'Bakery', N'Police Line', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (11, N'City Heart Bakers', N'Ghosiyana Road ', NULL, NULL, N'8953776699', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 0, N'Bakery', N'Ghosiyana', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (12, N'Café Home Town', N'Easy Day, LIC Road', NULL, NULL, N'9555723757', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 0, N'QSR', N'Easy Day', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (13, N'Chhotu General Store', N'Vikas Bhawan, Kothideeh', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 0, N'Kirana', N'Vikas Bhavan', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (14, N'Chachi Dukaan', N'Maruti Suzuki Arena', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 0, N'QSR', N'Maruti', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (15, N'Gujju Hotel', N'Old RLB', NULL, NULL, N'9044794597', NULL, NULL, NULL, CAST(N'2022-07-05' AS Date), 1, N'QSR', N'Avas Vikas', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (16, N'Friends Zone', N'Polic Line Chauraha', NULL, NULL, N'8081745671', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'QSR', N'Police Line', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (17, N'Everything shoppe', N'Mugal Darbaar ', NULL, NULL, N'8127571186', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'Bakery', N'Mugal Darbaar', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (18, N'Decent Comm -unication', N'Raj Kamal Road ', NULL, NULL, N'8858665149', NULL, NULL, NULL, CAST(N'2022-07-13' AS Date), 0, N'Kirana', N'Raj Kamal Road ', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (20, N'Departmental Store', N'Raj Kamal Road ', NULL, NULL, N'7071198131', NULL, NULL, NULL, CAST(N'2022-07-13' AS Date), 0, N'Kirana', N'Raj Kamal Road ', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (21, N'Hind Bakery', N'Ram Sevak Lakhpairabag', NULL, NULL, N'9140807739', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'Bakery', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (22, N'Jail Café', N'Easy Day, LIC Road', NULL, NULL, N'6392996855', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'Hotel', N'Easy Day', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (23, N'Kanak General Store', N'Ujjwal Nagar, Jagnehta', NULL, NULL, N'8756280909', NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 1, N'Kirana', N'Jagnehta', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (24, N'Kanha Hotel', N'Vikas Bhavan', NULL, N'', N'9455188188', NULL, NULL, NULL, CAST(N'2022-07-05' AS Date), 1, N'QSR', N'Vikas Bhavan', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (25, N'Laxmi Sweets', N'Promila Diagnostics', NULL, NULL, N'9338820840', NULL, NULL, NULL, CAST(N'2022-07-19' AS Date), 1, N'QSR', N'Promila', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (26, N'Lukky Café', N'Indira Market, Kamala Nehru Park', NULL, NULL, N'8299453850', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'QSR', N'Indira Market', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (27, N'Maneesh Bakery- Lajpat Nager', N'Lajpat Nagar', NULL, NULL, N'8858359715', NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'Bakery', N'Lajpat Nagar', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (28, N'Mahima Bakery - Lakpairabag', N'Shiv Mandir, Lakhpaira bag', NULL, NULL, N'9580370876', NULL, NULL, NULL, CAST(N'2022-07-07' AS Date), 1, N'Bakery', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (29, N'Mahagauri Hotel', N'Sai Inter College, Lakhpairabag', NULL, NULL, N'9335529250', NULL, NULL, NULL, CAST(N'2022-07-11' AS Date), 0, N'QSR', N'Lakhpaira Bag', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (30, N'Maneesh Bakery -Dusehra Bag', N'Dussehara Bag', NULL, NULL, N'9580366261', NULL, NULL, NULL, CAST(N'2022-07-11' AS Date), 0, N'Bakery', N'Dussehara Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (31, N'Manoj General Store', N'Tara Timber nai Basti', NULL, NULL, N'8004815821', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'Kirana', N'Nai Basti', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (32, N'Mradul Saini', N'Court, Kuchehari', NULL, NULL, N'7753929227', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'QSR', N'Kuchehry', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (33, N'Mother Dairy Shop', N'Court, Kuchehri', NULL, NULL, N'9935030781', NULL, NULL, NULL, CAST(N'2022-07-18' AS Date), 1, N'QSR', N'Kuchehry', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (34, N'Mahima Bakery - Laiya Mandi', N'Laiya Mandi Road', NULL, NULL, N'6306036114', NULL, NULL, NULL, CAST(N'2022-07-13' AS Date), 1, N'Bakery', N'Laiya Mandi', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (35, N'New Bala ji Bakery', N'Promila Diagnostics', NULL, NULL, N'8574652421', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'Bakery', N'Promila', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (36, N'Niraj Verma', N'Maruti Shuzuki Arena', NULL, NULL, N'6386048017', NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 0, N'QSR', N'Maruti', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (37, N'Om General Store', N'Jal Nigam Road', NULL, NULL, N'8299280720', NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 1, N'Kirana', N'Jal Nigam Road', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (38, N'Prakash Bakery', N'Akash Palace, Lakhpaira Bag', NULL, NULL, N'9450283374', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'Bakery', N'Lakhpaira Bag', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (39, N'Parag Milk Foods', N'Court, Kuchehri', NULL, NULL, N'9454722427', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'QSR', N'Kuchehry', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (40, N'Radhe General Store', N'St Anthony', NULL, NULL, N'9792277442', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'Kirana', N'St Anthony', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (41, N'Raj Family Mart', N'Vikas Bhavan', NULL, NULL, N'9826170015', NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 1, N'Kirana', N'Vikas Bhavan', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (42, N'Rinku Cool Corner', N'Court Kuchehry', NULL, NULL, N'9140553787', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'QSR', N'Kuchehry', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (43, N'Rehaan General Store', N'Railway Station', NULL, NULL, N'7985292982', NULL, NULL, NULL, CAST(N'2022-07-19' AS Date), 0, N'Kirana', N'Railway Station', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (44, N'Quality General Store', N'RTO Office', NULL, N'', N'7007587228', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 0, N'Kirana', N'RTO', 1)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (45, N'Subh General Store', N'Shiv Mandir, Lakpairabag', NULL, NULL, N'7905401142', NULL, NULL, NULL, CAST(N'2022-07-07' AS Date), 1, N'Kirana', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (46, N'Shivam Chourasia Store', N'St Anthony', NULL, NULL, N'9889348734', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 1, N'Kirana', N'St Anthony', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (47, N'Soda-Shop Cold Drink', N'Indira Market, Kamala Nehru Park', NULL, NULL, N'8419862499', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 0, N'QSR', N'Indira Market', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (48, N'Shatrohan Sweets', N'D M Awas, Easy Day', NULL, NULL, N'7985581085', NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'QSR', N'Easy Day', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (49, N'Shri Balaji Bakery', N'Raj Kamal Road ', NULL, NULL, N'9044698486', NULL, NULL, NULL, CAST(N'2022-07-13' AS Date), 1, N'Bakery', N'Raj Kamal Road ', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (50, N'Smart Choice Bakery', N'Mugal Darbaar ', NULL, N'', N'8604512886', NULL, NULL, NULL, CAST(N'2022-07-09' AS Date), 0, N'Bakery', N'Mugal Darbaar ', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (51, N'Shri Ram Cool Corner', N'Telephone Exchange', NULL, NULL, N'9752096791', NULL, NULL, NULL, CAST(N'2022-07-07' AS Date), 1, N'QSR', N'Telephone Exchange', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (52, N'Sai Kripa Shop', N'Tara Timber nai Basti', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'Kirana', N'Nai Basti', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (53, N'Sardaar ji Store', N'Post Office', NULL, NULL, N'9044011725', NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'Kirana', N'Post Office', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (54, N'Shuresh Tea Stal', N'Mishra Bus Dipo', NULL, NULL, N'8115115780', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'QSR', N'Bus Dipo', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (55, N'Sharma Hotal', N'Mishra Bus Dipo', NULL, NULL, N'9935496073', NULL, NULL, NULL, CAST(N'2022-07-16' AS Date), 1, N'Hotel', N'Bus Dipo', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (56, N'The Brown Bite', N'Avas Vikas, Gupta Hotel', NULL, NULL, N'9506018153', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'QSR', N'Avas Vikas', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (57, N'The Sky House', N'Gayatri Mandir, Lucknow Road', NULL, NULL, N'8840284854', NULL, NULL, NULL, CAST(N'2022-07-06' AS Date), 1, N'QSR', N'Tasty Bite', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (58, N'Varun General Store', N'Jal Nigam Road', NULL, NULL, N'9956291234', NULL, NULL, NULL, CAST(N'2022-07-08' AS Date), 1, N'Kirana', N'Jal Nigam Road', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (59, N'Vipin General Store', N'Aata Chakki Kothideeh', NULL, NULL, N'8299668665', NULL, NULL, NULL, CAST(N'2022-07-12' AS Date), 1, N'Kirana', N'KothiDeeh', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (60, N'Vishvanath Hotal', N'Railway Station', NULL, NULL, N'7800337800', NULL, NULL, NULL, CAST(N'2022-07-19' AS Date), 1, N'QSR', N'Railway Station', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (61, N'Zixy Bite- Ram Sevak', N'Ram Sevak, Lakhpaira Bag', NULL, NULL, N'9169100356', NULL, NULL, NULL, CAST(N'2022-07-13' AS Date), 1, N'QSR', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (67, N'Star General Store', N'Laiya Mandi', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-27' AS Date), 0, N'Kirana', N'Laiya Mandi', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (62, N'Zixy Bite- Dusehra Bag', N'Dusehra Bag', NULL, NULL, N'8299415718', NULL, NULL, NULL, CAST(N'2022-07-07' AS Date), 0, N'QSR', N'Dussehara Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (63, N'Zaved General Store', N'Railway Station, BBK', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-19' AS Date), 0, N'Kirana', N'Railway Station', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (65, N'Thakur Store', N'Lakhpaira Bag', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-31' AS Date), 0, N'Kirana', N'Lakhpaira Bag', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (66, N'Kartik', N'NA', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-05' AS Date), 0, N'QSR', N'NA', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (68, N'New Jail Cafe- Arnab', N'Easy Day', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-27' AS Date), 0, N'Hotal', N'Easy Day', 0)
INSERT [dbo].[D_Customer] ([Id], [Name], [Address], [City], [State], [PrimaryPhone], [AlterPhone1], [PrimaryContact], [AlterContact1], [CustomerSince], [IsAdvertised], [ShopType], [Area], [Disable]) VALUES (64, N'Avon Juice Corner', N'Railway Station', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-05' AS Date), 0, N'QSR', N'Railway Station', 0)
SET IDENTITY_INSERT [dbo].[D_Customer] OFF
SET IDENTITY_INSERT [dbo].[D_Orders] ON 

INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (3, N'1 Jeera', CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 38, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (4, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-08' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (5, N'', CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (6, NULL, CAST(N'2022-07-11' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (7, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (8, NULL, CAST(N'2022-07-14' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), CAST(N'2022-07-14' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (9, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (10, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (11, NULL, CAST(N'2022-07-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-22' AS Date), CAST(N'2022-07-22' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (12, NULL, CAST(N'2022-07-25' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-25' AS Date), CAST(N'2022-07-25' AS Date), 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (13, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-13' AS Date), 56, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (14, NULL, CAST(N'2022-07-13' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-08-02' AS Date), 56, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (15, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), 46, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (16, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-13' AS Date), 46, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (17, N'', CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 46, NULL, CAST(N'2022-08-14 21:19:46.087' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (18, NULL, CAST(N'2022-07-05' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-07' AS Date), 15, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (19, NULL, CAST(N'2022-07-07' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-16' AS Date), 15, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (20, N'', CAST(N'2022-07-16' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 15, NULL, CAST(N'2022-08-22 20:49:21.670' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (21, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-13' AS Date), 45, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (22, N'', CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-28' AS Date), 45, NULL, CAST(N'2022-08-21 18:55:21.013' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (23, NULL, CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-28' AS Date), 49, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (24, N'', CAST(N'2022-07-14' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 49, NULL, CAST(N'2022-08-09 16:09:46.923' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (25, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (26, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (27, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (28, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (29, NULL, CAST(N'2022-07-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-21' AS Date), CAST(N'2022-07-21' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (30, NULL, CAST(N'2022-07-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-23' AS Date), CAST(N'2022-07-23' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (31, NULL, CAST(N'2022-07-09' AS Date), 0.25, 0.25, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-11' AS Date), 47, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (32, NULL, CAST(N'2022-07-11' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-18' AS Date), 47, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (33, N'', CAST(N'2022-07-18' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 47, NULL, CAST(N'2022-08-08 16:57:50.070' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (34, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-18' AS Date), 11, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (35, N'', CAST(N'2022-07-11' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), NULL, 11, NULL, CAST(N'2022-09-19 21:25:44.847' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (36, N'', CAST(N'2022-07-18' AS Date), 0, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 11, NULL, CAST(N'2022-09-19 21:25:57.520' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (69, N'', CAST(N'2022-07-26' AS Date), 0, 3, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (70, N'', CAST(N'2022-07-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), NULL, 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (71, NULL, CAST(N'2022-07-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), CAST(N'2022-07-26' AS Date), 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (72, N'', CAST(N'2022-07-26' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 15, NULL, CAST(N'2022-09-10 03:23:06.270' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (73, NULL, CAST(N'2022-07-26' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (88, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 21, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (89, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 57, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (90, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 57, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (91, NULL, CAST(N'2022-07-24' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-24' AS Date), 57, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (92, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-15' AS Date), 28, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (93, NULL, CAST(N'2022-07-15' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), CAST(N'2022-07-19' AS Date), 28, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (94, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-27' AS Date), 28, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (95, N'', CAST(N'2022-07-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), NULL, 28, NULL, CAST(N'2022-08-04 16:53:11.183' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (97, N'Paid long back', CAST(N'2022-07-09' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), NULL, 12, NULL, CAST(N'2022-09-21 05:01:57.963' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (98, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (99, NULL, CAST(N'2022-07-15' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), NULL, 1, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (100, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 50, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (101, NULL, CAST(N'2022-07-11' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 29, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (102, NULL, CAST(N'2022-07-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-28' AS Date), 30, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (103, NULL, CAST(N'2022-07-11' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 2, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (104, N'', CAST(N'2022-07-12' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), NULL, 7, NULL, CAST(N'2022-08-20 01:07:14.967' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (105, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 18, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (106, NULL, CAST(N'2022-07-06' AS Date), 0.5, 0.5, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 31, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (107, NULL, CAST(N'2022-07-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 31, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (108, NULL, CAST(N'2022-07-15' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), CAST(N'2022-07-15' AS Date), 31, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (109, N'Paid long back', CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 13, NULL, CAST(N'2022-09-21 04:59:29.073' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (110, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-18' AS Date), 51, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (111, NULL, CAST(N'2022-07-18' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-24' AS Date), 51, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (112, N'', CAST(N'2022-07-24' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), NULL, 51, NULL, CAST(N'2022-08-04 16:54:33.967' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (113, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-18' AS Date), 58, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (114, N'', CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 58, NULL, CAST(N'2022-09-11 18:26:41.230' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (115, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-18' AS Date), 37, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (116, N'', CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 37, NULL, CAST(N'2022-09-29 17:58:20.583' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (117, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-19' AS Date), 41, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (118, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 41, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (119, NULL, CAST(N'2022-07-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-24' AS Date), 41, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (120, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-26' AS Date), 23, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (121, N'', CAST(N'2022-07-26' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 23, NULL, CAST(N'2022-10-11 04:52:39.880' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (122, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-08' AS Date), 14, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (123, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 59, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (124, NULL, CAST(N'2022-07-26' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), CAST(N'2022-07-26' AS Date), 59, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (125, N'', CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), NULL, 52, NULL, CAST(N'2022-08-22 20:48:26.070' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (126, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 20, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (331, N'', CAST(N'2022-09-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-20' AS Date), NULL, 37, CAST(N'2022-09-20 16:48:00.067' AS DateTime), CAST(N'2022-09-29 17:58:48.470' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (127, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-19' AS Date), 53, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (128, N'', CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), NULL, 53, NULL, CAST(N'2022-08-22 20:41:31.000' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (129, NULL, CAST(N'2022-07-16' AS Date), 0, 0, 0, N'NA', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 44, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (130, NULL, CAST(N'2022-07-16' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-28' AS Date), 39, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (131, N'', CAST(N'2022-07-16' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 8, NULL, CAST(N'2022-09-11 18:20:24.723' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (132, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 32, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (133, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-26' AS Date), 42, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (134, N'', CAST(N'2022-07-26' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 42, NULL, CAST(N'2022-09-19 18:02:55.220' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (135, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-21' AS Date), 54, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (136, NULL, CAST(N'2022-07-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-21' AS Date), CAST(N'2022-08-02' AS Date), 54, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (148, NULL, CAST(N'2022-07-30' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-30' AS Date), CAST(N'2022-08-02' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (162, N'', CAST(N'2022-08-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-02' AS Date), NULL, 55, NULL, CAST(N'2022-09-19 17:59:40.300' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (163, NULL, CAST(N'2022-08-02' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-02' AS Date), CAST(N'2022-08-02' AS Date), 16, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (37, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), 40, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (38, NULL, CAST(N'2022-07-12' AS Date), 1, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-17' AS Date), 40, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (39, N'', CAST(N'2022-07-17' AS Date), 1, 2, 3, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-17' AS Date), CAST(N'2022-07-19' AS Date), 40, NULL, CAST(N'2022-08-09 16:11:54.497' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (40, NULL, CAST(N'2022-07-12' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (41, NULL, CAST(N'2022-07-14' AS Date), 1, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), CAST(N'2022-07-16' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (42, NULL, CAST(N'2022-07-16' AS Date), 0, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (43, NULL, CAST(N'2022-07-19' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-28' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (44, NULL, CAST(N'2022-07-22' AS Date), 1, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-22' AS Date), CAST(N'2022-07-30' AS Date), 27, NULL, NULL)
GO
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (74, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-24' AS Date), 55, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (75, NULL, CAST(N'2022-07-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-08-02' AS Date), 55, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (76, N'returned and paid 235', CAST(N'2022-07-16' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 3, NULL, CAST(N'2022-08-10 17:28:50.440' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (77, N'', CAST(N'2022-07-18' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 33, NULL, CAST(N'2022-11-02 05:13:09.260' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (78, NULL, CAST(N'2022-07-19' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-24' AS Date), 60, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (79, NULL, CAST(N'2022-07-24' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-27' AS Date), 60, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (80, NULL, CAST(N'2022-07-19' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 9, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (81, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-27' AS Date), 63, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (82, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 43, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (83, NULL, CAST(N'2022-07-19' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 25, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (84, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 34, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (85, NULL, CAST(N'2022-07-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-20' AS Date), 34, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (86, NULL, CAST(N'2022-07-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), CAST(N'2022-07-27' AS Date), 34, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (87, N'', CAST(N'2022-07-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), NULL, 10, NULL, CAST(N'2022-08-06 16:29:03.163' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (144, N'', CAST(N'2022-07-27' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), NULL, 56, NULL, CAST(N'2022-08-14 21:14:43.553' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (145, N'', CAST(N'2022-07-29' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-29' AS Date), NULL, 4, NULL, CAST(N'2022-08-08 16:56:59.703' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (146, N'', CAST(N'2022-07-29' AS Date), 0, 1, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-29' AS Date), NULL, 7, NULL, CAST(N'2022-08-20 01:07:47.560' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (147, N'', CAST(N'2022-07-29' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-29' AS Date), NULL, 1, NULL, CAST(N'2022-09-10 18:35:43.507' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (156, NULL, CAST(N'2022-08-01' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-01' AS Date), CAST(N'2022-08-01' AS Date), 16, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (157, N'', CAST(N'2022-08-01' AS Date), 2, 1, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-01' AS Date), CAST(N'2022-08-01' AS Date), 27, NULL, CAST(N'2022-08-14 21:21:26.570' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (159, NULL, CAST(N'2022-08-01' AS Date), 0, 0, 0, N'Unpaid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-01' AS Date), NULL, 23, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (160, N'', CAST(N'2022-08-01' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-01' AS Date), NULL, 9, NULL, CAST(N'2022-08-06 16:29:50.100' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (250, N'', CAST(N'2022-08-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-26' AS Date), NULL, 35, NULL, CAST(N'2022-09-21 17:02:13.020' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (45, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-10' AS Date), 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (46, NULL, CAST(N'2022-07-10' AS Date), 2, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-10' AS Date), CAST(N'2022-07-26' AS Date), 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (47, NULL, CAST(N'2022-07-13' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (48, N'', CAST(N'2022-07-07' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-19' AS Date), 61, NULL, CAST(N'2022-08-04 16:40:49.703' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (49, N'returned this order  1 shikanji', CAST(N'2022-07-13' AS Date), 0, 0, 0, N'UnPaid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 61, NULL, CAST(N'2022-08-04 16:41:18.817' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (50, NULL, CAST(N'2022-07-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-18' AS Date), 5, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (51, N'', CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 5, NULL, CAST(N'2022-08-15 20:41:10.583' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (52, NULL, CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-13' AS Date), 35, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (53, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-24' AS Date), 35, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (54, N'', CAST(N'2022-07-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), NULL, 35, NULL, CAST(N'2022-08-20 01:02:18.260' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (55, NULL, CAST(N'2022-07-12' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-26' AS Date), 48, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (56, N'', CAST(N'2022-07-14' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 48, NULL, CAST(N'2022-08-27 21:06:55.480' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (57, NULL, CAST(N'2022-07-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-28' AS Date), 6, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (58, NULL, CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (59, NULL, CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (60, NULL, CAST(N'2022-07-20' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-20' AS Date), 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (61, NULL, CAST(N'2022-07-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-13' AS Date), 24, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (62, N'', CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 24, NULL, CAST(N'2022-09-11 19:01:19.593' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (63, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-11' AS Date), 17, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (64, NULL, CAST(N'2022-07-11' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-30' AS Date), 17, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (65, N'', CAST(N'2022-07-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 17, NULL, CAST(N'2022-08-27 21:13:54.893' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (66, NULL, CAST(N'2022-07-09' AS Date), 4, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 16, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (67, NULL, CAST(N'2022-07-13' AS Date), 0, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 16, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (68, NULL, CAST(N'2022-07-19' AS Date), 2, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 16, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (139, NULL, CAST(N'2022-07-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), CAST(N'2022-07-28' AS Date), 39, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (140, N'', CAST(N'2022-07-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), NULL, 30, NULL, CAST(N'2022-08-30 17:47:11.677' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (141, N'', CAST(N'2022-07-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), NULL, 21, NULL, CAST(N'2022-08-04 16:38:31.130' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (142, N'', CAST(N'2022-07-26' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 49, NULL, CAST(N'2022-08-21 18:18:29.547' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (143, N'', CAST(N'2022-07-28' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), NULL, 27, NULL, CAST(N'2022-08-09 16:16:22.463' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (149, N'', CAST(N'2022-07-31' AS Date), 0, 0, 2, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date), 59, NULL, CAST(N'2022-10-08 21:29:51.357' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (150, N'', CAST(N'2022-07-31' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), NULL, 58, NULL, CAST(N'2022-09-23 20:27:14.117' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (151, NULL, CAST(N'2022-07-31' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date), 27, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (152, NULL, CAST(N'2022-07-31' AS Date), 1, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), CAST(N'2022-07-31' AS Date), 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (328, N'', CAST(N'2022-09-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 20, CAST(N'2022-09-19 21:22:23.847' AS DateTime), CAST(N'2022-09-19 21:22:23.847' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (153, N'', CAST(N'2022-07-31' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), NULL, 36, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (154, N'', CAST(N'2022-07-31' AS Date), 1, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), NULL, 45, NULL, CAST(N'2022-08-20 01:06:21.950' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (155, N'', CAST(N'2022-07-31' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-31' AS Date), NULL, 35, NULL, CAST(N'2022-08-20 01:02:46.520' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (173, NULL, CAST(N'2022-08-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 34, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (174, NULL, CAST(N'2022-08-03' AS Date), 0, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 63, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (175, N'', CAST(N'2022-08-03' AS Date), 1, 0, 1, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 32, NULL, CAST(N'2022-10-11 04:49:46.170' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (176, N'', CAST(N'2022-08-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 51, NULL, CAST(N'2022-08-27 21:16:52.850' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (177, N'', CAST(N'2022-08-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-03' AS Date), NULL, 40, NULL, CAST(N'2022-09-13 14:26:43.957' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (178, NULL, CAST(N'2022-08-03' AS Date), 2, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-03' AS Date), NULL, 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (179, N'', CAST(N'2022-08-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-03' AS Date), NULL, 36, NULL, CAST(N'2022-08-14 21:16:38.350' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (180, N'', CAST(N'2022-08-04' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 28, NULL, CAST(N'2022-08-17 23:45:22.107' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (182, N'', CAST(N'2022-08-05' AS Date), 2, 2, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-05' AS Date), NULL, 27, NULL, CAST(N'2022-08-18 17:29:33.673' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (183, N'', CAST(N'2022-08-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-05' AS Date), NULL, 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (184, N'', CAST(N'2022-08-06' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-06' AS Date), NULL, 37, NULL, CAST(N'2022-08-10 17:28:02.347' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (185, N'', CAST(N'2022-08-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-06' AS Date), NULL, 48, NULL, CAST(N'2022-09-20 16:50:19.270' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (186, N'', CAST(N'2022-08-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-06' AS Date), NULL, 56, NULL, CAST(N'2022-08-16 19:51:21.893' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (187, N'', CAST(N'2022-08-07' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-07' AS Date), NULL, 9, NULL, CAST(N'2022-08-15 05:38:02.677' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (197, N'', CAST(N'2022-08-10' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-10' AS Date), NULL, 37, NULL, CAST(N'2022-09-11 18:25:17.610' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (200, N'', CAST(N'2022-08-13' AS Date), 3, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-13' AS Date), NULL, 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (199, N'', CAST(N'2022-08-10' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-10' AS Date), NULL, 36, NULL, CAST(N'2022-08-14 21:17:35.650' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (201, N'', CAST(N'2022-08-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-13' AS Date), NULL, 22, NULL, CAST(N'2022-08-15 20:43:39.343' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (202, N'', CAST(N'2022-08-13' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-13' AS Date), NULL, 40, NULL, CAST(N'2022-11-05 17:28:57.357' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (203, N'', CAST(N'2022-08-13' AS Date), 3, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-13' AS Date), NULL, 16, NULL, CAST(N'2022-08-27 21:09:13.180' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (204, N'', CAST(N'2022-08-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-13' AS Date), NULL, 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (205, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 56, NULL, CAST(N'2022-08-23 17:21:23.837' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (316, N'', CAST(N'2022-09-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 55, CAST(N'2022-09-17 18:59:11.110' AS DateTime), CAST(N'2022-10-08 21:37:59.073' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (207, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 36, NULL, CAST(N'2022-09-12 21:53:29.247' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (251, N'', CAST(N'2022-08-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-26' AS Date), NULL, 21, NULL, CAST(N'2022-09-10 18:30:04.593' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (164, N'', CAST(N'2022-08-02' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-02' AS Date), NULL, 21, NULL, CAST(N'2022-08-30 17:45:48.707' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (181, N'100 extra pay kiya', CAST(N'2022-08-04' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-04' AS Date), NULL, 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (188, N'', CAST(N'2022-08-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-08' AS Date), NULL, 34, NULL, CAST(N'2022-08-14 21:29:26.483' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (189, N'', CAST(N'2022-08-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-08' AS Date), NULL, 54, NULL, CAST(N'2022-09-29 17:56:20.080' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (190, N'', CAST(N'2022-08-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-08' AS Date), NULL, 18, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (191, N'', CAST(N'2022-08-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-08' AS Date), NULL, 47, NULL, CAST(N'2022-08-27 21:12:31.640' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (192, N'', CAST(N'2022-08-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-08' AS Date), NULL, 4, NULL, CAST(N'2022-08-13 15:55:47.667' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (193, N'', CAST(N'2022-08-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-09' AS Date), NULL, 49, NULL, CAST(N'2022-09-19 21:24:25.970' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (194, N'', CAST(N'2022-08-09' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-09' AS Date), NULL, 22, NULL, CAST(N'2022-08-13 15:49:03.603' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (195, N'', CAST(N'2022-08-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-09' AS Date), NULL, 45, NULL, CAST(N'2022-09-13 13:26:23.213' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (196, N'', CAST(N'2022-08-09' AS Date), 3, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-09' AS Date), NULL, 27, NULL, CAST(N'2022-08-21 18:19:20.987' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (215, N'', CAST(N'2022-08-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-12' AS Date), NULL, 51, NULL, CAST(N'2022-08-27 21:16:12.413' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (228, N'', CAST(N'2022-08-21' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-21' AS Date), NULL, 37, NULL, CAST(N'2022-11-02 19:48:46.117' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (229, N'', CAST(N'2022-08-21' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-21' AS Date), NULL, 27, NULL, CAST(N'2022-09-10 18:07:28.827' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (252, N'', CAST(N'2022-08-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-26' AS Date), NULL, 28, NULL, CAST(N'2022-09-10 18:33:40.597' AS DateTime))
GO
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (256, N'', CAST(N'2022-08-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-27' AS Date), NULL, 51, NULL, CAST(N'2022-09-21 16:54:03.080' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (263, N'', CAST(N'2022-08-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-30' AS Date), NULL, 21, CAST(N'2022-08-30 17:46:10.050' AS DateTime), CAST(N'2022-09-13 13:24:15.947' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (265, N'', CAST(N'2022-08-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-30' AS Date), NULL, 34, CAST(N'2022-08-30 17:49:01.960' AS DateTime), CAST(N'2022-09-13 13:21:51.790' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (266, N'', CAST(N'2022-08-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-30' AS Date), NULL, 5, CAST(N'2022-08-30 17:50:05.880' AS DateTime), CAST(N'2022-09-22 16:45:40.540' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (264, N'', CAST(N'2022-08-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-30' AS Date), NULL, 30, CAST(N'2022-08-30 17:47:39.380' AS DateTime), CAST(N'2022-10-01 18:04:27.933' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (230, N'', CAST(N'2022-08-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-20' AS Date), NULL, 45, NULL, CAST(N'2022-09-13 13:26:43.733' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (231, N'', CAST(N'2022-08-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-20' AS Date), NULL, 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (232, N'', CAST(N'2022-08-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-20' AS Date), NULL, 34, NULL, CAST(N'2022-08-22 20:44:34.360' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (233, N'', CAST(N'2022-08-22' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 22, NULL, CAST(N'2022-08-27 21:11:12.720' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (234, N'', CAST(N'2022-08-22' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 49, NULL, CAST(N'2022-10-08 21:43:45.587' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (235, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 5, NULL, CAST(N'2022-09-13 14:28:06.910' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (236, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 28, NULL, CAST(N'2022-08-26 16:14:04.593' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (237, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 39, NULL, CAST(N'2022-09-19 18:05:33.500' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (238, N'', CAST(N'2022-08-22' AS Date), 0, 0, 0, N'UnPaid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 8, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (239, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 55, NULL, CAST(N'2022-09-27 18:33:20.197' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (240, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 60, NULL, CAST(N'2022-08-29 16:24:23.263' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (241, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 34, NULL, CAST(N'2022-08-30 17:48:37.800' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (242, N'', CAST(N'2022-08-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-22' AS Date), NULL, 10, NULL, CAST(N'2022-09-23 20:23:53.680' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (243, N'', CAST(N'2022-08-23' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-23' AS Date), NULL, 56, NULL, CAST(N'2022-09-22 16:38:41.947' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (244, N'', CAST(N'2022-08-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-23' AS Date), NULL, 53, NULL, CAST(N'2022-09-29 17:56:42.613' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (245, N'', CAST(N'2022-08-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-23' AS Date), NULL, 36, NULL, CAST(N'2022-09-12 21:53:45.053' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (246, N'', CAST(N'2022-08-25' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-25' AS Date), NULL, 9, NULL, CAST(N'2022-09-10 18:38:23.020' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (247, N'', CAST(N'2022-08-25' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-25' AS Date), NULL, 27, NULL, CAST(N'2022-09-10 18:07:44.750' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (248, N'', CAST(N'2022-08-25' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-25' AS Date), NULL, 22, NULL, CAST(N'2022-08-30 17:44:38.423' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (249, N'', CAST(N'2022-08-25' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-25' AS Date), NULL, 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (208, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 46, NULL, CAST(N'2022-09-10 18:25:15.810' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (209, N'', CAST(N'2022-08-14' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 27, NULL, CAST(N'2022-08-23 17:22:56.353' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (210, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 1, NULL, CAST(N'2022-09-26 16:06:43.570' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (211, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 41, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (212, N'', CAST(N'2022-08-14' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 20, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (213, N'', CAST(N'2022-08-14' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 60, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (214, N'', CAST(N'2022-08-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-14' AS Date), NULL, 34, NULL, CAST(N'2022-08-21 18:56:57.000' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (218, N'', CAST(N'2022-08-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-16' AS Date), NULL, 15, NULL, CAST(N'2022-09-10 03:23:23.580' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (219, N'', CAST(N'2022-08-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-16' AS Date), NULL, 56, NULL, CAST(N'2022-08-23 17:21:46.900' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (317, N'', CAST(N'2022-09-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 49, CAST(N'2022-09-17 18:59:54.873' AS DateTime), CAST(N'2022-10-08 21:44:02.773' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (318, N'', CAST(N'2022-09-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 27, CAST(N'2022-09-17 19:00:17.640' AS DateTime), CAST(N'2022-09-17 19:00:17.640' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (327, N'', CAST(N'2022-09-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 42, CAST(N'2022-09-19 21:21:34.770' AS DateTime), CAST(N'2022-11-02 19:47:59.240' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (362, N'', CAST(N'2022-09-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-26' AS Date), NULL, 49, CAST(N'2022-09-26 16:07:59.507' AS DateTime), CAST(N'2022-10-08 21:44:21.697' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (405, N'', CAST(N'2022-10-12' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-12' AS Date), NULL, 27, CAST(N'2022-10-12 21:50:18.367' AS DateTime), CAST(N'2022-10-27 17:02:28.520' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (460, N'', CAST(N'2022-11-11' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-11' AS Date), NULL, 34, CAST(N'2022-11-12 23:26:20.820' AS DateTime), CAST(N'2022-11-12 23:26:20.820' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (220, N'', CAST(N'2022-08-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-16' AS Date), NULL, 31, NULL, CAST(N'2022-09-24 16:34:42.697' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (221, N'', CAST(N'2022-08-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-17' AS Date), NULL, 22, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (222, N'', CAST(N'2022-08-17' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-17' AS Date), NULL, 27, NULL, CAST(N'2022-08-25 16:33:21.990' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (223, N'', CAST(N'2022-08-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-17' AS Date), NULL, 28, NULL, CAST(N'2022-08-22 20:40:19.960' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (216, N'', CAST(N'2022-08-15' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-15' AS Date), NULL, 5, NULL, CAST(N'2022-08-30 17:49:40.850' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (217, N'', CAST(N'2022-08-15' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-15' AS Date), NULL, 22, NULL, CAST(N'2022-08-21 18:20:59.580' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (224, N'', CAST(N'2022-08-18' AS Date), 2, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-18' AS Date), NULL, 27, NULL, CAST(N'2022-09-10 18:07:08.177' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (262, N'', CAST(N'2022-08-28' AS Date), 2, 0, 0, N'Partial', CAST(200 AS Decimal(18, 0)), CAST(N'2022-08-28' AS Date), NULL, 1, CAST(N'2022-08-30 05:09:56.553' AS DateTime), CAST(N'2022-10-08 21:32:06.760' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (267, N'', CAST(N'2022-08-31' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-31' AS Date), NULL, 15, CAST(N'2022-08-31 16:13:05.293' AS DateTime), CAST(N'2022-09-10 03:23:48.487' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (268, N'', CAST(N'2022-08-31' AS Date), 3, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-31' AS Date), NULL, 27, CAST(N'2022-08-31 16:14:27.220' AS DateTime), CAST(N'2022-09-10 18:08:02.377' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (269, N'', CAST(N'2022-08-31' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-31' AS Date), NULL, 54, CAST(N'2022-08-31 16:15:47.390' AS DateTime), CAST(N'2022-10-08 21:28:48.200' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (225, N'', CAST(N'2022-08-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-19' AS Date), NULL, 4, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (226, N'', CAST(N'2022-08-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-19' AS Date), NULL, 35, NULL, CAST(N'2022-09-10 18:40:29.570' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (227, N'', CAST(N'2022-08-19' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-19' AS Date), NULL, 9, NULL, CAST(N'2022-09-10 18:37:40.770' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (253, N'', CAST(N'2022-08-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-27' AS Date), NULL, 17, NULL, CAST(N'2022-10-09 21:08:11.070' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (254, N'', CAST(N'2022-08-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-27' AS Date), NULL, 16, NULL, CAST(N'2022-09-10 18:26:50.210' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (257, N'', CAST(N'2022-08-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-29' AS Date), NULL, 36, NULL, CAST(N'2022-09-12 21:53:57.400' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (258, N'', CAST(N'2022-08-29' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-29' AS Date), NULL, 26, NULL, NULL)
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (259, N'', CAST(N'2022-08-29' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-29' AS Date), NULL, 22, CAST(N'2022-08-29 16:23:27.727' AS DateTime), CAST(N'2022-09-10 18:24:23.200' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (260, N'', CAST(N'2022-08-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-29' AS Date), NULL, 60, CAST(N'2022-08-29 16:24:04.970' AS DateTime), CAST(N'2022-09-24 16:36:36.710' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (261, N'', CAST(N'2022-08-29' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-29' AS Date), NULL, 9, CAST(N'2022-08-29 16:25:07.563' AS DateTime), CAST(N'2022-09-10 18:38:36.817' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (270, N'', CAST(N'2022-09-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 15, CAST(N'2022-09-10 03:24:19.633' AS DateTime), CAST(N'2022-09-10 03:24:58.173' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (272, N'', CAST(N'2022-09-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 56, CAST(N'2022-09-10 03:39:19.627' AS DateTime), CAST(N'2022-09-13 13:27:40.760' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (273, N'', CAST(N'2022-09-01' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-01' AS Date), NULL, 22, CAST(N'2022-09-10 03:42:01.447' AS DateTime), CAST(N'2022-09-10 03:42:01.447' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (274, N'', CAST(N'2022-09-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-03' AS Date), NULL, 22, CAST(N'2022-09-10 03:42:30.777' AS DateTime), CAST(N'2022-09-10 03:42:30.777' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (275, N'', CAST(N'2022-09-05' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-05' AS Date), NULL, 22, CAST(N'2022-09-10 03:43:02.103' AS DateTime), CAST(N'2022-09-10 03:43:02.103' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (276, N'', CAST(N'2022-09-07' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-07' AS Date), NULL, 22, CAST(N'2022-09-10 03:43:43.200' AS DateTime), CAST(N'2022-09-10 03:43:43.200' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (277, N'', CAST(N'2022-09-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 22, CAST(N'2022-09-10 03:44:00.263' AS DateTime), CAST(N'2022-09-15 02:30:23.380' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (284, N'', CAST(N'2022-09-09' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 46, CAST(N'2022-09-10 18:25:51.460' AS DateTime), CAST(N'2022-10-29 16:32:12.130' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (285, N'', CAST(N'2022-09-03' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-03' AS Date), NULL, 16, CAST(N'2022-09-10 18:27:24.253' AS DateTime), CAST(N'2022-09-11 18:52:11.090' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (308, N'', CAST(N'2022-09-12' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-12' AS Date), NULL, 22, CAST(N'2022-09-12 21:52:56.417' AS DateTime), CAST(N'2022-09-15 02:30:54.990' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (287, N'', CAST(N'2022-09-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-02' AS Date), NULL, 45, CAST(N'2022-09-10 18:29:13.403' AS DateTime), CAST(N'2022-09-24 16:31:16.853' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (288, N'', CAST(N'2022-09-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-02' AS Date), NULL, 21, CAST(N'2022-09-10 18:30:28.250' AS DateTime), CAST(N'2022-09-24 16:33:56.933' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (289, N'', CAST(N'2022-09-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-02' AS Date), NULL, 60, CAST(N'2022-09-10 18:31:17.870' AS DateTime), CAST(N'2022-09-27 18:33:48.150' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (290, N'', CAST(N'2022-09-02' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-02' AS Date), NULL, 9, CAST(N'2022-09-10 18:31:55.783' AS DateTime), CAST(N'2022-09-11 18:05:26.147' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (291, N'', CAST(N'2022-09-01' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-01' AS Date), NULL, 28, CAST(N'2022-09-10 18:34:18.457' AS DateTime), CAST(N'2022-09-13 13:22:40.663' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (292, N'', CAST(N'2022-09-08' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-08' AS Date), NULL, 28, CAST(N'2022-09-10 18:34:37.610' AS DateTime), CAST(N'2022-09-13 13:22:56.740' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (293, N'', CAST(N'2022-09-05' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-05' AS Date), NULL, 9, CAST(N'2022-09-10 18:36:42.230' AS DateTime), CAST(N'2022-09-23 20:25:43.493' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (314, N'', CAST(N'2022-09-14' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-14' AS Date), NULL, 22, CAST(N'2022-09-15 02:31:37.597' AS DateTime), CAST(N'2022-09-15 02:31:37.597' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (295, N'', CAST(N'2022-09-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-07' AS Date), NULL, 35, CAST(N'2022-09-10 18:40:01.613' AS DateTime), CAST(N'2022-09-27 18:24:38.010' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (296, N'', CAST(N'2022-09-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-07' AS Date), NULL, 42, CAST(N'2022-09-10 18:43:12.620' AS DateTime), CAST(N'2022-09-24 16:35:44.167' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (297, N'', CAST(N'2022-09-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-05' AS Date), NULL, 64, CAST(N'2022-09-10 18:50:24.247' AS DateTime), CAST(N'2022-09-23 18:14:55.307' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (315, N'', CAST(N'2022-09-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-16' AS Date), NULL, 4, CAST(N'2022-09-16 17:58:06.810' AS DateTime), CAST(N'2022-09-20 16:49:45.957' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (299, N'', CAST(N'2022-09-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-06' AS Date), NULL, 41, CAST(N'2022-09-10 18:52:54.357' AS DateTime), CAST(N'2022-09-19 04:09:17.457' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (302, N'', CAST(N'2022-09-09' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 16, CAST(N'2022-09-11 18:52:29.900' AS DateTime), CAST(N'2022-09-27 18:30:35.313' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (303, N'', CAST(N'2022-09-11' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-11' AS Date), NULL, 27, CAST(N'2022-09-11 18:54:00.073' AS DateTime), CAST(N'2022-09-29 17:59:09.940' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (319, N'', CAST(N'2022-09-17' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 16, CAST(N'2022-09-17 19:01:02.373' AS DateTime), CAST(N'2022-09-27 18:30:13.353' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (321, N'', CAST(N'2022-09-17' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 26, CAST(N'2022-09-17 19:01:48.357' AS DateTime), CAST(N'2022-09-27 18:25:49.487' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (322, N'', CAST(N'2022-09-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 15, CAST(N'2022-09-17 19:02:03.700' AS DateTime), CAST(N'2022-11-02 05:03:25.160' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (329, N'', CAST(N'2022-09-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 11, CAST(N'2022-09-19 21:26:15.033' AS DateTime), CAST(N'2022-11-02 05:13:27.853' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (330, N'', CAST(N'2022-09-19' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 22, CAST(N'2022-09-19 21:26:47.313' AS DateTime), CAST(N'2022-09-29 18:02:01.987' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (346, N'', CAST(N'2022-09-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-22' AS Date), NULL, 36, CAST(N'2022-09-22 17:03:21.440' AS DateTime), CAST(N'2022-10-28 18:09:59.730' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (357, N'Oldest order - Date may not be correct', CAST(N'2022-08-25' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-25' AS Date), NULL, 65, CAST(N'2022-09-24 18:49:02.960' AS DateTime), CAST(N'2022-09-24 18:49:02.960' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (358, N'', CAST(N'2022-09-25' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-25' AS Date), NULL, 53, CAST(N'2022-09-25 16:15:45.697' AS DateTime), CAST(N'2022-11-02 05:12:47.180' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (360, N'', CAST(N'2022-09-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-26' AS Date), NULL, 30, CAST(N'2022-09-26 16:05:43.227' AS DateTime), CAST(N'2022-10-29 16:35:26.930' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (361, N'', CAST(N'2022-09-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-26' AS Date), NULL, 34, CAST(N'2022-09-26 16:06:14.977' AS DateTime), CAST(N'2022-10-17 19:28:25.917' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (363, N'', CAST(N'2022-09-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-26' AS Date), NULL, 54, CAST(N'2022-09-26 16:08:50.553' AS DateTime), CAST(N'2022-11-02 19:47:14.087' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (364, N'', CAST(N'2022-09-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 26, CAST(N'2022-09-27 18:26:10.150' AS DateTime), CAST(N'2022-09-27 18:26:10.150' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (365, N'', CAST(N'2022-09-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 22, CAST(N'2022-09-27 18:29:16.183' AS DateTime), CAST(N'2022-11-05 17:27:09.200' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (366, N'', CAST(N'2022-09-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 16, CAST(N'2022-09-27 18:29:54.893' AS DateTime), CAST(N'2022-09-27 18:29:54.893' AS DateTime))
GO
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (367, N'', CAST(N'2022-09-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 27, CAST(N'2022-09-27 18:31:12.417' AS DateTime), CAST(N'2022-10-09 21:07:24.807' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (368, N'', CAST(N'2022-09-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 21, CAST(N'2022-09-27 18:31:32.337' AS DateTime), CAST(N'2022-10-28 18:07:11.197' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (369, N'', CAST(N'2022-09-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 51, CAST(N'2022-09-27 18:31:56.307' AS DateTime), CAST(N'2022-10-08 21:31:24.983' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (370, N'', CAST(N'2022-09-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 59, CAST(N'2022-09-27 18:32:25.837' AS DateTime), CAST(N'2022-10-08 21:30:09.623' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (406, N'', CAST(N'2022-10-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-12' AS Date), NULL, 4, CAST(N'2022-10-12 21:51:26.973' AS DateTime), CAST(N'2022-10-22 16:56:49.737' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (372, N'', CAST(N'2022-09-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-27' AS Date), NULL, 67, CAST(N'2022-09-27 18:40:14.833' AS DateTime), CAST(N'2022-09-27 18:40:14.833' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (374, N'', CAST(N'2022-09-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-29' AS Date), NULL, 9, CAST(N'2022-09-29 17:55:37.097' AS DateTime), CAST(N'2022-10-08 21:49:48.117' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (375, N'', CAST(N'2022-09-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-29' AS Date), NULL, 41, CAST(N'2022-09-29 17:57:08.190' AS DateTime), CAST(N'2022-10-30 22:42:35.857' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (376, N'', CAST(N'2022-09-29' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-29' AS Date), NULL, 27, CAST(N'2022-09-29 17:59:41.470' AS DateTime), CAST(N'2022-10-12 21:50:36.887' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (404, N'', CAST(N'2022-10-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-09' AS Date), NULL, 35, CAST(N'2022-10-09 21:05:10.743' AS DateTime), CAST(N'2022-10-17 19:31:44.827' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (415, N'', CAST(N'2022-10-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-22' AS Date), NULL, 37, CAST(N'2022-10-22 16:53:37.573' AS DateTime), CAST(N'2022-11-02 19:49:27.993' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (416, N'', CAST(N'2022-10-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-22' AS Date), NULL, 28, CAST(N'2022-10-22 16:54:20.397' AS DateTime), CAST(N'2022-11-05 17:19:53.337' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (417, N'', CAST(N'2022-10-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-22' AS Date), NULL, 35, CAST(N'2022-10-22 16:55:51.157' AS DateTime), CAST(N'2022-10-27 17:01:05.363' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (418, N'', CAST(N'2022-10-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-22' AS Date), NULL, 4, CAST(N'2022-10-22 16:57:27.410' AS DateTime), CAST(N'2022-11-05 17:24:17.480' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (419, N'', CAST(N'2022-10-26' AS Date), 5, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-26' AS Date), NULL, 64, CAST(N'2022-10-26 23:17:30.540' AS DateTime), CAST(N'2022-11-24 14:50:27.243' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (420, N'', CAST(N'2022-10-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-26' AS Date), NULL, 49, CAST(N'2022-10-26 23:18:47.820' AS DateTime), CAST(N'2022-11-14 00:40:08.947' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (421, N'', CAST(N'2022-10-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-26' AS Date), NULL, 35, CAST(N'2022-10-26 23:19:20.523' AS DateTime), CAST(N'2022-10-29 16:31:19.033' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (424, N'', CAST(N'2022-10-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-27' AS Date), NULL, 34, CAST(N'2022-10-27 17:03:17.020' AS DateTime), CAST(N'2022-11-12 23:26:04.587' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (440, N'', CAST(N'2022-11-02' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-02' AS Date), NULL, 27, CAST(N'2022-11-02 19:52:00.713' AS DateTime), CAST(N'2022-11-11 04:39:13.433' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (441, N'', CAST(N'2022-11-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-02' AS Date), NULL, 46, CAST(N'2022-11-02 19:53:06.743' AS DateTime), CAST(N'2022-12-07 05:28:07.680' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (442, N'', CAST(N'2022-11-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-02' AS Date), NULL, 35, CAST(N'2022-11-02 19:54:40.590' AS DateTime), CAST(N'2022-11-14 00:31:32.510' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (443, N'', CAST(N'2022-10-31' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-31' AS Date), NULL, 15, CAST(N'2022-11-02 19:55:25.760' AS DateTime), CAST(N'2022-12-06 03:31:49.447' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (444, N'', CAST(N'2022-11-02' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-02' AS Date), NULL, 15, CAST(N'2022-11-02 19:55:38.683' AS DateTime), CAST(N'2022-12-06 03:32:06.993' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (445, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 34, CAST(N'2022-11-05 17:18:57.133' AS DateTime), CAST(N'2022-11-29 22:25:46.147' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (463, N'', CAST(N'2022-11-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-12' AS Date), NULL, 5, CAST(N'2022-11-14 00:35:22.023' AS DateTime), CAST(N'2022-11-29 22:27:01.740' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (481, N'', CAST(N'2022-11-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-19' AS Date), NULL, 1, CAST(N'2022-11-24 14:51:23.097' AS DateTime), CAST(N'2022-11-24 14:51:23.097' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (271, N'', CAST(N'2022-09-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 4, CAST(N'2022-09-10 03:32:07.330' AS DateTime), CAST(N'2022-09-16 17:57:02.837' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (278, N'', CAST(N'2022-09-02' AS Date), 4, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-02' AS Date), NULL, 27, CAST(N'2022-09-10 18:10:03.697' AS DateTime), CAST(N'2022-09-11 18:53:33.810' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (279, N'', CAST(N'2022-09-04' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-04' AS Date), NULL, 27, CAST(N'2022-09-10 18:10:22.220' AS DateTime), CAST(N'2022-09-19 21:23:08.550' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (300, N'', CAST(N'2022-09-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-07' AS Date), NULL, 64, CAST(N'2022-09-11 18:01:52.087' AS DateTime), CAST(N'2022-09-23 18:15:15.560' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (304, N'', CAST(N'2022-08-31' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-08-31' AS Date), NULL, 65, CAST(N'2022-09-11 19:04:59.813' AS DateTime), CAST(N'2022-09-24 16:32:29.683' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (282, N'', CAST(N'2022-09-07' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-07' AS Date), NULL, 27, CAST(N'2022-09-10 18:11:30.097' AS DateTime), CAST(N'2022-09-22 16:43:57.043' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (283, N'', CAST(N'2022-09-09' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-09' AS Date), NULL, 27, CAST(N'2022-09-10 18:11:39.373' AS DateTime), CAST(N'2022-09-25 16:14:30.780' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (320, N'', CAST(N'2022-09-17' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-17' AS Date), NULL, 22, CAST(N'2022-09-17 19:01:23.513' AS DateTime), CAST(N'2022-09-29 18:01:47.847' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (407, N'', CAST(N'2022-10-15' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-15' AS Date), NULL, 35, CAST(N'2022-10-15 19:35:48.200' AS DateTime), CAST(N'2022-10-22 16:56:05.533' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (422, N'', CAST(N'2022-10-27' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-27' AS Date), NULL, 35, CAST(N'2022-10-27 17:00:52.987' AS DateTime), CAST(N'2022-10-30 22:44:28.407' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (423, N'', CAST(N'2022-10-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-27' AS Date), NULL, 27, CAST(N'2022-10-27 17:02:13.990' AS DateTime), CAST(N'2022-11-06 16:31:13.900' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (446, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 28, CAST(N'2022-11-05 17:20:08.940' AS DateTime), CAST(N'2022-11-24 14:52:44.920' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (447, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 67, CAST(N'2022-11-05 17:20:29.557' AS DateTime), CAST(N'2022-12-07 05:28:52.083' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (448, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 5, CAST(N'2022-11-05 17:21:02.743' AS DateTime), CAST(N'2022-11-15 03:40:31.203' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (449, N'', CAST(N'2022-11-05' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 27, CAST(N'2022-11-05 17:21:35.837' AS DateTime), CAST(N'2022-11-15 23:28:23.533' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (450, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 26, CAST(N'2022-11-05 17:22:18.353' AS DateTime), CAST(N'2022-11-05 17:22:18.353' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (451, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 65, CAST(N'2022-11-05 17:22:48.633' AS DateTime), CAST(N'2022-12-07 17:45:11.243' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (452, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 35, CAST(N'2022-11-05 17:23:30.103' AS DateTime), CAST(N'2022-11-14 00:45:35.070' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (453, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 4, CAST(N'2022-11-05 17:24:47.603' AS DateTime), CAST(N'2022-11-14 00:49:00.380' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (454, N'', CAST(N'2022-11-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-05' AS Date), NULL, 56, CAST(N'2022-11-05 17:25:20.807' AS DateTime), CAST(N'2022-11-15 03:41:15.983' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (455, N'', CAST(N'2022-11-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-09' AS Date), NULL, 5, CAST(N'2022-11-10 01:00:38.380' AS DateTime), CAST(N'2022-11-24 14:53:22.263' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (456, N'', CAST(N'2022-11-09' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-09' AS Date), NULL, 37, CAST(N'2022-11-10 01:00:55.577' AS DateTime), CAST(N'2022-11-10 01:00:55.577' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (457, N'', CAST(N'2022-11-09' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-09' AS Date), NULL, 53, CAST(N'2022-11-10 01:01:14.723' AS DateTime), CAST(N'2022-12-07 05:28:30.350' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (458, N'', CAST(N'2022-11-09' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-09' AS Date), NULL, 60, CAST(N'2022-11-10 01:01:34.050' AS DateTime), CAST(N'2022-11-24 14:51:11.933' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (461, N'', CAST(N'2022-11-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-11' AS Date), NULL, 28, CAST(N'2022-11-12 23:29:09.693' AS DateTime), CAST(N'2022-11-29 22:23:00.680' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (462, N'', CAST(N'2022-11-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-11' AS Date), NULL, 35, CAST(N'2022-11-14 00:30:57.650' AS DateTime), CAST(N'2022-11-24 14:54:04.233' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (465, N'', CAST(N'2022-11-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-12' AS Date), NULL, 49, CAST(N'2022-11-14 00:38:45.100' AS DateTime), CAST(N'2022-11-14 00:38:45.100' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (466, N'', CAST(N'2022-11-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-12' AS Date), NULL, 35, CAST(N'2022-11-14 00:45:55.477' AS DateTime), CAST(N'2022-12-07 05:27:45.600' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (467, N'', CAST(N'2022-11-12' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-12' AS Date), NULL, 4, CAST(N'2022-11-14 00:46:27.330' AS DateTime), CAST(N'2022-11-24 14:54:56.653' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (468, N'', CAST(N'2022-11-13' AS Date), 0, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-13' AS Date), NULL, 16, CAST(N'2022-11-14 00:47:22.943' AS DateTime), CAST(N'2022-11-14 00:47:22.943' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (469, N'', CAST(N'2022-11-13' AS Date), 5, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-13' AS Date), NULL, 64, CAST(N'2022-11-14 00:47:49.677' AS DateTime), CAST(N'2022-11-27 17:11:21.870' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (470, N'', CAST(N'2022-11-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-13' AS Date), NULL, 56, CAST(N'2022-11-14 00:48:25.990' AS DateTime), CAST(N'2022-11-29 22:26:38.897' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (477, N'', CAST(N'2022-11-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-22' AS Date), NULL, 56, CAST(N'2022-11-24 14:47:30.403' AS DateTime), CAST(N'2022-12-07 05:27:21.397' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (478, N'', CAST(N'2022-11-19' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-19' AS Date), NULL, 49, CAST(N'2022-11-24 14:48:03.497' AS DateTime), CAST(N'2022-11-24 14:48:03.497' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (479, N'', CAST(N'2022-11-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-22' AS Date), NULL, 41, CAST(N'2022-11-24 14:48:42.890' AS DateTime), CAST(N'2022-11-24 14:48:42.890' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (480, N'', CAST(N'2022-11-19' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-19' AS Date), NULL, 53, CAST(N'2022-11-24 14:49:45.060' AS DateTime), CAST(N'2022-11-24 14:49:45.060' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (482, N'', CAST(N'2022-11-23' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-11-23' AS Date), NULL, 51, CAST(N'2022-11-24 14:52:09.087' AS DateTime), CAST(N'2022-11-24 14:52:09.087' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (483, N'', CAST(N'2022-11-23' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-23' AS Date), NULL, 35, CAST(N'2022-11-24 14:54:18.030' AS DateTime), CAST(N'2022-11-24 14:54:18.030' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (486, N'', CAST(N'2022-11-27' AS Date), 2, 0, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-11-27' AS Date), NULL, 35, CAST(N'2022-11-29 22:21:25.413' AS DateTime), CAST(N'2022-11-29 22:21:25.413' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (487, N'', CAST(N'2022-11-27' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-27' AS Date), NULL, 16, CAST(N'2022-11-29 22:21:42.680' AS DateTime), CAST(N'2022-11-29 22:21:42.680' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (488, N'', CAST(N'2022-11-27' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-27' AS Date), NULL, 59, CAST(N'2022-11-29 22:22:10.633' AS DateTime), CAST(N'2022-11-29 22:22:10.633' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (489, N'', CAST(N'2022-11-29' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-29' AS Date), NULL, 28, CAST(N'2022-11-29 22:22:50.850' AS DateTime), CAST(N'2022-11-29 22:22:50.850' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (490, N'', CAST(N'2022-11-29' AS Date), 2, 0, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-11-29' AS Date), NULL, 51, CAST(N'2022-11-29 22:23:54.990' AS DateTime), CAST(N'2022-11-29 22:23:54.990' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (491, N'', CAST(N'2022-11-29' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-29' AS Date), NULL, 34, CAST(N'2022-11-29 22:25:56.087' AS DateTime), CAST(N'2022-11-29 22:25:56.087' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (492, N'', CAST(N'2022-11-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-29' AS Date), NULL, 27, CAST(N'2022-11-29 22:26:16.430' AS DateTime), CAST(N'2022-11-29 22:26:16.430' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (301, N'', CAST(N'2022-09-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-11' AS Date), NULL, 58, CAST(N'2022-09-11 18:27:18.150' AS DateTime), CAST(N'2022-10-01 18:12:26.460' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (377, N'', CAST(N'2022-09-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-30' AS Date), NULL, 1, CAST(N'2022-10-01 03:11:57.410' AS DateTime), CAST(N'2022-11-02 19:51:01.023' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (306, N'', CAST(N'2022-09-11' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-11' AS Date), NULL, 22, CAST(N'2022-09-11 19:05:59.720' AS DateTime), CAST(N'2022-09-15 02:30:40.190' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (307, N'', CAST(N'2022-09-05' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-05' AS Date), NULL, 66, CAST(N'2022-09-11 19:07:38.647' AS DateTime), CAST(N'2022-09-11 19:07:38.647' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (309, N'', CAST(N'2022-09-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-13' AS Date), NULL, 34, CAST(N'2022-09-13 13:22:09.930' AS DateTime), CAST(N'2022-09-19 04:10:00.627' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (310, N'', CAST(N'2022-09-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-13' AS Date), NULL, 28, CAST(N'2022-09-13 13:23:12.587' AS DateTime), CAST(N'2022-09-24 16:34:18.667' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (311, N'', CAST(N'2022-09-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-13' AS Date), NULL, 21, CAST(N'2022-09-13 13:24:36.223' AS DateTime), CAST(N'2022-10-01 18:04:03.463' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (312, N'', CAST(N'2022-09-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-13' AS Date), NULL, 5, CAST(N'2022-09-13 13:25:18.183' AS DateTime), CAST(N'2022-09-22 16:46:06.790' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (313, N'', CAST(N'2022-09-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-13' AS Date), NULL, 56, CAST(N'2022-09-13 13:28:02.670' AS DateTime), CAST(N'2022-10-01 18:00:43.780' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (350, N'', CAST(N'2022-09-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 65, CAST(N'2022-09-24 16:32:01.730' AS DateTime), CAST(N'2022-10-30 22:43:36.993' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (351, N'', CAST(N'2022-09-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 22, CAST(N'2022-09-24 16:33:08.697' AS DateTime), CAST(N'2022-09-29 18:02:31.610' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (352, N'', CAST(N'2022-09-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 40, CAST(N'2022-09-24 16:33:34.557' AS DateTime), CAST(N'2022-10-08 21:27:58.030' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (353, N'', CAST(N'2022-09-24' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 42, CAST(N'2022-09-24 16:35:23.057' AS DateTime), CAST(N'2022-12-06 03:36:03.833' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (354, N'', CAST(N'2022-09-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 60, CAST(N'2022-09-24 16:36:11.900' AS DateTime), CAST(N'2022-10-09 21:06:44.150' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (355, N'', CAST(N'2022-09-24' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 9, CAST(N'2022-09-24 16:37:34.430' AS DateTime), CAST(N'2022-09-29 17:55:50.727' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (356, N'', CAST(N'2022-09-24' AS Date), 5, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 64, CAST(N'2022-09-24 16:37:58.087' AS DateTime), CAST(N'2022-10-08 21:39:25.700' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (378, N'', CAST(N'2022-09-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-30' AS Date), NULL, 39, CAST(N'2022-10-01 03:13:30.533' AS DateTime), CAST(N'2022-11-05 17:29:25.513' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (379, N'', CAST(N'2022-09-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-30' AS Date), NULL, 46, CAST(N'2022-10-01 03:14:01.940' AS DateTime), CAST(N'2022-11-02 19:52:45.540' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (385, N'', CAST(N'2022-10-08' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-08' AS Date), NULL, 15, CAST(N'2022-10-08 21:26:24.657' AS DateTime), CAST(N'2022-11-02 05:03:51.970' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (386, N'', CAST(N'2022-10-08' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-08' AS Date), NULL, 40, CAST(N'2022-10-08 21:27:31.593' AS DateTime), CAST(N'2022-12-07 05:30:25.833' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (387, N'', CAST(N'2022-10-04' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 51, CAST(N'2022-10-08 21:30:58.623' AS DateTime), CAST(N'2022-10-28 18:12:00.120' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (388, N'', CAST(N'2022-10-02' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-02' AS Date), NULL, 27, CAST(N'2022-10-08 21:33:49.137' AS DateTime), CAST(N'2022-10-15 19:38:36.703' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (389, N'', CAST(N'2022-10-06' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-06' AS Date), NULL, 27, CAST(N'2022-10-08 21:34:00.607' AS DateTime), CAST(N'2022-10-22 16:54:56.703' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (390, N'', CAST(N'2022-10-04' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 48, CAST(N'2022-10-08 21:35:01.997' AS DateTime), CAST(N'2022-10-28 18:09:36.493' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (391, N'', CAST(N'2022-10-08' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-08' AS Date), NULL, 55, CAST(N'2022-10-08 21:37:35.933' AS DateTime), CAST(N'2022-11-12 23:27:04.190' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (392, N'', CAST(N'2022-10-04' AS Date), 5, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 64, CAST(N'2022-10-08 21:39:07.697' AS DateTime), CAST(N'2022-10-26 23:17:41.253' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (393, N'', CAST(N'2022-10-07' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-07' AS Date), NULL, 34, CAST(N'2022-10-08 21:40:14.417' AS DateTime), CAST(N'2022-11-06 16:32:08.270' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (394, N'', CAST(N'2022-10-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-07' AS Date), NULL, 23, CAST(N'2022-10-08 21:41:01.050' AS DateTime), CAST(N'2022-10-29 16:42:05.933' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (395, N'', CAST(N'2022-10-04' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 18, CAST(N'2022-10-08 21:41:36.377' AS DateTime), CAST(N'2022-10-08 21:41:36.377' AS DateTime))
GO
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (396, N'', CAST(N'2022-10-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-07' AS Date), NULL, 21, CAST(N'2022-10-08 21:42:16.930' AS DateTime), CAST(N'2022-11-14 00:29:23.767' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (397, N'', CAST(N'2022-10-04' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 49, CAST(N'2022-10-08 21:44:52.680' AS DateTime), CAST(N'2022-10-28 18:21:20.550' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (398, N'', CAST(N'2022-10-06' AS Date), 3, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-06' AS Date), NULL, 16, CAST(N'2022-10-08 21:46:23.007' AS DateTime), CAST(N'2022-11-02 05:05:05.833' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (399, N'', CAST(N'2022-10-07' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-07' AS Date), NULL, 26, CAST(N'2022-10-08 21:46:46.167' AS DateTime), CAST(N'2022-10-08 21:46:46.167' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (400, N'', CAST(N'2022-10-04' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-04' AS Date), NULL, 28, CAST(N'2022-10-08 21:48:03.053' AS DateTime), CAST(N'2022-10-29 16:34:49.053' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (401, N'', CAST(N'2022-10-03' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-03' AS Date), NULL, 36, CAST(N'2022-10-08 21:49:09.867' AS DateTime), CAST(N'2022-10-28 18:10:30.763' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (402, N'', CAST(N'2022-10-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-02' AS Date), NULL, 9, CAST(N'2022-10-08 21:50:00.757' AS DateTime), CAST(N'2022-10-22 16:50:50.700' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (403, N'', CAST(N'2022-10-02' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-02' AS Date), NULL, 60, CAST(N'2022-10-08 21:50:33.113' AS DateTime), CAST(N'2022-10-30 22:41:36.607' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (425, N'', CAST(N'2022-10-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-28' AS Date), NULL, 21, CAST(N'2022-10-28 18:06:51.543' AS DateTime), CAST(N'2022-11-29 22:28:46.900' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (426, N'', CAST(N'2022-10-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-28' AS Date), NULL, 5, CAST(N'2022-10-28 18:08:28.060' AS DateTime), CAST(N'2022-11-14 00:36:11.913' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (427, N'', CAST(N'2022-10-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-28' AS Date), NULL, 56, CAST(N'2022-10-28 18:11:23.887' AS DateTime), CAST(N'2022-11-02 05:14:31.433' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (428, N'', CAST(N'2022-10-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-28' AS Date), NULL, 51, CAST(N'2022-10-28 18:11:43.903' AS DateTime), CAST(N'2022-11-02 05:11:50.807' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (473, N'', CAST(N'2022-11-15' AS Date), 1, 1, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-15' AS Date), NULL, 26, CAST(N'2022-11-15 23:27:31.770' AS DateTime), CAST(N'2022-11-15 23:27:31.770' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (474, N'', CAST(N'2022-11-15' AS Date), 3, 0, 0, N'UnPaid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-11-15' AS Date), NULL, 27, CAST(N'2022-11-15 23:28:38.397' AS DateTime), CAST(N'2022-11-15 23:28:38.397' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (323, N'', CAST(N'2022-09-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-18' AS Date), NULL, 41, CAST(N'2022-09-19 04:08:58.500' AS DateTime), CAST(N'2022-09-29 17:57:21.770' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (324, N'', CAST(N'2022-09-18' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-18' AS Date), NULL, 34, CAST(N'2022-09-19 04:10:14.640' AS DateTime), CAST(N'2022-10-17 19:28:13.073' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (347, N'', CAST(N'2022-09-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-23' AS Date), NULL, 10, CAST(N'2022-09-23 18:16:36.840' AS DateTime), CAST(N'2022-10-29 16:42:58.980' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (373, N'', CAST(N'2022-09-28' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-28' AS Date), NULL, 36, CAST(N'2022-09-28 18:13:42.567' AS DateTime), CAST(N'2022-10-28 18:10:16.010' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (412, N'', CAST(N'2022-10-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-17' AS Date), NULL, 37, CAST(N'2022-10-17 19:29:24.450' AS DateTime), CAST(N'2022-11-02 19:49:13.117' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (413, N'', CAST(N'2022-10-17' AS Date), 4, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-17' AS Date), NULL, 27, CAST(N'2022-10-17 19:30:32.390' AS DateTime), CAST(N'2022-11-02 19:51:49.070' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (414, N'', CAST(N'2022-10-17' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-17' AS Date), NULL, 35, CAST(N'2022-10-17 19:32:21.937' AS DateTime), CAST(N'2022-10-26 23:20:10.273' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (431, N'', CAST(N'2022-10-30' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-10-30' AS Date), NULL, 10, CAST(N'2022-10-30 22:41:20.187' AS DateTime), CAST(N'2022-10-30 22:41:20.187' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (432, N'', CAST(N'2022-10-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-30' AS Date), NULL, 23, CAST(N'2022-10-30 22:42:06.030' AS DateTime), CAST(N'2022-11-15 23:29:13.623' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (433, N'', CAST(N'2022-10-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-30' AS Date), NULL, 30, CAST(N'2022-10-30 22:43:10.860' AS DateTime), CAST(N'2022-11-15 03:39:47.017' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (434, N'', CAST(N'2022-10-30' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-30' AS Date), NULL, 35, CAST(N'2022-10-30 22:44:52.830' AS DateTime), CAST(N'2022-11-06 16:30:17.677' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (435, N'', CAST(N'2022-10-31' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-31' AS Date), NULL, 4, CAST(N'2022-11-02 05:04:24.893' AS DateTime), CAST(N'2022-11-02 05:04:24.893' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (436, N'', CAST(N'2022-10-31' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-31' AS Date), NULL, 16, CAST(N'2022-11-02 05:04:47.037' AS DateTime), CAST(N'2022-11-14 00:44:22.807' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (438, N'', CAST(N'2022-10-31' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-31' AS Date), NULL, 51, CAST(N'2022-11-02 05:12:10.120' AS DateTime), CAST(N'2022-11-29 22:24:22.507' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (439, N'', CAST(N'2022-11-01' AS Date), 2, 0, 0, N'Partial', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-01' AS Date), NULL, 37, CAST(N'2022-11-02 05:16:51.293' AS DateTime), CAST(N'2022-12-06 03:35:22.727' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (325, N'', CAST(N'2022-09-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 9, CAST(N'2022-09-19 17:58:38.547' AS DateTime), CAST(N'2022-09-23 20:26:07.727' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (326, N'', CAST(N'2022-09-19' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-19' AS Date), NULL, 39, CAST(N'2022-09-19 18:06:13.487' AS DateTime), CAST(N'2022-10-28 18:12:25.137' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (335, N'', CAST(N'2022-09-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 9, CAST(N'2022-09-21 16:30:37.800' AS DateTime), CAST(N'2022-09-24 16:37:10.243' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (336, N'', CAST(N'2022-09-21' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 51, CAST(N'2022-09-21 16:53:05.063' AS DateTime), CAST(N'2022-10-01 18:04:54.950' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (337, N'', CAST(N'2022-09-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 31, CAST(N'2022-09-21 16:56:58.730' AS DateTime), CAST(N'2022-11-02 19:49:58.230' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (338, N'', CAST(N'2022-09-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 48, CAST(N'2022-09-21 16:57:26.543' AS DateTime), CAST(N'2022-10-08 21:34:40.467' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (340, N'', CAST(N'2022-09-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 35, CAST(N'2022-09-21 17:01:50.183' AS DateTime), CAST(N'2022-10-09 21:05:28.103' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (341, N'', CAST(N'2022-09-21' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-21' AS Date), NULL, 56, CAST(N'2022-09-21 17:02:52.020' AS DateTime), CAST(N'2022-10-01 18:01:17.747' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (471, N'', CAST(N'2022-11-13' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-13' AS Date), NULL, 23, CAST(N'2022-11-14 04:23:45.903' AS DateTime), CAST(N'2022-12-07 17:47:49.323' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (384, N'', CAST(N'2022-10-01' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-01' AS Date), NULL, 67, CAST(N'2022-10-01 18:03:11.563' AS DateTime), CAST(N'2022-10-01 18:03:11.563' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (472, N'', CAST(N'2022-11-14' AS Date), 2, 1, 0, N'UnPaid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-11-14' AS Date), NULL, 42, CAST(N'2022-11-15 03:38:57.970' AS DateTime), CAST(N'2022-11-15 03:38:57.970' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (496, N'', CAST(N'2022-12-07' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-12-07' AS Date), NULL, 18, CAST(N'2022-12-07 17:46:35.730' AS DateTime), CAST(N'2022-12-07 17:46:35.730' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (497, N'', CAST(N'2022-12-07' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-12-07' AS Date), NULL, 23, CAST(N'2022-12-07 17:47:31.430' AS DateTime), CAST(N'2022-12-07 17:47:31.430' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (498, N'', CAST(N'2022-12-07' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-12-07' AS Date), NULL, 49, CAST(N'2022-12-07 17:48:28.803' AS DateTime), CAST(N'2022-12-07 17:48:28.803' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (332, N'', CAST(N'2022-09-20' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-20' AS Date), NULL, 58, CAST(N'2022-09-20 16:48:51.597' AS DateTime), CAST(N'2022-10-01 18:13:01.883' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (333, N'', CAST(N'2022-09-20' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-20' AS Date), NULL, 27, CAST(N'2022-09-20 16:49:06.097' AS DateTime), CAST(N'2022-10-08 21:32:58.840' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (334, N'', CAST(N'2022-09-20' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-20' AS Date), NULL, 4, CAST(N'2022-09-20 16:49:26.490' AS DateTime), CAST(N'2022-09-22 16:40:50.793' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (342, N'', CAST(N'2022-09-22' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-22' AS Date), NULL, 4, CAST(N'2022-09-22 16:40:26.890' AS DateTime), CAST(N'2022-10-16 18:56:31.153' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (343, N'', CAST(N'2022-09-22' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-22' AS Date), NULL, 45, CAST(N'2022-09-22 16:41:53.953' AS DateTime), CAST(N'2022-11-02 19:53:46.197' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (344, N'', CAST(N'2022-09-22' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-22' AS Date), NULL, 27, CAST(N'2022-09-22 16:44:24.310' AS DateTime), CAST(N'2022-10-08 21:33:10.823' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (345, N'', CAST(N'2022-09-22' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-22' AS Date), NULL, 5, CAST(N'2022-09-22 16:44:57.277' AS DateTime), CAST(N'2022-11-02 05:15:56.073' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (348, N'', CAST(N'2022-09-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-23' AS Date), NULL, 28, CAST(N'2022-09-23 20:27:54.760' AS DateTime), CAST(N'2022-10-17 19:29:56.387' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (349, N'', CAST(N'2022-09-23' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-23' AS Date), NULL, 22, CAST(N'2022-09-23 20:28:30.460' AS DateTime), CAST(N'2022-09-29 18:02:15.143' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (359, N'', CAST(N'2022-09-24' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-09-24' AS Date), NULL, 55, CAST(N'2022-09-25 19:24:43.830' AS DateTime), CAST(N'2022-10-08 21:38:10.917' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (380, N'', CAST(N'2022-10-01' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-01' AS Date), NULL, 56, CAST(N'2022-10-01 18:00:12.687' AS DateTime), CAST(N'2022-10-28 18:11:05.887' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (381, N'', CAST(N'2022-10-01' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-01' AS Date), NULL, 35, CAST(N'2022-10-01 18:01:56.867' AS DateTime), CAST(N'2022-10-15 19:35:29.560' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (382, N'', CAST(N'2022-10-01' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-01' AS Date), NULL, 49, CAST(N'2022-10-01 18:02:49.730' AS DateTime), CAST(N'2022-10-28 18:09:09.417' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (408, N'', CAST(N'2022-10-15' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-15' AS Date), NULL, 27, CAST(N'2022-10-15 19:38:11.907' AS DateTime), CAST(N'2022-10-17 19:31:09.490' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (409, N'', CAST(N'2022-10-15' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-15' AS Date), NULL, 9, CAST(N'2022-10-15 19:40:27.987' AS DateTime), CAST(N'2022-10-16 18:56:04.713' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (410, N'', CAST(N'2022-10-15' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-15' AS Date), NULL, 28, CAST(N'2022-10-16 18:55:30.010' AS DateTime), CAST(N'2022-11-05 17:19:44.353' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (411, N'', CAST(N'2022-10-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-16' AS Date), NULL, 4, CAST(N'2022-10-16 18:57:01.810' AS DateTime), CAST(N'2022-10-22 16:57:12.080' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (429, N'', CAST(N'2022-10-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-29' AS Date), NULL, 35, CAST(N'2022-10-29 16:30:58.710' AS DateTime), CAST(N'2022-11-02 05:15:17.480' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (430, N'', CAST(N'2022-10-29' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-10-29' AS Date), NULL, 37, CAST(N'2022-10-29 16:36:46.917' AS DateTime), CAST(N'2022-11-14 00:33:57.743' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (459, N'', CAST(N'2022-11-10' AS Date), 2, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-10' AS Date), NULL, 27, CAST(N'2022-11-11 04:38:57.857' AS DateTime), CAST(N'2022-11-14 00:49:44.270' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (493, N'', CAST(N'2022-11-30' AS Date), 2, 0, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-11-30' AS Date), NULL, 27, CAST(N'2022-12-06 03:31:10.883' AS DateTime), CAST(N'2022-12-06 03:31:10.883' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (494, N'', CAST(N'2022-12-05' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-12-05' AS Date), NULL, 5, CAST(N'2022-12-06 03:32:49.073' AS DateTime), CAST(N'2022-12-06 03:32:49.073' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (495, N'', CAST(N'2022-12-05' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-12-05' AS Date), NULL, 56, CAST(N'2022-12-06 03:33:43.063' AS DateTime), CAST(N'2022-12-06 03:33:43.063' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (475, N'', CAST(N'2022-11-16' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-16' AS Date), NULL, 28, CAST(N'2022-11-17 00:59:33.523' AS DateTime), CAST(N'2022-12-06 03:34:09.760' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (476, N'', CAST(N'2022-11-16' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-11-16' AS Date), NULL, 5, CAST(N'2022-11-17 01:00:17.277' AS DateTime), CAST(N'2022-11-17 01:00:17.277' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (484, N'', CAST(N'2022-11-26' AS Date), 5, 0, 0, N'UnPaid', CAST(1000 AS Decimal(18, 0)), CAST(N'2022-11-26' AS Date), NULL, 64, CAST(N'2022-11-26 16:30:00.273' AS DateTime), CAST(N'2022-11-26 16:30:00.273' AS DateTime))
INSERT [dbo].[D_Orders] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (485, N'', CAST(N'2022-11-26' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-11-26' AS Date), NULL, 4, CAST(N'2022-11-26 16:31:22.630' AS DateTime), CAST(N'2022-11-26 16:31:22.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[D_Orders] OFF
INSERT [dbo].[D_Orders_Archive] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId], [CreatedTimeStamp], [UpdatedTimeStamp]) VALUES (96, NULL, CAST(N'2022-07-07' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), NULL, 62, NULL, NULL)
SET IDENTITY_INSERT [dbo].[D_OrdersBackup0728] ON 

INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (3, N'1 Jeera', CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(0 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 38)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (4, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-08' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (5, N'', CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (6, NULL, CAST(N'2022-07-11' AS Date), 2, 0, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (7, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (8, NULL, CAST(N'2022-07-14' AS Date), 2, 0, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), CAST(N'2022-07-14' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (9, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (10, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (11, NULL, CAST(N'2022-07-22' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-22' AS Date), CAST(N'2022-07-22' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (12, NULL, CAST(N'2022-07-25' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-25' AS Date), CAST(N'2022-07-25' AS Date), 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (13, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-13' AS Date), 56)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (14, NULL, CAST(N'2022-07-13' AS Date), 2, 1, 0, N'UnPaid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 56)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (15, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), 46)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (16, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-13' AS Date), 46)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (17, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 46)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (18, NULL, CAST(N'2022-07-05' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-07' AS Date), 15)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (19, NULL, CAST(N'2022-07-07' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-16' AS Date), 15)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (20, NULL, CAST(N'2022-07-16' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 15)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (21, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-13' AS Date), 45)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (22, NULL, CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Partial', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-28' AS Date), 45)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (23, NULL, CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-28' AS Date), 49)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (24, NULL, CAST(N'2022-07-14' AS Date), 2, 0, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 49)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (25, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (26, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (27, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (28, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (29, NULL, CAST(N'2022-07-21' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-21' AS Date), CAST(N'2022-07-21' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (30, NULL, CAST(N'2022-07-23' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-23' AS Date), CAST(N'2022-07-23' AS Date), 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (31, NULL, CAST(N'2022-07-09' AS Date), 0.25, 0.25, 0, N'Paid', CAST(100 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-11' AS Date), 47)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (32, NULL, CAST(N'2022-07-11' AS Date), 0, 1, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-18' AS Date), 47)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (33, NULL, CAST(N'2022-07-18' AS Date), 0, 1, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 47)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (34, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-18' AS Date), 11)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (35, NULL, CAST(N'2022-07-11' AS Date), 2, 1, 0, N'UnPaid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), NULL, 11)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (36, NULL, CAST(N'2022-07-18' AS Date), 0, 2, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 11)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (69, NULL, CAST(N'2022-07-26' AS Date), 0, 3, 0, N'UnPaid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 26)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (70, NULL, CAST(N'2022-07-27' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), NULL, 36)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (71, NULL, CAST(N'2022-07-26' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), CAST(N'2022-07-26' AS Date), 4)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (72, NULL, CAST(N'2022-07-26' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 15)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (73, NULL, CAST(N'2022-07-26' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 22)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (88, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 21)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (89, NULL, CAST(N'2022-07-06' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 57)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (90, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-18' AS Date), 57)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (91, NULL, CAST(N'2022-07-24' AS Date), 2, 0, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-24' AS Date), 57)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (92, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-15' AS Date), 28)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (93, NULL, CAST(N'2022-07-15' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), CAST(N'2022-07-19' AS Date), 28)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (94, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-27' AS Date), 28)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (95, NULL, CAST(N'2022-07-27' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), NULL, 28)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (96, NULL, CAST(N'2022-07-07' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), NULL, 62)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (97, NULL, CAST(N'2022-07-09' AS Date), 0, 1, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), NULL, 12)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (98, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), NULL, 1)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (99, NULL, CAST(N'2022-07-15' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), NULL, 1)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (100, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 50)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (101, NULL, CAST(N'2022-07-11' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 29)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (102, NULL, CAST(N'2022-07-11' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-28' AS Date), 30)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (103, NULL, CAST(N'2022-07-11' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 2)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (104, NULL, CAST(N'2022-07-12' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), NULL, 7)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (105, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 18)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (106, NULL, CAST(N'2022-07-06' AS Date), 0.5, 0.5, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 31)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (107, NULL, CAST(N'2022-07-11' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 31)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (108, NULL, CAST(N'2022-07-15' AS Date), 0, 1, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-15' AS Date), CAST(N'2022-07-15' AS Date), 31)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (109, NULL, CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Partial', CAST(100 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 13)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (110, NULL, CAST(N'2022-07-07' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-18' AS Date), 51)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (111, NULL, CAST(N'2022-07-18' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), CAST(N'2022-07-24' AS Date), 51)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (112, NULL, CAST(N'2022-07-24' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), NULL, 51)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (113, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-18' AS Date), 58)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (114, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 58)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (115, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-18' AS Date), 37)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (116, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 37)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (117, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-19' AS Date), 41)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (118, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 41)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (119, NULL, CAST(N'2022-07-24' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-24' AS Date), 41)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (120, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-26' AS Date), 23)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (121, NULL, CAST(N'2022-07-26' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 23)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (122, NULL, CAST(N'2022-07-08' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-08' AS Date), CAST(N'2022-07-08' AS Date), 14)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (123, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 59)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (124, NULL, CAST(N'2022-07-26' AS Date), 0, 1, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), CAST(N'2022-07-26' AS Date), 59)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (125, NULL, CAST(N'2022-07-12' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), NULL, 52)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (126, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 20)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (127, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-19' AS Date), 53)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (128, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), NULL, 53)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (129, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Unpaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 44)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (130, NULL, CAST(N'2022-07-16' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-28' AS Date), 39)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (131, NULL, CAST(N'2022-07-16' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 8)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (132, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 32)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (133, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-26' AS Date), 42)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (134, NULL, CAST(N'2022-07-26' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 42)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (135, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-21' AS Date), 54)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (136, NULL, CAST(N'2022-07-21' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-21' AS Date), NULL, 54)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (37, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), 40)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (38, NULL, CAST(N'2022-07-12' AS Date), 1, 2, 0, N'Paid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-17' AS Date), 40)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (39, N'', CAST(N'2022-07-17' AS Date), 1, 2, 3, N'Partial', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-17' AS Date), CAST(N'2022-07-19' AS Date), 40)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (40, NULL, CAST(N'2022-07-12' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-12' AS Date), 27)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (41, NULL, CAST(N'2022-07-14' AS Date), 1, 2, 0, N'Paid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), CAST(N'2022-07-16' AS Date), 27)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (42, NULL, CAST(N'2022-07-16' AS Date), 0, 2, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-16' AS Date), 27)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (43, NULL, CAST(N'2022-07-19' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-28' AS Date), 27)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (44, NULL, CAST(N'2022-07-22' AS Date), 1, 2, 0, N'UnPaid', NULL, CAST(N'2022-07-22' AS Date), NULL, 27)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (74, NULL, CAST(N'2022-07-16' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), CAST(N'2022-07-24' AS Date), 55)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (75, NULL, CAST(N'2022-07-24' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), NULL, 55)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (76, NULL, CAST(N'2022-07-16' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-16' AS Date), NULL, 3)
GO
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (77, NULL, CAST(N'2022-07-18' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 33)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (78, NULL, CAST(N'2022-07-19' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-24' AS Date), 60)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (79, NULL, CAST(N'2022-07-24' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), CAST(N'2022-07-27' AS Date), 60)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (80, NULL, CAST(N'2022-07-19' AS Date), 2, 0, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 9)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (81, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-27' AS Date), 63)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (82, NULL, CAST(N'2022-07-19' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 43)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (83, NULL, CAST(N'2022-07-19' AS Date), 1, 1, 0, N'Partial', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 25)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (84, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 34)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (85, NULL, CAST(N'2022-07-20' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-20' AS Date), 34)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (86, NULL, CAST(N'2022-07-27' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-27' AS Date), CAST(N'2022-07-27' AS Date), 34)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (87, NULL, CAST(N'2022-07-20' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), NULL, 10)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (144, NULL, CAST(N'2022-07-27' AS Date), 1, 1, 0, N'UnPaid', NULL, CAST(N'2022-07-27' AS Date), NULL, 56)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (45, NULL, CAST(N'2022-07-09' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-10' AS Date), 26)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (46, NULL, CAST(N'2022-07-10' AS Date), 2, 2, 0, N'Paid', CAST(800 AS Decimal(18, 0)), CAST(N'2022-07-10' AS Date), CAST(N'2022-07-26' AS Date), 26)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (47, NULL, CAST(N'2022-07-13' AS Date), 2, 0, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 26)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (48, NULL, CAST(N'2022-07-07' AS Date), 1, 1, 0, N'Partial', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-07' AS Date), CAST(N'2022-07-19' AS Date), 61)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (49, NULL, CAST(N'2022-07-13' AS Date), 0, 1, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 61)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (50, NULL, CAST(N'2022-07-05' AS Date), 1, 1, 0, N'Partial', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-18' AS Date), 5)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (51, NULL, CAST(N'2022-07-18' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-18' AS Date), NULL, 5)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (52, NULL, CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-13' AS Date), 35)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (53, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-24' AS Date), 35)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (54, NULL, CAST(N'2022-07-24' AS Date), 1, 0, 0, N'Unpaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-24' AS Date), NULL, 35)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (55, NULL, CAST(N'2022-07-12' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-26' AS Date), 48)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (56, NULL, CAST(N'2022-07-14' AS Date), 1, 1, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 48)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (57, NULL, CAST(N'2022-07-05' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-28' AS Date), 6)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (58, NULL, CAST(N'2022-07-06' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-06' AS Date), CAST(N'2022-07-06' AS Date), 4)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (59, NULL, CAST(N'2022-07-13' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 4)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (60, NULL, CAST(N'2022-07-20' AS Date), 1, 1, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-20' AS Date), 4)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (61, NULL, CAST(N'2022-07-05' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-05' AS Date), CAST(N'2022-07-13' AS Date), 24)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (62, NULL, CAST(N'2022-07-13' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), NULL, 24)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (63, NULL, CAST(N'2022-07-09' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-11' AS Date), 17)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (64, NULL, CAST(N'2022-07-11' AS Date), 2, 0, 0, N'UnPaid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-11' AS Date), NULL, 17)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (65, NULL, CAST(N'2022-07-14' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-14' AS Date), NULL, 17)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (66, NULL, CAST(N'2022-07-09' AS Date), 4, 1, 0, N'Paid', CAST(1000 AS Decimal(18, 0)), CAST(N'2022-07-09' AS Date), CAST(N'2022-07-09' AS Date), 16)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (67, NULL, CAST(N'2022-07-13' AS Date), 0, 2, 0, N'Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-07-13' AS Date), CAST(N'2022-07-13' AS Date), 16)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (68, NULL, CAST(N'2022-07-19' AS Date), 2, 2, 0, N'Paid', CAST(800 AS Decimal(18, 0)), CAST(N'2022-07-19' AS Date), CAST(N'2022-07-19' AS Date), 16)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (139, NULL, CAST(N'2022-07-28' AS Date), 1, 0, 0, N'Paid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), CAST(N'2022-07-28' AS Date), 39)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (140, NULL, CAST(N'2022-07-28' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), NULL, 30)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (141, NULL, CAST(N'2022-07-28' AS Date), 1, 0, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-28' AS Date), NULL, 21)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (142, NULL, CAST(N'2022-07-26' AS Date), 0, 1, 0, N'UnPaid', CAST(200 AS Decimal(18, 0)), CAST(N'2022-07-26' AS Date), NULL, 49)
INSERT [dbo].[D_OrdersBackup0728] ([Id], [Description], [OrderDate], [Jeera_160], [Shikanji_160], [Nimbu_160], [Status], [Balance], [DeliveryDate], [PaymentDate], [CustomerId]) VALUES (143, NULL, CAST(N'2022-07-28' AS Date), 1, 1, 0, N'UnPaid', NULL, CAST(N'2022-07-28' AS Date), NULL, 27)
SET IDENTITY_INSERT [dbo].[D_OrdersBackup0728] OFF
SET IDENTITY_INSERT [dbo].[Expense] ON 

INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (1, N'Green Paper sheets', N'Green Paper sheets pack', CAST(240 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL)
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (2, N'Neem Khad', N'Neem Khad 1 Bori', CAST(450 AS Decimal(18, 0)), CAST(N'2022-02-12' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (3, N'Packing bag - 3 packet', N'Packing bag - 3 packet', CAST(540 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (4, N'Tape 6 pack', N'Tape 6 pack', CAST(240 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (5, N'Joot Bori', N'Joot Bori', CAST(165 AS Decimal(18, 0)), CAST(N'2022-03-25' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (6, N'Marketing Commission - Sajjan', N'Marketing Commission', CAST(600 AS Decimal(18, 0)), CAST(N'2022-03-26' AS Date), N'Marketing-Delivery')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (7, N'Production - Golu', N'Production  - Golu till date', CAST(600 AS Decimal(18, 0)), CAST(N'2022-03-25' AS Date), N'Production')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (8, N'Transport- Payment', N'Transport- Payment til date', CAST(250 AS Decimal(18, 0)), CAST(N'2022-03-25' AS Date), N'Transport')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (9, N'Do trali gobr+ Trli', N'Do trali gobr+ Trli', CAST(2000 AS Decimal(18, 0)), CAST(N'2022-04-12' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (10, N'leber charge-trolly', N'leber charge-trolly', CAST(700 AS Decimal(18, 0)), CAST(N'2022-04-12' AS Date), N'Not a Commission')
INSERT [dbo].[Expense] ([Id], [Name], [Description], [Amount], [Date], [CommissionType]) VALUES (11, N'Two Plastik tasla', N'Two Plastik tasla', CAST(200 AS Decimal(18, 0)), CAST(N'2022-04-17' AS Date), N'Not a Commission')
SET IDENTITY_INSERT [dbo].[Expense] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (34, N'Neem Vermi 10, Vermi 40.', CAST(N'2022-02-28' AS Date), 40, 10, 0, 0, N'In progress', CAST(630 AS Decimal(18, 0)), CAST(N'2022-03-02' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (46, N'Vermi 25, Neem Verm i25.', CAST(N'2022-03-31' AS Date), 25, 25, 0, 0, N'Fully Paid', CAST(700 AS Decimal(18, 0)), CAST(N'2022-03-31' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (41, N'100 neem vermi rate 12', CAST(N'2022-03-21' AS Date), 0, 100, 0, 0, N'Fully Paid', CAST(1200 AS Decimal(18, 0)), CAST(N'2022-03-21' AS Date), 10)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (42, N'Neem Vermi 16', CAST(N'2022-03-22' AS Date), 0, 25, 0, 0, N'Fully Paid', CAST(400 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (5, N'15 neem, 10 vermi', CAST(N'2021-12-03' AS Date), 10, 15, 0, 0, N'Fully Paid', CAST(345 AS Decimal(18, 0)), CAST(N'2021-12-03' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (6, N'20 Neem Vermi', CAST(N'2021-12-09' AS Date), 0, 20, 0, 0, N'Fully Paid', CAST(300 AS Decimal(18, 0)), CAST(N'2021-12-09' AS Date), 2)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (7, N'24 Vermi', CAST(N'2021-12-09' AS Date), 24, 0, 0, 0, N'Fully Paid', CAST(288 AS Decimal(18, 0)), CAST(N'2021-12-09' AS Date), 3)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (12, N'New Packet 3', CAST(N'2021-12-15' AS Date), 0, 0, 3, 0, N'Fully Paid', CAST(66 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), 5)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (13, N'New Packet 8, Neem Vermi 10, Vermi 4.', CAST(N'2021-12-15' AS Date), 4, 10, 8, 0, N'Fully Paid', CAST(412 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), 6)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (19, N'Neem Vermi 19.', CAST(N'2021-12-24' AS Date), 0, 0, 0, 0, N'Fully Paid', CAST(342 AS Decimal(18, 0)), CAST(N'2021-12-24' AS Date), 11)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (21, N'Vermi 20, Neem Vermi 20, New Packet 10.', CAST(N'2021-12-25' AS Date), 20, 20, 10, 0, N'Fully Paid', CAST(1270 AS Decimal(18, 0)), CAST(N'2021-12-25' AS Date), 12)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (22, N'Vermi 20, Neem Vermi 20.', CAST(N'2021-12-26' AS Date), 20, 20, 0, 0, N'Fully Paid', CAST(1000 AS Decimal(18, 0)), CAST(N'2021-12-26' AS Date), 13)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (23, N'Neem Vermi 50.', CAST(N'2021-12-28' AS Date), 0, 50, 0, 0, N'Fully Paid', CAST(750 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (24, N'New Packet 10.', CAST(N'2021-12-28' AS Date), 0, 0, 10, 0, N'Fully Paid', CAST(260 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), 14)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (25, N'Vermi 204, Neem Khali 22.', CAST(N'2021-12-31' AS Date), 204, 0, 0, 22, N'Fully Paid', CAST(4552 AS Decimal(18, 0)), CAST(N'2021-12-31' AS Date), 15)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (26, N'Vermi 30.', CAST(N'2022-01-13' AS Date), 30, 0, 0, 0, N'Fully Paid', CAST(300 AS Decimal(18, 0)), CAST(N'2022-01-13' AS Date), 16)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (27, N'Vermi 5, New Packet 1.', CAST(N'2022-02-03' AS Date), 5, 0, 1, 0, N'Fully Paid', CAST(95 AS Decimal(18, 0)), CAST(N'2022-02-03' AS Date), 17)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (28, N'Vermi 15, Neem Vermi 20.', CAST(N'2022-02-05' AS Date), 15, 20, 0, 0, N'Fully Paid', CAST(495 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), 2)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (29, N'Vermi 15, Neem Vermi 15.', CAST(N'2022-02-05' AS Date), 15, 15, 0, 0, N'Fully Paid', CAST(405 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (30, N'Vermi 50.', CAST(N'2022-02-02' AS Date), 50, 0, 0, 0, N'Fully Paid', CAST(800 AS Decimal(18, 0)), CAST(N'2022-02-02' AS Date), 18)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (31, N'Neem Vermi 25, Vermi 25.', CAST(N'2022-02-14' AS Date), 25, 25, 0, 0, N'Fully Paid', CAST(675 AS Decimal(18, 0)), CAST(N'2022-02-14' AS Date), 3)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (32, N'Neem Vermi 25.', CAST(N'2022-02-28' AS Date), 0, 25, 0, 0, N'Fully Paid', CAST(425 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (33, N'Vermi 35, Neem Vermi 15.', CAST(N'2022-02-28' AS Date), 35, 15, 0, 0, N'Fully Paid', CAST(645 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (43, N'50 vermi - rate 10', CAST(N'2022-03-24' AS Date), 50, 0, 0, 0, N'Fully Paid', CAST(500 AS Decimal(18, 0)), CAST(N'2022-03-24' AS Date), 16)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (44, N'75 vermi', CAST(N'2022-03-25' AS Date), 75, 0, 0, 0, N'Delivered and Partial Paid', CAST(1200 AS Decimal(18, 0)), CAST(N'2022-03-25' AS Date), 18)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (45, N'Vermi 10 Neem Vermi 22', CAST(N'2022-03-22' AS Date), 10, 15, 0, 0, N'Delivered and Partial Paid', CAST(490 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), 20)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (47, N'Neem Vermi 50.', CAST(N'2022-04-09' AS Date), 0, 50, 0, 0, N'Fully Paid', CAST(800 AS Decimal(18, 0)), CAST(N'2022-04-09' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (48, N'Vermi 50.', CAST(N'2022-04-10' AS Date), 50, 0, 0, 0, N'Fully Paid', CAST(600 AS Decimal(18, 0)), CAST(N'2022-04-10' AS Date), 2)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (56, N'50 Neem Vermi', CAST(N'2022-04-18' AS Date), 0, 50, 0, 0, N'In progress', CAST(800 AS Decimal(18, 0)), CAST(N'2022-04-19' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (57, N'25 Neem Vermi', CAST(N'2022-04-19' AS Date), 0, 25, 0, 0, N'In progress', CAST(450 AS Decimal(18, 0)), CAST(N'2022-04-19' AS Date), 6)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (8, N'65 Vermi', CAST(N'2021-12-10' AS Date), 65, 0, 0, 0, N'Fully Paid', CAST(780 AS Decimal(18, 0)), CAST(N'2021-12-10' AS Date), 4)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (9, N'Neem Vermi 8', CAST(N'2021-12-11' AS Date), 0, 8, 0, 0, N'Fully Paid', CAST(120 AS Decimal(18, 0)), CAST(N'2021-12-11' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (10, N'Vermi 25', CAST(N'2021-12-11' AS Date), 25, 0, 0, 0, N'Fully Paid', CAST(300 AS Decimal(18, 0)), CAST(N'2021-12-11' AS Date), 3)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (11, N'Neem Vermi 20, Vermi 6.', CAST(N'2021-12-15' AS Date), 6, 20, 0, 0, N'Fully Paid', CAST(350 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), 1)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (14, N'Vermi 50, Neem khali 10.', CAST(N'2021-12-20' AS Date), 50, 0, 0, 10, N'Fully Paid', CAST(950 AS Decimal(18, 0)), CAST(N'2021-12-20' AS Date), 7)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (15, N'Neem Vermi 10.', CAST(N'2021-12-21' AS Date), 0, 10, 0, 0, N'Fully Paid', CAST(150 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), 8)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (16, N'Neem Vermi 3, Vermi 3.', CAST(N'2021-12-21' AS Date), 3, 3, 0, 0, N'Fully Paid', CAST(81 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), 9)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (17, N'New Packet 6, Neem Vermi 1.', CAST(N'2021-12-21' AS Date), 0, 1, 6, 0, N'Fully Paid', CAST(147 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), 5)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (18, N'Neem Vermi 155.', CAST(N'2021-12-24' AS Date), 0, 155, 0, 0, N'Fully Paid', CAST(1850 AS Decimal(18, 0)), CAST(N'2021-12-24' AS Date), 10)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (35, N'Vermi 40, Neem Vermi 10.', CAST(N'2022-03-02' AS Date), 40, 10, 0, 0, N'Fully Paid', CAST(680 AS Decimal(18, 0)), CAST(N'2022-03-02' AS Date), 2)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (37, N'Neem Vermi', CAST(N'2022-02-01' AS Date), 0, 100, 0, 0, N'Fully Paid', CAST(1200 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), 10)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (38, N'Vermi-50', CAST(N'2022-03-05' AS Date), 50, 0, 3, 0, N'Fully Paid', CAST(700 AS Decimal(18, 0)), CAST(N'2022-03-05' AS Date), 6)
INSERT [dbo].[Orders] ([Id], [Description], [OrderDate], [Vermi], [NeemVermi], [NewPacket], [Neem], [Status], [Amount], [DeliveryDate], [CustomerId]) VALUES (55, N'Neem Vermi, 200', CAST(N'2022-04-15' AS Date), 0, 200, 0, 0, N'Fully Paid', CAST(2400 AS Decimal(18, 0)), CAST(N'2022-04-19' AS Date), 10)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (49, 38, CAST(700 AS Decimal(18, 0)), CAST(N'2022-03-08' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (50, 40, CAST(700 AS Decimal(18, 0)), CAST(N'2022-03-08' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (51, 41, CAST(1200 AS Decimal(18, 0)), CAST(N'2022-03-21' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (52, 42, CAST(400 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (5, 5, CAST(345 AS Decimal(18, 0)), CAST(N'2021-12-03' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (6, 6, CAST(300 AS Decimal(18, 0)), CAST(N'2021-12-09' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (7, 7, CAST(288 AS Decimal(18, 0)), CAST(N'2021-12-09' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (12, 12, CAST(66 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (13, 13, CAST(412 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (33, 19, CAST(342 AS Decimal(18, 0)), CAST(N'2021-12-24' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (34, 21, CAST(1270 AS Decimal(18, 0)), CAST(N'2021-12-25' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (35, 22, CAST(1000 AS Decimal(18, 0)), CAST(N'2021-12-26' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (36, 23, CAST(750 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (37, 24, CAST(260 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (38, 25, CAST(4552 AS Decimal(18, 0)), CAST(N'2021-12-31' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (39, 26, CAST(300 AS Decimal(18, 0)), CAST(N'2022-03-13' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (40, 27, CAST(95 AS Decimal(18, 0)), CAST(N'2022-02-03' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (41, 28, CAST(495 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (42, 29, CAST(405 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (43, 30, CAST(800 AS Decimal(18, 0)), CAST(N'2022-02-02' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (44, 31, CAST(675 AS Decimal(18, 0)), CAST(N'2022-02-14' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (45, 32, CAST(425 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (46, 33, CAST(645 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (53, 43, CAST(500 AS Decimal(18, 0)), CAST(N'2022-03-27' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (54, 44, CAST(600 AS Decimal(18, 0)), CAST(N'2022-03-27' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (55, 45, CAST(50 AS Decimal(18, 0)), CAST(N'2022-03-22' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (56, 47, CAST(800 AS Decimal(18, 0)), CAST(N'2022-04-09' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (58, 55, CAST(2400 AS Decimal(18, 0)), CAST(N'2022-04-19' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (8, 8, CAST(780 AS Decimal(18, 0)), CAST(N'2021-12-10' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (9, 9, CAST(120 AS Decimal(18, 0)), CAST(N'2021-12-11' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (10, 10, CAST(300 AS Decimal(18, 0)), CAST(N'2021-12-11' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (11, 11, CAST(350 AS Decimal(18, 0)), CAST(N'2021-12-15' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (14, 14, CAST(950 AS Decimal(18, 0)), CAST(N'2021-12-20' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (15, 15, CAST(150 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (16, 16, CAST(81 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (17, 17, CAST(147 AS Decimal(18, 0)), CAST(N'2021-12-21' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (18, 18, CAST(1850 AS Decimal(18, 0)), CAST(N'2021-12-24' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (19, 0, CAST(342 AS Decimal(18, 0)), CAST(N'2021-12-24' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (20, 0, CAST(1270 AS Decimal(18, 0)), CAST(N'2021-12-25' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (21, 0, CAST(1000 AS Decimal(18, 0)), CAST(N'2021-12-26' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (22, 0, CAST(750 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (23, 0, CAST(260 AS Decimal(18, 0)), CAST(N'2021-12-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (24, 0, CAST(4552 AS Decimal(18, 0)), CAST(N'2021-12-31' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (25, 0, CAST(300 AS Decimal(18, 0)), CAST(N'2022-01-13' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (26, 0, CAST(95 AS Decimal(18, 0)), CAST(N'2022-02-03' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (27, 0, CAST(495 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (28, 0, CAST(405 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (29, 0, CAST(800 AS Decimal(18, 0)), CAST(N'2022-02-02' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (30, 0, CAST(675 AS Decimal(18, 0)), CAST(N'2022-02-14' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (31, 0, CAST(425 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (32, 0, CAST(645 AS Decimal(18, 0)), CAST(N'2022-02-28' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (47, 35, CAST(680 AS Decimal(18, 0)), CAST(N'2022-03-02' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (48, 37, CAST(1200 AS Decimal(18, 0)), CAST(N'2022-02-05' AS Date), N'')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [Date], [PaymentType]) VALUES (57, 48, CAST(600 AS Decimal(18, 0)), CAST(N'2022-04-10' AS Date), N'')
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Rates] ON 

INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (1, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2022-02-26' AS Date), NULL, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (2, CAST(4 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(N'2022-02-26' AS Date), NULL, CAST(4 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (3, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2022-02-26' AS Date), NULL, CAST(11 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (4, CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (10, CAST(13 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(22 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (13, CAST(12 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (14, CAST(0 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (16, CAST(22 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(33 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (17, CAST(25 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (18, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(26 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (23, CAST(16 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(N'2022-03-05' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (24, CAST(16 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(N'2022-03-27' AS Date), NULL, CAST(25 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (5, CAST(12 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (6, CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (7, CAST(12 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (8, CAST(12 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (9, CAST(0 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(22 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (11, CAST(12 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (12, CAST(0 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (15, CAST(0 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (19, CAST(18 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (20, CAST(10 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (21, CAST(15 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(20 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Rates] ([Id], [Vermi], [NeemVermi], [DateCreated], [Description], [NewPack], [Neem]) VALUES (22, CAST(16 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-02-27' AS Date), NULL, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Rates] OFF
/****** Object:  StoredProcedure [dbo].[spAddComm]    Script Date: 12/8/2022 12:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddComm]
	@CustomerId int,
	@Details varchar(1000),
	@Date Date,
	@FollowUp Date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Communication]
           ([Details]
           ,[Date]
           ,[CustomerId]
           ,[FollowUp])
     VALUES
           (@Details
           ,@Date
           ,@CustomerId
           ,@FollowUp)
END




GO
/****** Object:  StoredProcedure [dbo].[spAddCustomer]    Script Date: 12/8/2022 12:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddCustomer] 
	@Name varchar(250),
	@Address varchar(250),
	@City varchar(250),
	@State varchar(250),
	@PrimaryPhone varchar(250),
	@PrimaryContact varchar(250),
	@AltPhone varchar(250),
	@AltContact varchar(250),
	@Vermi decimal(18,0),
	@NeemVermi decimal(18,0),
	@NewPack decimal(18,0),
	@Neem decimal(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Rates]
           ([Vermi]
           ,[NeemVermi]
           ,[DateCreated]
           ,[NewPack]
           ,[Neem])
     VALUES
           (@Vermi,
           @NeemVermi,
           Getdate(),
           @NewPack,
           @Neem)

INSERT INTO [dbo].[Customer]
           ([Name]
           ,[Address]
           ,[City]
           ,[State]
           ,[PrimaryPhone]
           ,[AlterPhone1]
           ,[PrimaryContact]
           ,[AlterContact1]
           ,[RateId]
           ,[CustomerSince])
     VALUES
           (@Name,
           @Address,
           @City,
           @State,
           @PrimaryPhone,
           @AltPhone,
           @PrimaryContact,
           @AltContact,
           @@IDENTITY,
           getdate())
END


GO
/****** Object:  StoredProcedure [dbo].[spAddExpense]    Script Date: 12/8/2022 12:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddExpense]
	@Name varchar(250),
	@Description varchar(250),
	@Amount varchar(250),
	@Date Date,
	@CommissionType varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Expense]
           ([Name]
           ,[Description]
           ,[Amount]
           ,[Date]
		   ,CommissionType)
     VALUES
           (@Name
           ,@Description
           ,@Amount
           ,@Date
		   ,@CommissionType)
END




GO
/****** Object:  StoredProcedure [dbo].[spAddOrder]    Script Date: 12/8/2022 12:08:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddOrder]
	@CustomerId int, 
	@Description varchar(250),
	@OrderDate varchar(250),
	@Vermi varchar(250),
	@NeemVermi varchar(250),
	@NewPacket varchar(250),
	@Neem varchar(250),
	@Status varchar(250),
	@Amount varchar(250),
	@DeliveryDate Date,
	@OrderId int out

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Orders]
           ([Description]
           ,[OrderDate]
           ,[Vermi]
           ,[NeemVermi]
           ,[NewPacket]
		   ,[Neem]
           ,[Status]
           ,[Amount]
           ,[DeliveryDate]
           ,[CustomerId])
     VALUES
           (@Description
           ,@OrderDate
		   ,@Vermi
           ,@NeemVermi
           ,@NewPacket
           ,@Neem
           ,@Status
           ,@Amount
           ,@DeliveryDate
           ,@CustomerId)

		   SET @OrderId = @@Identity
END




GO
/****** Object:  StoredProcedure [dbo].[spAddPayment]    Script Date: 12/8/2022 12:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddPayment]
	@OrderId int, 
	@Amount Decimal(18,0),
	@OrderDate date,
	@Type varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Payment]
           ([OrderId]
           ,[Amount]
           ,[Date]
           ,[PaymentType])
     VALUES
           (@OrderId
           ,@Amount
           ,@OrderDate
           ,@Type)
END





GO
/****** Object:  StoredProcedure [dbo].[spD_AddOrder]    Script Date: 12/8/2022 12:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_AddOrder]
	@CustomerId int, 
	@Desc varchar(250),
	@OrderDate Date,
	@Jeer160 float,
	@Shikanji160 float,
	@Neebu160 float,
	@Status varchar(50),
	@Amount decimal(18,0),
	@OrderId int out

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Bal Decimal(18, 0)
	IF(@Status = 'Paid')
	BEGIN
		SET @Bal = 0
	END
	ELSE IF(@Status = 'Partial')
	BEGIN
		SET @Bal = @Amount
	END
	ELSE
	BEGIN
		SET @Bal = (@Jeer160 + @Shikanji160 + @Neebu160) * 200;
	END

INSERT INTO [dbo].[D_Orders]
           ([OrderDate]
           ,[Jeera_160]
           ,[Shikanji_160]
           ,[Nimbu_160]
		   ,[Status]
           ,[Balance]
		   ,[Description]
           ,[DeliveryDate]
           ,[CustomerId]
		   ,CreatedTimeStamp
		   ,UpdatedTimeStamp)
     VALUES
           (@OrderDate
		   ,@Jeer160
           ,@Shikanji160
           ,@Neebu160
           ,@Status
           ,@Bal
		   ,@Desc
           ,@OrderDate --DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))
           ,@CustomerId
		   ,GETDATE()
		   ,GETDATE())

		   SET @OrderId = @@Identity
END





GO
/****** Object:  StoredProcedure [dbo].[spD_GetAllOrders]    Script Date: 12/8/2022 12:08:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_GetAllOrders]
	@CustomerId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@CustomerId > 0)
	BEGIN
	SELECT  O.[Id]
			,C.NAME
           ,[OrderDate]
           ,[Jeera_160]
           ,[Shikanji_160]
           ,[Nimbu_160]
		   ,(Jeera_160 + Shikanji_160 + Nimbu_160) * 200 as Amount
		   , [Balance]
           ,[Status]
           ,[PaymentDate]
           ,[CustomerId]
	FROM [dbo].[D_Orders] O
	INNER JOIN D_Customer C ON O.CustomerId = C.Id
	WHERE O.CustomerId = @CustomerId
	ORDER BY OrderDate asc
	END
	ELSE
	BEGIN
		SELECT  O.[Id]
			,C.NAME
           ,[OrderDate]
           ,[Jeera_160]
           ,[Shikanji_160]
           ,[Nimbu_160]
		   ,(Jeera_160 + Shikanji_160 + Nimbu_160) * 200 as Amount
		   ,[Balance]
           ,[Status]
           ,[PaymentDate]
           ,[CustomerId]
	FROM [dbo].[D_Orders] O
	INNER JOIN D_Customer C ON O.CustomerId = C.Id
	ORDER BY OrderDate desc
	END
END






GO
/****** Object:  StoredProcedure [dbo].[spD_GetCustomerDetails]    Script Date: 12/8/2022 12:08:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_GetCustomerDetails]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Select CustomerId, Count(1) orderCount, SUM(Jeera_160 + Shikanji_160 + Nimbu_160) PCount into #custOrders FROM [dbo].[D_Orders] Group by CustomerId

	select C.Name, O.OrderDate, C.Id INTO #LatestOrder
	from [dbo].[D_Customer] C
    inner join [dbo].[D_Orders] O
        on C.Id = O.CustomerId
        and O.Id = (
            SELECT TOP 1 subOrders.Id
            FROM [dbo].[D_Orders] subOrders 
            WHERE subOrders.CustomerId = O.CustomerId 
            ORDER BY subOrders.OrderDate DESC
        )

	Select LO.Name + ' (' +  STR(co.PCount, 2, 0)  + ')' as Name, co.OrderCount, DATEDIFF(day,  C.CustomerSince, Getdate()) Age, LO.OrderDate LastOrder, C.Area, SUBSTRING(C.ShopType,1,3) ShopType 
	FROM  [dbo].[D_Customer] C 
	Inner Join #custOrders co on C.Id= co.CustomerId
	INNER JOIN #LatestOrder LO on C.Id= LO.Id
	Order By co.PCount desc
END







GO
/****** Object:  StoredProcedure [dbo].[spD_GetOrder]    Script Date: 12/8/2022 12:08:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_GetOrder]
	@CustomerId int, 
	@OrderDate date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [Id]
			,[Description]
           ,[Jeera_160]
           ,[Shikanji_160]
           ,[Nimbu_160]
		   ,CASE
				WHEN [Status] = 'Paid' THEN (Jeera_160 + Shikanji_160 + Nimbu_160) * 200
				WHEN [Status] = 'Partial' THEN (Jeera_160 + Shikanji_160 + Nimbu_160) * 200 - [Balance]
				WHEN [Status] = 'UnPaid' THEN [Balance]
			END AS [Bal]
		   ,[Status]
	FROM [dbo].[D_Orders]
	WHERE CustomerId = @CustomerId
	AND OrderDate = @OrderDate
END






GO
/****** Object:  StoredProcedure [dbo].[spD_GetOrderSummary]    Script Date: 12/8/2022 12:08:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_GetOrderSummary]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TotalPaid DECIMAL(18,0)
	DECLARE @Balance DECIMAL(18,0)

	SELECT SUM(Jeera_160) Jeera, SUM(Shikanji_160) Shikanji, SUM(Nimbu_160) Nimbu FROM D_Orders

	SELECT 500-(SUM(Jeera_160) + SUM(Shikanji_160) + SUM(Nimbu_160)) GDCount FROM D_Orders Where OrderDate > '2022-09-18'

	SELECT @TotalPaid = SUM((Jeera_160 + Shikanji_160 + Nimbu_160) * 200) FROM D_Orders WHERE [Status] in ('Paid', 'Partial')

	SELECT @TotalPaid = @TotalPaid - SUM(Balance) FROM D_Orders WHERE [Status] = 'Partial'

	SELECT @Balance = SUM(Balance) FROM D_Orders

	Select @TotalPaid TotalPaid, @Balance Balance

END







GO
/****** Object:  StoredProcedure [dbo].[spD_UpdateOrder]    Script Date: 12/8/2022 12:08:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spD_UpdateOrder]
	@CustomerId int, 
	@OrderDate date,
	@Status varchar(50),
	@Amount decimal(18,0),
	@Description varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[D_Orders]
	SET [Balance] = 
	CASE
			WHEN @Status = 'Paid' THEN 0
			WHEN @Status = 'Partial' THEN (Jeera_160 + Shikanji_160 + Nimbu_160) * 200 - @Amount
			WHEN @Status = 'UnPaid' THEN (Jeera_160 + Shikanji_160 + Nimbu_160) * 200
			END
	, [Status] = @Status
	, [Description] = @Description
	, UpdatedTimeStamp = GetDate()
	WHERE CustomerId = @CustomerId
	AND OrderDate = @OrderDate
END







GO
/****** Object:  StoredProcedure [dbo].[spGetAllOrders]    Script Date: 12/8/2022 12:08:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllOrders]
	@CustomerId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@CustomerId > 0)
	BEGIN
	SELECT  O.[Id]
			,C.NAME
			,[Description]
           ,[OrderDate]
           ,[Vermi]
           ,[NeemVermi]
           ,[NewPacket]
		   ,[Neem]
           ,[Status]
           ,[Amount]
           ,[DeliveryDate]
           ,[CustomerId]
	FROM [dbo].[Orders] O
	INNER JOIN Customer C ON O.CustomerId = C.Id
	WHERE O.CustomerId = @CustomerId
	ORDER BY OrderDate desc
	END
	ELSE
	BEGIN
	SELECT  O.[Id]
			,C.NAME
			,[Description]
           ,[OrderDate]
           ,[Vermi]
           ,[NeemVermi]
           ,[NewPacket]
		   ,[Neem]
           ,[Status]
           ,[Amount]
           ,[DeliveryDate]
           ,[CustomerId]
	FROM [dbo].[Orders] O
	INNER JOIN Customer C ON O.CustomerId = C.Id
	ORDER BY OrderDate desc
	END

END





GO
/****** Object:  StoredProcedure [dbo].[spGetCommunications]    Script Date: 12/8/2022 12:08:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCommunications]
	@StartDate Date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT Cust.Name
      ,[Details]
      ,[Date]
      ,[FollowUp]
  FROM [dbo].[Communication] C
  INNER JOIN Customer Cust On C.CustomerId = Cust.Id
WHERE C.Date >= @StartDate

END





GO
/****** Object:  StoredProcedure [dbo].[spGetCustomerRate]    Script Date: 12/8/2022 12:08:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomerRate] 
	@CustomerId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT R.Vermi,
	R.NeemVermi,
	R.NewPack,
	R.Neem
	FROM RATES R
	INNER JOIN Customer C ON C.RateId = R.Id
	WHERE C.Id = @CustomerId

END





GO
/****** Object:  StoredProcedure [dbo].[spGetCustomers]    Script Date: 12/8/2022 12:08:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomers] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 select C.[Id]
	  ,C.WaitTime
      ,[Name]
      ,[Address]
      ,[City]
      ,[PrimaryPhone]
	  ,[PrimaryContact]
      ,[AlterPhone1]      
      ,[AlterContact1]
	  ,O.DeliveryDate
	  ,Comm.FollowUp
      ,[CustomerSince]
	  ,R.Vermi Vermi
	  ,R.NeemVermi NeemV
	  ,R.NewPack New
	  ,R.Neem Neem
	   from Customer C
    left join Orders O
        on C.Id = O.CustomerId
		INNER JOIN Rates R on C.RateId = R.Id
        and (O.ID IS NULL OR O.Id = (
            SELECT TOP 1 subOrders.Id 
            FROM Orders subOrders 
            WHERE subOrders.CustomerId = O.CustomerId 
            ORDER BY subOrders.OrderDate DESC
        ))
		Left JOIN 
		(SELECT CustomerId, FollowUp FROM Communication where FollowUp > getdate()) Comm on Comm.CustomerId = C.Id	

		Order by C.Name asc
END


GO
/****** Object:  StoredProcedure [dbo].[spGetCustomersNew]    Script Date: 12/8/2022 12:08:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCustomersNew] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT
	C.[Id]
      ,[Name]
      ,[Address]
      ,[City]
      ,[PrimaryPhone]
	  ,[PrimaryContact]
      ,[AlterPhone1]      
      ,[AlterContact1]
      ,[CustomerSince]
	  ,MAX(O.OrderDate) as LastOrder
	  ,R.Vermi Vermi
	  ,R.NeemVermi NeemV
	  ,R.NewPack New
	  ,R.Neem Neem
  FROM [dbo].[Customer] C
  INNER JOIN Rates R on C.RateId = R.Id
  INNER JOIN Orders O on C.Id = O.CustomerId
  GROUP BY C.[Id]
      ,[Name]
      ,[Address]
      ,[City]
      ,[PrimaryPhone]
	  ,[PrimaryContact]
      ,[AlterPhone1]      
      ,[AlterContact1]
      ,[CustomerSince]
	  ,R.Vermi
	  ,R.NeemVermi
	  ,R.NewPack
	  ,R.Neem
END


GO
/****** Object:  StoredProcedure [dbo].[spGetExpenses]    Script Date: 12/8/2022 12:08:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetExpenses]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Amount]
      ,[Date]
  FROM [dbo].[Expense]
END





GO
/****** Object:  StoredProcedure [dbo].[spGetOrder]    Script Date: 12/8/2022 12:08:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetOrder]
	@CustomerId int, 
	@OrderDate date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  [Id]
			,[Description]
           ,[OrderDate]
           ,[Vermi]
           ,[NeemVermi]
           ,[NewPacket]
		   ,[Neem]
           ,[Status]
           ,[Amount]
           ,[DeliveryDate]
           ,[CustomerId]
	FROM [dbo].[Orders]
	WHERE CustomerId = @CustomerId
	AND OrderDate = @OrderDate
END





GO
/****** Object:  StoredProcedure [dbo].[spGetOrderandRate]    Script Date: 12/8/2022 12:08:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetOrderandRate] 
	@OrderDate date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  
		    O.[Description]
           ,O.[OrderDate]
           ,O.[Vermi]
           ,O.[NeemVermi]
           ,O.[NewPacket]
		   ,O.[Neem]
           ,O.[Status]
           ,O.[Amount]
           ,O.[DeliveryDate]
		   ,R.Vermi VermiRate
		   ,R.NeemVermi NeemVRate
		   ,R.NewPack NewPackRate
		   ,R.Neem NeemRate
	FROM [dbo].[Orders] O
	INNER JOIN Customer C On O.CustomerId = C.Id
	INNER JOIN RATES R On C.RateId = R.Id
	WHERE O.OrderDate >  @OrderDate and O.Status = 'Fully Paid'

END





GO
/****** Object:  StoredProcedure [dbo].[spGetOtherCommission]    Script Date: 12/8/2022 12:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetOtherCommission]
	@StartDate date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  Sum(Amount) TotalAmount
	FROM [dbo].[Expense]
	WHERE [Date] >= @StartDate
	GROUP BY CommissionType 
	Having CommissionType not in ('Marketing-Delivery','Production', 'Transport')
END





GO
/****** Object:  StoredProcedure [dbo].[spGetPaidCommission]    Script Date: 12/8/2022 12:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPaidCommission]
	@StartDate date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  Sum(Amount) TotalAmount, CommissionType
	FROM [dbo].[Expense]
	WHERE [Date] >= @StartDate
	GROUP BY CommissionType 
	Having CommissionType in ('Marketing-Delivery','Production', 'Transport')
END





GO
/****** Object:  StoredProcedure [dbo].[spGetPaymentbyCustomerId]    Script Date: 12/8/2022 12:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPaymentbyCustomerId]
	@CustomerId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  
	C.Name,
	O.Description,
	O.OrderDate,
	O.Amount OrderAmount,
	P.Amount Payment,
	P.Date PaymentDate,
	P.PaymentType
	FROM [dbo].[Orders] O
	INNER JOIN dbo.Payment P ON O.Id = P.OrderId
	INNER JOIN dbo.Customer C ON C.Id = O.CustomerId
	WHERE C.Id = @CustomerId
END


GO
/****** Object:  StoredProcedure [dbo].[spGetPaymentbyOrderId]    Script Date: 12/8/2022 12:08:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPaymentbyOrderId]
	@OrderId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  
	C.Name,
	O.Description,
	O.OrderDate,
	O.Amount OrderAmount,
	P.Amount Payment,
	P.Date PaymentDate,
	P.PaymentType
	FROM [dbo].[Orders] O
	INNER JOIN dbo.Payment P ON O.Id = P.OrderId
	INNER JOIN dbo.Customer C ON C.Id = O.CustomerId
	WHERE O.Id = @OrderId
END





GO
/****** Object:  StoredProcedure [dbo].[spUpdateOrder]    Script Date: 12/8/2022 12:08:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateOrder]
	@OrderId int, 
	@Description varchar(250),
	@OrderDate varchar(250),
	@Vermi varchar(250),
	@NeemVermi varchar(250),
	@NewPacket varchar(250),
	@Neem varchar(250),
	@Status varchar(250),
	@Amount varchar(250),
	@DeliveryDate Date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE  [dbo].[Orders]
	 SET [Description] = @Description
      ,[OrderDate] = @OrderDate
      ,[Vermi] = @Vermi
      ,[NeemVermi] = @NeemVermi
      ,[NewPacket] = @NewPacket
      ,[Neem] = @Neem
      ,[Status] = @Status
      ,[Amount] = @Amount
      ,[DeliveryDate] = @DeliveryDate
	  WHERE Id = @OrderId
END




GO
USE [master]
GO
ALTER DATABASE [CompostProject] SET  READ_WRITE 
GO
