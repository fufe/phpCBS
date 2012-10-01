USE [master]
GO
/****** Object:  Database [phpCBS]    Script Date: 10/1/2012 5:19:38 PM ******/
CREATE DATABASE [phpCBS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phpCBS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\phpCBS.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'phpCBS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\phpCBS_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [phpCBS] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [phpCBS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [phpCBS] SET  MULTI_USER 
GO
ALTER DATABASE [phpCBS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phpCBS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phpCBS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phpCBS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [phpCBS]
GO
/****** Object:  Table [dbo].[meetingrooms]    Script Date: 10/1/2012 5:19:38 PM ******/
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
	[BadProjector] [tinyint] NOT NULL,
	[HasLCDTV] [tinyint] NOT NULL,
	[BadLCDTV] [tinyint] NOT NULL,
	[HasPC] [tinyint] NOT NULL,
	[BadPC] [tinyint] NOT NULL,
	[HasPhone] [tinyint] NOT NULL,
	[BadPhone] [tinyint] NOT NULL,
	[PhoneType] [int] NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[HasWirelessKBM] [tinyint] NOT NULL,
	[BadWirelessKBM] [tinyint] NOT NULL,
	[HasPowerBar] [tinyint] NOT NULL,
	[BadPowerBar] [tinyint] NOT NULL,
	[HasAmplifier] [tinyint] NOT NULL,
	[BadAmplifier] [tinyint] NOT NULL,
	[ProjectorType] [nvarchar](50) NULL,
	[ProjectorLampTime] [int] NULL,
	[AmplifierType] [nvarchar](50) NULL,
	[Speakers] [nvarchar](50) NULL,
	[ScreenSize] [nvarchar](50) NULL,
	[Misc] [nvarchar](max) NULL,
 CONSTRAINT [PK_meetingrooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phonetypes]    Script Date: 10/1/2012 5:19:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[meetingrooms] ON 

INSERT [dbo].[meetingrooms] ([id], [ShortName], [Name], [LocationFloor], [LocationWing], [SeatCount], [HasProjector], [BadProjector], [HasLCDTV], [BadLCDTV], [HasPC], [BadPC], [HasPhone], [BadPhone], [PhoneType], [PhoneNumber], [HasWirelessKBM], [BadWirelessKBM], [HasPowerBar], [BadPowerBar], [HasAmplifier], [BadAmplifier], [ProjectorType], [ProjectorLampTime], [AmplifierType], [Speakers], [ScreenSize], [Misc]) VALUES (1, N'2B1', N'2B1', 2, N'C', 10, 1, 0, 0, 0, 1, 0, 1, 0, 1, N'9234', 1, 0, 1, 0, 1, 0, N'3M xxx', 1233, N'Sanyo', N'2 nagy', N'1600x1300', NULL)
INSERT [dbo].[meetingrooms] ([id], [ShortName], [Name], [LocationFloor], [LocationWing], [SeatCount], [HasProjector], [BadProjector], [HasLCDTV], [BadLCDTV], [HasPC], [BadPC], [HasPhone], [BadPhone], [PhoneType], [PhoneNumber], [HasWirelessKBM], [BadWirelessKBM], [HasPowerBar], [BadPowerBar], [HasAmplifier], [BadAmplifier], [ProjectorType], [ProjectorLampTime], [AmplifierType], [Speakers], [ScreenSize], [Misc]) VALUES (2, N'2B2', N'2B2', 2, N'B', 5, 0, 0, 0, 0, 0, 0, 1, 0, 1, N'9135', 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[meetingrooms] OFF
SET IDENTITY_INSERT [dbo].[phonetypes] ON 

INSERT [dbo].[phonetypes] ([id], [ShortName], [Name]) VALUES (1, N'S', N'SpiderPhone kicsi (VS300)')
INSERT [dbo].[phonetypes] ([id], [ShortName], [Name]) VALUES (2, N'SS', N'SpiderPhone nagy (SoundStation2)')
INSERT [dbo].[phonetypes] ([id], [ShortName], [Name]) VALUES (3, N'SS+M', N'SpiderPhone nagy + external mics')
INSERT [dbo].[phonetypes] ([id], [ShortName], [Name]) VALUES (4, N'D', N'Digital (sima asztali)')
SET IDENTITY_INSERT [dbo].[phonetypes] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_unique_name]    Script Date: 10/1/2012 5:19:38 PM ******/
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [IX_unique_name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_unique_shortname]    Script Date: 10/1/2012 5:19:38 PM ******/
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [IX_unique_shortname] UNIQUE NONCLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadProjector]  DEFAULT ((0)) FOR [BadProjector]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadLCDTV]  DEFAULT ((0)) FOR [BadLCDTV]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadPC]  DEFAULT ((0)) FOR [BadPC]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadPhone]  DEFAULT ((0)) FOR [BadPhone]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadWirelessKBM]  DEFAULT ((0)) FOR [BadWirelessKBM]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadPowerBar]  DEFAULT ((0)) FOR [BadPowerBar]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_BadAmplifier]  DEFAULT ((0)) FOR [BadAmplifier]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_ProjectorType]  DEFAULT (NULL) FOR [ProjectorType]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_ProjectorLampTime]  DEFAULT (NULL) FOR [ProjectorLampTime]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_AmplifierType]  DEFAULT (NULL) FOR [AmplifierType]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_Speakers]  DEFAULT (NULL) FOR [Speakers]
GO
ALTER TABLE [dbo].[meetingrooms] ADD  CONSTRAINT [DF_meetingrooms_Misc]  DEFAULT (NULL) FOR [Misc]
GO
ALTER TABLE [dbo].[meetingrooms]  WITH CHECK ADD  CONSTRAINT [FK_meetingrooms_phonetypes] FOREIGN KEY([PhoneType])
REFERENCES [dbo].[phonetypes] ([id])
GO
ALTER TABLE [dbo].[meetingrooms] CHECK CONSTRAINT [FK_meetingrooms_phonetypes]
GO
USE [master]
GO
ALTER DATABASE [phpCBS] SET  READ_WRITE 
GO
