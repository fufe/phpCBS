USE [master]
GO
/****** Object:  Database [phpCBS]    Script Date: 01/16/2013 01:49:14 ******/
CREATE DATABASE [phpCBS] ON  PRIMARY 
( NAME = N'phpCBS', FILENAME = N'c:\SQLExpress\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\phpCBS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'phpCBS_log', FILENAME = N'c:\SQLExpress\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\phpCBS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [phpCBS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phpCBS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phpCBS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [phpCBS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [phpCBS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [phpCBS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [phpCBS] SET ARITHABORT OFF
GO
ALTER DATABASE [phpCBS] SET AUTO_CLOSE ON
GO
ALTER DATABASE [phpCBS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [phpCBS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [phpCBS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [phpCBS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [phpCBS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [phpCBS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [phpCBS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [phpCBS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [phpCBS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [phpCBS] SET  ENABLE_BROKER
GO
ALTER DATABASE [phpCBS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [phpCBS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [phpCBS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [phpCBS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [phpCBS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [phpCBS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [phpCBS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [phpCBS] SET  READ_WRITE
GO
ALTER DATABASE [phpCBS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [phpCBS] SET  MULTI_USER
GO
ALTER DATABASE [phpCBS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [phpCBS] SET DB_CHAINING OFF
GO
USE [phpCBS]
GO
/****** Object:  ForeignKey [FK_meetingrooms_phonetypes]    Script Date: 01/16/2013 01:49:19 ******/
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [FK_meetingrooms_phonetypes]
GO
/****** Object:  Table [dbo].[meetingrooms]    Script Date: 01/16/2013 01:49:19 ******/
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [FK_meetingrooms_phonetypes]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadProjector]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadLCDTV]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadPC]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadPhone]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadWirelessKBM]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadPowerBar]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_BadAmplifier]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_ProjectorType]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_ProjectorLampTime]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_AmplifierType]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_Speakers]
GO
ALTER TABLE [dbo].[meetingrooms] DROP CONSTRAINT [DF_meetingrooms_Misc]
GO
DROP TABLE [dbo].[meetingrooms]
GO
/****** Object:  Table [dbo].[phonetypes]    Script Date: 01/16/2013 01:49:19 ******/
DROP TABLE [dbo].[phonetypes]
GO
/****** Object:  Table [dbo].[itschedule_applications]    Script Date: 01/16/2013 01:49:19 ******/
DROP TABLE [dbo].[itschedule_applications]
GO
/****** Object:  Table [dbo].[itschedule_event_dates]    Script Date: 01/16/2013 01:49:19 ******/
DROP TABLE [dbo].[itschedule_event_dates]
GO
/****** Object:  Table [dbo].[itschedule_events]    Script Date: 01/16/2013 01:49:19 ******/
ALTER TABLE [dbo].[itschedule_events] DROP CONSTRAINT [DF_itschedule_events_isenabled]
GO
DROP TABLE [dbo].[itschedule_events]
GO
/****** Object:  Table [dbo].[itschedule_users]    Script Date: 01/16/2013 01:49:19 ******/
DROP TABLE [dbo].[itschedule_users]
GO
/****** Object:  Table [dbo].[itschedule_users]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itschedule_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account] [nvarchar](50) NOT NULL,
	[isitscheduleadmin] [tinyint] NOT NULL,
 CONSTRAINT [PK_itschedule_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itschedule_events]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itschedule_events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[description] [text] NULL,
	[datestart] [date] NOT NULL,
	[dateend] [date] NOT NULL,
	[isweekends] [tinyint] NOT NULL,
	[maxapplicationsperuser] [int] NOT NULL,
	[maxdesktopperday] [int] NOT NULL,
	[maxlaptopperday] [int] NOT NULL,
	[isenabled] [tinyint] NOT NULL CONSTRAINT [DF_itschedule_events_isenabled]  DEFAULT ((0)),
 CONSTRAINT [PK_itschedule_events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itschedule_event_dates]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itschedule_event_dates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventid] [int] NOT NULL,
	[eventdate] [date] NOT NULL,
	[isenabled] [tinyint] NOT NULL,
	[maxlaptops] [int] NULL,
	[maxdesktops] [int] NULL,
 CONSTRAINT [PK_itschedule_event_dates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itschedule_applications]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itschedule_applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventdateid] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[devicetype] [nvarchar](10) NOT NULL,
	[hostname] [nvarchar](50) NULL,
	[hostname_man] [nvarchar](50) NOT NULL,
	[deskphone] [nvarchar](12) NULL,
	[mobilephone] [nvarchar](20) NULL,
	[location] [nvarchar](100) NULL,
	[status] [int] NOT NULL,
	[history] [text] NULL,
 CONSTRAINT [PK_itschedule_applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phonetypes]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phonetypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_phonetypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meetingrooms]    Script Date: 01/16/2013 01:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meetingrooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LocationFloor] [tinyint] NOT NULL,
	[LocationWing] [nvarchar](20) NOT NULL,
	[SeatCount] [int] NOT NULL,
	[HasProjector] [tinyint] NOT NULL,
	[BadProjector] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadProjector]  DEFAULT ((0)),
	[HasLCDTV] [tinyint] NOT NULL,
	[BadLCDTV] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadLCDTV]  DEFAULT ((0)),
	[HasPC] [tinyint] NOT NULL,
	[BadPC] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadPC]  DEFAULT ((0)),
	[HasPhone] [tinyint] NOT NULL,
	[BadPhone] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadPhone]  DEFAULT ((0)),
	[PhoneType] [int] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[HasWirelessKBM] [tinyint] NOT NULL,
	[BadWirelessKBM] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadWirelessKBM]  DEFAULT ((0)),
	[HasPowerBar] [tinyint] NOT NULL,
	[BadPowerBar] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadPowerBar]  DEFAULT ((0)),
	[HasAmplifier] [tinyint] NOT NULL,
	[BadAmplifier] [tinyint] NOT NULL CONSTRAINT [DF_meetingrooms_BadAmplifier]  DEFAULT ((0)),
	[ProjectorType] [nvarchar](50) NULL CONSTRAINT [DF_meetingrooms_ProjectorType]  DEFAULT (NULL),
	[ProjectorLampTime] [int] NULL CONSTRAINT [DF_meetingrooms_ProjectorLampTime]  DEFAULT (NULL),
	[AmplifierType] [nvarchar](50) NULL CONSTRAINT [DF_meetingrooms_AmplifierType]  DEFAULT (NULL),
	[Speakers] [nvarchar](50) NULL CONSTRAINT [DF_meetingrooms_Speakers]  DEFAULT (NULL),
	[ScreenSize] [nvarchar](50) NULL,
	[Misc] [nvarchar](max) NULL CONSTRAINT [DF_meetingrooms_Misc]  DEFAULT (NULL),
 CONSTRAINT [PK_meetingrooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_unique_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_unique_shortname] UNIQUE NONCLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_meetingrooms_phonetypes]    Script Date: 01/16/2013 01:49:19 ******/
ALTER TABLE [dbo].[meetingrooms]  WITH CHECK ADD  CONSTRAINT [FK_meetingrooms_phonetypes] FOREIGN KEY([PhoneType])
REFERENCES [dbo].[phonetypes] ([id])
GO
ALTER TABLE [dbo].[meetingrooms] CHECK CONSTRAINT [FK_meetingrooms_phonetypes]
GO
