USE [master]
GO
/****** Object:  Database [AdvancedTaskAU-DW]    Script Date: 3/15/2023 12:39:59 PM ******/
CREATE DATABASE [AdvancedTaskAU-DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdvancedTaskAU-DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IC\MSSQL\DATA\AdvancedTaskAU-DW.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdvancedTaskAU-DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.IC\MSSQL\DATA\AdvancedTaskAU-DW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdvancedTaskAU-DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET RECOVERY FULL 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET  MULTI_USER 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdvancedTaskAU-DW', N'ON'
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET QUERY_STORE = OFF
GO
USE [AdvancedTaskAU-DW]
GO
/****** Object:  Table [dbo].[DimAuLocalSchool]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAuLocalSchool](
	[DimSchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolAlternateKey] [int] NOT NULL,
	[DimGeographyKey] [int] NULL,
	[SchoolName] [nvarchar](255) NULL,
	[SchoolType] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
 CONSTRAINT [PK_DimAuLocalSchool_DimSchoolKey] PRIMARY KEY CLUSTERED 
(
	[DimSchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimAuLocalSchool_SchoolAlternateKey] UNIQUE NONCLUSTERED 
(
	[SchoolAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCrimeByYear]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCrimeByYear](
	[DimCrimeKey] [int] IDENTITY(1,1) NOT NULL,
	[CrimeAlternateKey] [int] NULL,
	[OffenceCategory] [nvarchar](255) NULL,
	[IncidentYear] [datetime] NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[City] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DimCrimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [datetime] NULL,
	[DateName] [nchar](11) NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nchar](10) NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekdayWeekend] [nchar](10) NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[MonthName] [nchar](10) NOT NULL,
	[MonthOfYear] [tinyint] NOT NULL,
	[IsLastDayOfMonth] [nchar](1) NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarYearMonth] [nchar](10) NOT NULL,
	[CalendarYearQtr] [nchar](10) NOT NULL,
	[FiscalMonthOfYear] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[FiscalYearMonth] [nchar](10) NOT NULL,
	[FiscalYearQtr] [nchar](10) NOT NULL,
 CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[DimGeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[GeographyAlternateKey] [int] NOT NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[StateKey] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
 CONSTRAINT [PK_DimGeography_DimGeographyKey] PRIMARY KEY CLUSTERED 
(
	[DimGeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimGeography_GeographyAlternateKey] UNIQUE NONCLUSTERED 
(
	[GeographyAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPropertyMedian]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPropertyMedian](
	[DimPropertyKey] [int] IDENTITY(1,1) NOT NULL,
	[DimPropertyAlternateKey] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_DimPropertyMedian_DimPropertyKey] PRIMARY KEY CLUSTERED 
(
	[DimPropertyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimPropertyMedian_PropertyId] UNIQUE NONCLUSTERED 
(
	[DimPropertyAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRentalMedian]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRentalMedian](
	[DimRentalMedianKey] [int] IDENTITY(1,1) NOT NULL,
	[RentalAlternateKey] [int] NULL,
	[StateCode] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[DwellingType] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DimRentalMedianKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimState]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimState](
	[DimStateKey] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[StateName] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DimStateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTransport]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTransport](
	[DimTransportKey] [int] IDENTITY(1,1) NOT NULL,
	[TransportAlternateKey] [int] NOT NULL,
	[DimGeographyKey] [int] NULL,
	[StopName] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
	[Mode] [nvarchar](255) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
 CONSTRAINT [PK_DimTransport_DimTransportKey] PRIMARY KEY CLUSTERED 
(
	[DimTransportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_DimTransport_TransportAlternateKey] UNIQUE NONCLUSTERED 
(
	[TransportAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCrimeByYear]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCrimeByYear](
	[FactCrimeKey] [int] IDENTITY(1,1) NOT NULL,
	[DimCrimeKey] [int] NULL,
	[DimGeographyKey] [int] NULL,
	[DimDateKey] [int] NULL,
	[IncidentCount] [int] NULL,
 CONSTRAINT [PK_FactCrimeKey] PRIMARY KEY CLUSTERED 
(
	[FactCrimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactMedianPropertyValueByYear]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMedianPropertyValueByYear](
	[FactPropertyKey] [int] IDENTITY(1,1) NOT NULL,
	[DimPropertyKey] [int] NULL,
	[DimGeographyKey] [int] NULL,
	[DimDateKey] [int] NULL,
	[PropertyMedianValue] [int] NULL,
 CONSTRAINT [PK_FactProperty_FactPropertyKey] PRIMARY KEY CLUSTERED 
(
	[FactPropertyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSuburbRentalMedian]    Script Date: 3/15/2023 12:40:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSuburbRentalMedian](
	[FactRentalMedianKey] [int] IDENTITY(1,1) NOT NULL,
	[DimRentalMedianKey] [int] NULL,
	[DimGeographyKey] [int] NULL,
	[RentalMedianValue] [int] NULL,
 CONSTRAINT [PK_FactRentalMedianKey] PRIMARY KEY CLUSTERED 
(
	[FactRentalMedianKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimAuLocalSchool]  WITH CHECK ADD  CONSTRAINT [FK_DimAuLocalSchool_DimGeography] FOREIGN KEY([DimGeographyKey])
REFERENCES [dbo].[DimGeography] ([DimGeographyKey])
GO
ALTER TABLE [dbo].[DimAuLocalSchool] CHECK CONSTRAINT [FK_DimAuLocalSchool_DimGeography]
GO
ALTER TABLE [dbo].[DimGeography]  WITH CHECK ADD  CONSTRAINT [FK_DimGeography_DimState] FOREIGN KEY([StateKey])
REFERENCES [dbo].[DimState] ([DimStateKey])
GO
ALTER TABLE [dbo].[DimGeography] CHECK CONSTRAINT [FK_DimGeography_DimState]
GO
ALTER TABLE [dbo].[DimTransport]  WITH CHECK ADD  CONSTRAINT [FK_DimTransport_DimGeography] FOREIGN KEY([DimGeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyAlternateKey])
GO
ALTER TABLE [dbo].[DimTransport] CHECK CONSTRAINT [FK_DimTransport_DimGeography]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FactCrime_DimCrimeKey] FOREIGN KEY([DimCrimeKey])
REFERENCES [dbo].[DimCrimeByYear] ([DimCrimeKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FactCrime_DimCrimeKey]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FactCrime_DimDate] FOREIGN KEY([DimDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FactCrime_DimDate]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FactCrime_DimGeography] FOREIGN KEY([DimGeographyKey])
REFERENCES [dbo].[DimGeography] ([DimGeographyKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FactCrime_DimGeography]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FactProperty_DimDate] FOREIGN KEY([DimDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FactProperty_DimDate]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FactProperty_DimGeography] FOREIGN KEY([DimGeographyKey])
REFERENCES [dbo].[DimGeography] ([DimGeographyKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FactProperty_DimGeography]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FactProperty_DimPropertyMedian] FOREIGN KEY([DimPropertyKey])
REFERENCES [dbo].[DimPropertyMedian] ([DimPropertyKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FactProperty_DimPropertyMedian]
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian]  WITH CHECK ADD  CONSTRAINT [FactRental_DimGeography] FOREIGN KEY([DimGeographyKey])
REFERENCES [dbo].[DimGeography] ([DimGeographyKey])
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian] CHECK CONSTRAINT [FactRental_DimGeography]
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian]  WITH CHECK ADD  CONSTRAINT [FactRental_DimPropertyMedian] FOREIGN KEY([DimRentalMedianKey])
REFERENCES [dbo].[DimRentalMedian] ([DimRentalMedianKey])
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian] CHECK CONSTRAINT [FactRental_DimPropertyMedian]
GO
USE [master]
GO
ALTER DATABASE [AdvancedTaskAU-DW] SET  READ_WRITE 
GO
