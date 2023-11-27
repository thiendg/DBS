USE [master]
GO
/****** Object:  Database [former]    Script Date: 11/26/2023 11:36:23 PM ******/
CREATE DATABASE [former]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'former', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\former.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'former_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\former_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [former] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [former].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [former] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [former] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [former] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [former] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [former] SET ARITHABORT OFF 
GO
ALTER DATABASE [former] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [former] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [former] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [former] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [former] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [former] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [former] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [former] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [former] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [former] SET  ENABLE_BROKER 
GO
ALTER DATABASE [former] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [former] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [former] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [former] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [former] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [former] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [former] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [former] SET RECOVERY FULL 
GO
ALTER DATABASE [former] SET  MULTI_USER 
GO
ALTER DATABASE [former] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [former] SET DB_CHAINING OFF 
GO
ALTER DATABASE [former] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [former] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [former] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [former] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'former', N'ON'
GO
ALTER DATABASE [former] SET QUERY_STORE = ON
GO
ALTER DATABASE [former] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [former]
GO
/****** Object:  Table [dbo].[account]    Script Date: 11/26/2023 11:36:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [varchar](10) NOT NULL,
	[account_password] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [varchar](10) NOT NULL,
	[bill_datetime] [datetime] NOT NULL,
	[pay_status] [bit] NOT NULL,
	[res_id] [varchar](10) NOT NULL,
	[table_id] [varchar](10) NOT NULL,
	[cus_id] [varchar](10) NOT NULL,
	[total_cost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[cus_id] [varchar](10) NOT NULL,
	[cus_name] [nvarchar](50) NOT NULL,
	[phone_num] [varchar](10) NULL,
	[account_id] [varchar](10) NULL,
	[loyalty_point] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish](
	[dish_id] [varchar](10) NOT NULL,
	[dish_name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[dish_img] [varchar](255) NOT NULL,
	[dish_type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dish_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dish_img] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_isapplied_prom]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_isapplied_prom](
	[promotion_id] [varchar](10) NOT NULL,
	[dish_id] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_isincluded_bill]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_isincluded_bill](
	[bill_id] [varchar](10) NOT NULL,
	[dish_id] [varchar](10) NOT NULL,
	[dish_count] [tinyint] NOT NULL,
	[current_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prom_applies_bill]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prom_applies_bill](
	[promotion_id] [varchar](10) NOT NULL,
	[bill_id] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC,
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[promotion_id] [varchar](10) NOT NULL,
	[promotion_name] [nvarchar](50) NOT NULL,
	[promotion_type] [varchar](30) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[reduced_price] [int] NULL,
	[reduced_percent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[promotion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[r_table]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[r_table](
	[res_id] [varchar](10) NOT NULL,
	[table_id] [varchar](10) NOT NULL,
	[slot_count] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[res_id] ASC,
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reser_arrange_table]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reser_arrange_table](
	[reservation_id] [varchar](10) NOT NULL,
	[res_id] [varchar](10) NOT NULL,
	[table_id] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC,
	[res_id] ASC,
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reser_preorder_dish]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reser_preorder_dish](
	[reservation_id] [varchar](10) NOT NULL,
	[dish_id] [varchar](10) NOT NULL,
	[dish_count] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[reservation_id] [varchar](10) NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[reservation_datetime] [datetime] NULL,
	[cus_id] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[res_id] [varchar](10) NOT NULL,
	[res_name] [nvarchar](50) NOT NULL,
	[hotline] [varchar](10) NOT NULL,
	[province] [nvarchar](50) NOT NULL,
	[district] [nvarchar](50) NOT NULL,
	[ward] [nvarchar](50) NOT NULL,
	[address_number] [nvarchar](50) NOT NULL,
	[table_count] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[res_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[hotline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staff_id] [varchar](10) NOT NULL,
	[identification] [char](12) NOT NULL,
	[staff_name] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[manager_id] [varchar](10) NULL,
	[province] [nvarchar](50) NOT NULL,
	[district] [nvarchar](50) NOT NULL,
	[ward] [nvarchar](50) NOT NULL,
	[address_number] [nvarchar](50) NOT NULL,
	[res_id] [varchar](10) NOT NULL,
	[account_id] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[identification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_email]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_email](
	[staff_id] [varchar](10) NOT NULL,
	[email] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff_phone]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_phone](
	[staff_id] [varchar](10) NOT NULL,
	[phone] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC,
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [bill_fk_cusID_to_customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[customer] ([cus_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [bill_fk_cusID_to_customer]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [bill_fk_resID_tableID_to_table] FOREIGN KEY([res_id], [table_id])
REFERENCES [dbo].[r_table] ([res_id], [table_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [bill_fk_resID_tableID_to_table]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [customer_fk_accountID_to_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [customer_fk_accountID_to_account]
GO
ALTER TABLE [dbo].[dish_isapplied_prom]  WITH CHECK ADD  CONSTRAINT [dishIsappliedProm_fk_dishID_to_dish] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dish] ([dish_id])
GO
ALTER TABLE [dbo].[dish_isapplied_prom] CHECK CONSTRAINT [dishIsappliedProm_fk_dishID_to_dish]
GO
ALTER TABLE [dbo].[dish_isapplied_prom]  WITH CHECK ADD  CONSTRAINT [dishIsappliedProm_fk_promotionID_to_promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([promotion_id])
GO
ALTER TABLE [dbo].[dish_isapplied_prom] CHECK CONSTRAINT [dishIsappliedProm_fk_promotionID_to_promotion]
GO
ALTER TABLE [dbo].[dish_isincluded_bill]  WITH CHECK ADD  CONSTRAINT [isincluded_fk_billID_to_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[dish_isincluded_bill] CHECK CONSTRAINT [isincluded_fk_billID_to_bill]
GO
ALTER TABLE [dbo].[dish_isincluded_bill]  WITH CHECK ADD  CONSTRAINT [isincluded_fk_dishID_to_dish] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dish] ([dish_id])
GO
ALTER TABLE [dbo].[dish_isincluded_bill] CHECK CONSTRAINT [isincluded_fk_dishID_to_dish]
GO
ALTER TABLE [dbo].[prom_applies_bill]  WITH CHECK ADD  CONSTRAINT [promAppliesBill_fk_billID_to_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[prom_applies_bill] CHECK CONSTRAINT [promAppliesBill_fk_billID_to_bill]
GO
ALTER TABLE [dbo].[prom_applies_bill]  WITH CHECK ADD  CONSTRAINT [promAppliesBill_fk_promotionID_to_promotion] FOREIGN KEY([promotion_id])
REFERENCES [dbo].[promotion] ([promotion_id])
GO
ALTER TABLE [dbo].[prom_applies_bill] CHECK CONSTRAINT [promAppliesBill_fk_promotionID_to_promotion]
GO
ALTER TABLE [dbo].[r_table]  WITH CHECK ADD  CONSTRAINT [table_fk_resID_to_restaurant] FOREIGN KEY([res_id])
REFERENCES [dbo].[restaurant] ([res_id])
GO
ALTER TABLE [dbo].[r_table] CHECK CONSTRAINT [table_fk_resID_to_restaurant]
GO
ALTER TABLE [dbo].[reser_arrange_table]  WITH CHECK ADD  CONSTRAINT [arranges_fk_reservationID_to_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[reser_arrange_table] CHECK CONSTRAINT [arranges_fk_reservationID_to_reservation]
GO
ALTER TABLE [dbo].[reser_arrange_table]  WITH CHECK ADD  CONSTRAINT [arranges_fk_resID_tableID_to_table] FOREIGN KEY([res_id], [table_id])
REFERENCES [dbo].[r_table] ([res_id], [table_id])
GO
ALTER TABLE [dbo].[reser_arrange_table] CHECK CONSTRAINT [arranges_fk_resID_tableID_to_table]
GO
ALTER TABLE [dbo].[reser_preorder_dish]  WITH CHECK ADD  CONSTRAINT [preorder_fk_dishID_to_dish] FOREIGN KEY([dish_id])
REFERENCES [dbo].[dish] ([dish_id])
GO
ALTER TABLE [dbo].[reser_preorder_dish] CHECK CONSTRAINT [preorder_fk_dishID_to_dish]
GO
ALTER TABLE [dbo].[reser_preorder_dish]  WITH CHECK ADD  CONSTRAINT [preorder_fk_reservationID_to_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[reser_preorder_dish] CHECK CONSTRAINT [preorder_fk_reservationID_to_reservation]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [reservation_fk_cusID_to_customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[customer] ([cus_id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [reservation_fk_cusID_to_customer]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [staff_fk_accountID_to_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[account] ([account_id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_fk_accountID_to_account]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [staff_fk_managerID_to_staff] FOREIGN KEY([manager_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_fk_managerID_to_staff]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [staff_fk_resID_to_restaurant] FOREIGN KEY([res_id])
REFERENCES [dbo].[restaurant] ([res_id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_fk_resID_to_restaurant]
GO
ALTER TABLE [dbo].[staff_email]  WITH CHECK ADD  CONSTRAINT [semail_fk_staffID_to_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[staff_email] CHECK CONSTRAINT [semail_fk_staffID_to_staff]
GO
ALTER TABLE [dbo].[staff_phone]  WITH CHECK ADD  CONSTRAINT [sphone_fk_staffID_to_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[staff_phone] CHECK CONSTRAINT [sphone_fk_staffID_to_staff]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [account_check_password] CHECK  ((len([account_password])>=(6)))
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [account_check_password]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [customer_check_phonenumber] CHECK  ((NOT [phone_num] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [customer_check_phonenumber]
GO
ALTER TABLE [dbo].[dish]  WITH CHECK ADD  CONSTRAINT [dish_check_price] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[dish] CHECK CONSTRAINT [dish_check_price]
GO
ALTER TABLE [dbo].[dish_isincluded_bill]  WITH CHECK ADD  CONSTRAINT [isincluded_check_dishCount] CHECK  (([dish_count]>(0)))
GO
ALTER TABLE [dbo].[dish_isincluded_bill] CHECK CONSTRAINT [isincluded_check_dishCount]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [promotion_check_duration] CHECK  (([start_time]<[end_time]))
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [promotion_check_duration]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [promotion_check_reducedPercent] CHECK  (([reduced_percent]>(0) AND [reduced_percent]<=(100)))
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [promotion_check_reducedPercent]
GO
ALTER TABLE [dbo].[promotion]  WITH CHECK ADD  CONSTRAINT [promotion_check_reducedPrice] CHECK  (([reduced_price]>(0)))
GO
ALTER TABLE [dbo].[promotion] CHECK CONSTRAINT [promotion_check_reducedPrice]
GO
ALTER TABLE [dbo].[r_table]  WITH CHECK ADD  CONSTRAINT [table_check_slotcount] CHECK  (([slot_count]=(10) OR [slot_count]=(8) OR [slot_count]=(6) OR [slot_count]=(4)))
GO
ALTER TABLE [dbo].[r_table] CHECK CONSTRAINT [table_check_slotcount]
GO
ALTER TABLE [dbo].[reser_preorder_dish]  WITH CHECK ADD  CONSTRAINT [preorder_check_dishCount] CHECK  (([dish_count]>(0)))
GO
ALTER TABLE [dbo].[reser_preorder_dish] CHECK CONSTRAINT [preorder_check_dishCount]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [reservation_check_quantity] CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [reservation_check_quantity]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [staff_check_dob] CHECK  (([date_of_birth]>='1990-01-01' AND [date_of_birth]<='2005-12-31'))
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_check_dob]
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [staff_check_identification] CHECK  ((NOT [identification] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_check_identification]
GO
ALTER TABLE [dbo].[staff_email]  WITH CHECK ADD  CONSTRAINT [semail_check_email] CHECK  (([email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[staff_email] CHECK CONSTRAINT [semail_check_email]
GO
ALTER TABLE [dbo].[staff_phone]  WITH CHECK ADD  CONSTRAINT [sphone_check_phonenumber] CHECK  ((NOT [phone] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[staff_phone] CHECK CONSTRAINT [sphone_check_phonenumber]
GO
/****** Object:  StoredProcedure [dbo].[staff_age_above]    Script Date: 11/26/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SHOW LIST OF STAFFS, WHOSE AGES (COUNT ON YEAR) ARE ABOVE A CERTAIN AGE, AT RESTAURANTS IN PARTICULAR PROVINCE --
CREATE   PROCEDURE [dbo].[staff_age_above] (@prov NVARCHAR(50), @year INT) AS
BEGIN
	SET @year = DATEPART(yyyy, GETDATE()) - @year;
	SELECT		s.*
	FROM		dbo.staff AS s JOIN dbo.restaurant AS r ON s.res_id = r.res_id
	WHERE		DATEPART(yyyy,s.date_of_birth) < @year 
				AND r.province = @prov
	ORDER BY	s.identification DESC;
END;

EXEC dbo.staff_age_above 'Biên Hòa', 20;
GO
USE [master]
GO
ALTER DATABASE [former] SET  READ_WRITE 
GO
