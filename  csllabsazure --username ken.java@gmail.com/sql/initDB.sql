USE [master]
GO
/****** Object:  Database [LabsDB]    Script Date: 11/19/2013 12:45:35 ******/
CREATE DATABASE [LabsDB] ON  PRIMARY 
( NAME = N'LabsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LabsDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LabsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LabsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LabsDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LabsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LabsDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LabsDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LabsDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LabsDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LabsDB] SET ARITHABORT OFF
GO
ALTER DATABASE [LabsDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LabsDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LabsDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LabsDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LabsDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LabsDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LabsDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LabsDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LabsDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LabsDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LabsDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [LabsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LabsDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LabsDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LabsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LabsDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LabsDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LabsDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LabsDB] SET  READ_WRITE
GO
ALTER DATABASE [LabsDB] SET RECOVERY FULL
GO
ALTER DATABASE [LabsDB] SET  MULTI_USER
GO
ALTER DATABASE [LabsDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LabsDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'LabsDB', N'ON'
GO
USE [LabsDB]
GO
/****** Object:  Table [dbo].[Labs]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Labs](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[desc] [nvarchar](250) NULL,
	[currentPhase] [nvarchar](10) NOT NULL,
	[begin] [date] NOT NULL,
	[end] [date] NOT NULL,
 CONSTRAINT [PK_Labs] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Labs] ON [dbo].[Labs] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Labs] ON
INSERT [dbo].[Labs] ([sid], [name], [desc], [currentPhase], [begin], [end]) VALUES (1, N'Administrator', N'SysAsmin', N'INIT', CAST(0xA5370B00 AS Date), CAST(0xAB410B00 AS Date))
INSERT [dbo].[Labs] ([sid], [name], [desc], [currentPhase], [begin], [end]) VALUES (2, N'Test1', N'Just Test', N'PartB1', CAST(0xA5370B00 AS Date), CAST(0xB3370B00 AS Date))
INSERT [dbo].[Labs] ([sid], [name], [desc], [currentPhase], [begin], [end]) VALUES (3, N'Lab2', N'This is a test data for Lab2', N'PartB2', CAST(0xCA370B00 AS Date), CAST(0x09380B00 AS Date))
SET IDENTITY_INSERT [dbo].[Labs] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](12) NOT NULL,
	[nickname] [nvarchar](20) NOT NULL,
	[passsword] [nvarchar](20) NOT NULL,
	[birthday] [date] NULL,
	[age] [int] NOT NULL,
	[group] [nvarchar](10) NOT NULL,
	[school] [nvarchar](50) NULL,
	[dept] [nvarchar](50) NULL,
	[labid] [int] NOT NULL,
	[student_id] [nvarchar](20) NOT NULL,
	[groupid] [int] NULL,
	[gender] [nvarchar](5) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (3, N'admin', N'asd', N'1234', CAST(0xB9370B00 AS Date), 40, N'admin', N'admin', N'ICE', 1, N'admin', 0, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (204, N'Ken', N'232', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (205, N'Admas', N'OK', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121002', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (206, N'Helen', N'IIO', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121003', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (207, N'Jay', N'FF', N'20131221', CAST(0xF6370B00 AS Date), 0, N'D', N'NTNU', N'家裡蹲', 2, N'121004', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (208, N'May', N'Ken Test', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121005', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (209, N'Ken', N'a', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121006', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (210, N'Admas', N'121007', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121007', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (211, N'Helen', N'OO', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121008', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (212, N'Jay', N'KLKL', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121009', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (213, N'May', N'121010', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121010', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (214, N'Ken', N'121011', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121011', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (215, N'Admas', N'HH', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121012', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (216, N'Helen', N'121013', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121013', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (217, N'Jay', N'121014', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121014', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (218, N'May', N'121015', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121015', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (219, N'Ken', N'assad', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121016', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (220, N'Admas', N'121017', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121017', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (221, N'Helen', N'121018', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121018', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (222, N'Jay', N'121019', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121019', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (223, N'May', N'121020', N'20131221', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 2, N'121020', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (224, N'Frank', N'121021', N'20131221', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 2, N'121021', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (225, N'Joy', N'121022', N'20131221', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 2, N'121022', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (248, N'Ken', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (249, N'Admas', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (250, N'Helen', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (251, N'Jay', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (252, N'May', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (253, N'Ken', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (254, N'Admas', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (255, N'Helen', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (256, N'Jay', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (257, N'May', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (258, N'Ken', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (259, N'Admas', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (260, N'Helen', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (261, N'Jay', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (262, N'May', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (263, N'Ken', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (264, N'Admas', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (265, N'Helen', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (266, N'Jay', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (267, N'May', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'C', N'NTNU', N'家裡蹲', 3, N'221001', 1, N'F')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (268, N'Frank', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'A', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'M')
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (269, N'Joy', N'221001', N'221001', CAST(0xF6370B00 AS Date), 0, N'B', N'NTNU', N'家裡蹲', 3, N'221001', 2, N'F')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Survey]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phase] [nvarchar](10) NOT NULL,
	[type] [nvarchar](10) NOT NULL,
	[scale] [nvarchar](10) NULL,
	[surveyid] [int] NOT NULL,
	[labid] [int] NOT NULL,
	[desc] [nvarchar](500) NULL,
	[title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Survey] ON [dbo].[Survey] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Survey] ON
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (54, N'第二階段線上習作', N'PartB2', N'SURVEY', NULL, 21, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (56, N'GroupC線上習作', N'PartB1', N'SURVEY', NULL, 23, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (57, N'後測', N'Final', N'SCALE', N'6', 24, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (58, N'第一階段線上習作', N'PartA', N'SURVEY', NULL, 11, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (59, N'第一階段學習自評', N'PartA', N'SCALE', N'6', 12, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (60, N'第二階段學習自評', N'PartB2', N'SCALE', N'6', 22, 2, NULL, NULL)
INSERT [dbo].[Survey] ([sid], [name], [phase], [type], [scale], [surveyid], [labid], [desc], [title]) VALUES (64, N'第二階段線上習作', N'PartB2', N'SURVEY', NULL, 21, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Survey] OFF
/****** Object:  Table [dbo].[DiscussionB]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscussionB](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[labid] [int] NOT NULL,
	[groupid] [int] NOT NULL,
	[topic] [nvarchar](500) NOT NULL,
	[student_id] [int] NOT NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_DiscussionB] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscussionB] ON
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (1, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C07FFC AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (2, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C082C1 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (3, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C0CD3F AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (4, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C0CE4D AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (5, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C0CEF6 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (6, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C0CF74 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (7, 2, 0, N'121012121012121012', 215, CAST(0x0000A26F00C0EAE2 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (8, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24478 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (9, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24625 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (10, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24956 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (11, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24A10 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (12, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24AAE AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (13, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24B04 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (14, 2, 1, N'sfgsdfg', 215, CAST(0x0000A26F00C24B65 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (15, 2, 1, N'xcvb', 215, CAST(0x0000A26F00C41E6E AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (16, 2, 1, N'cvbcvb', 215, CAST(0x0000A26F00C42A17 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (17, 2, 1, N'dsfsdf', 215, CAST(0x0000A26F00C4670A AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (18, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C46AD8 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (19, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C46C9F AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (20, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C46E39 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (21, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C46F26 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (22, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C46FE3 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (23, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C47090 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (24, 2, 1, N'dsfsdfsdf', 215, CAST(0x0000A26F00C4713A AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (25, 2, 1, N'OK', 215, CAST(0x0000A26F00D21D9C AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (26, 2, 1, N'asdasd', 215, CAST(0x0000A26F00D2275D AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (27, 2, 1, N'ZXCZXC', 215, CAST(0x0000A26F00D2A028 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (28, 2, 1, N'Here', 212, CAST(0x0000A26F00D39BFC AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (29, 2, 1, N'Here 2', 215, CAST(0x0000A26F00D50CD6 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (30, 2, 1, N'OP', 212, CAST(0x0000A26F00D51BF4 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (31, 2, 1, N'asdasdasd sdagasg', 215, CAST(0x0000A26F00D5E01D AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (32, 2, 1, N'asdasdasd sdagasg', 215, CAST(0x0000A26F00D636E6 AS DateTime))
INSERT [dbo].[DiscussionB] ([sid], [labid], [groupid], [topic], [student_id], [time]) VALUES (33, 2, 1, N'Hello EV8d', 212, CAST(0x0000A26F00D670F7 AS DateTime))
SET IDENTITY_INSERT [dbo].[DiscussionB] OFF
/****** Object:  Table [dbo].[Status]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[labid] [int] NOT NULL,
	[phase] [nvarchar](10) NOT NULL,
	[studentid] [int] NOT NULL,
	[done] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (10, 2, N'PartA', 204, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (11, 2, N'PartAE', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (12, 2, N'PartB1', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (13, 2, N'PartA', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (14, 2, N'PartB2', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (15, 2, N'PartB2E', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (16, 2, N'Final', 219, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (17, 2, N'PartB1', 212, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (18, 2, N'PartB1', 215, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (19, 2, N'PartB1', 205, 1)
INSERT [dbo].[Status] ([sid], [labid], [phase], [studentid], [done]) VALUES (20, 2, N'PartB1', 208, 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
/****** Object:  Table [dbo].[Questions]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](500) NOT NULL,
	[survryid] [int] NOT NULL,
	[no] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Questions] ON
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (455, N'請摘錄(複製並貼上)透過網路搜尋引擎(例如：google)所搜尋到的相關說法(內容) 至少五個，並標註資料來源(含：作者/網站名稱/網址)；同時記錄下您對該說法的看法(對於該說法的評分依據)，並以0~4分就您的認同強度給予該說法做評分。<br>0分 -------  1分 ------  2分 ------   3分 ------  4分<br>完全不認同&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完全認同', 54, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (456, N'請就老師提供的資料，以及您自己搜尋到的資料，選出您最認同的說法或觀點(可以複製→貼上)，並依下列提示，說明您之所以最認同的理由或依據。', 54, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (457, N'在前列第一大題中，我「最認同的說法」為：', 54, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (458, N'請就您給「最認同的說法」之認同強度評分，說明您最認同的理由與抱持的觀點', 54, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (459, N'這個「最認同的說法」是否相同於您對該爭議問題的立場?', 54, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (460, N'在您搜尋到的各個說法中，您認為各說法之間，存在的是「對或錯」的問題，或者是「優或劣」的問題? 或者「二者皆有」? 或者「難以分辨」? 並請就您的判斷做簡單的說明。', 54, 204)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (461, N'您如何確定您在這個議題上的立場是正確的? 為何不是其他的立場?', 54, 205)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (462, N'您認為為什麼人們對同一件事，可以抱持相當不同的看法?', 54, 206)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (463, N'您覺得為什麼專家們在這個爭議問題上的意見會不一致?', 54, 207)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (480, N'請就老師提供的資料，以及您自己搜尋到的資料，選出您最認同的說法或觀點(可以複製→貼上)，並依下列提示，說明您之所以最認同的理由或依據。', 56, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (481, N'在前列第一大題中，我「最認同的說法」為：', 56, 101)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (482, N'請就您給「最認同的說法」之認同強度評分，說明您最認同的理由與抱持的觀點', 56, 102)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (483, N'這個「最認同的說法」是否相同於您對該爭議問題的立場?', 56, 103)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (484, N'在您搜尋到的各個說法中，您認為各說法之間，存在的是「對或錯」的問題，或者是「優或劣」的問題? 或者「二者皆有」? 或者「難以分辨」? 並請就您的判斷做簡單的說明。', 56, 104)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (485, N'您如何確定您在這個議題上的立場是正確的? 為何不是其他的立場?', 56, 105)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (486, N'您認為為什麼人們對同一件事，可以抱持相當不同的看法?', 56, 106)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (487, N'您覺得為什麼專家們在這個爭議問題上的意見會不一致?', 56, 107)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (488, N'此部分的問題，係用以了解您於面對一般問題時慣常抱持的思考態度與習慣；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 57, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (489, N'我嘗試採取不同的角度去思考一個問題', 57, 101)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (490, N'我嘗試去應用一些新的觀點或概念', 57, 102)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (491, N'在討論的情境中，我試著去尊重他人的觀點。', 57, 103)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (492, N'即使是在面臨複雜的問題時，我仍然設法保持理性和邏輯的思考。', 57, 104)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (493, N'在使用一項訊息之前，我會先思考此一訊息是否可靠。', 57, 105)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (494, N'我嘗試去減正新觀點的價值與可靠性。', 57, 106)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (495, N'在做決定時，我會將情境的影響納入考慮。', 57, 107)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (496, N'在處理問題時，我嘗試先將問題定義清楚。', 57, 108)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (497, N'我嘗試藉由自我質疑的方式，來決定自己的觀點是否具備有足夠的信服力。', 57, 109)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (498, N'在解決問題時，我設法使自己保有最新最完整的相關訊息。', 57, 110)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (499, N'從討論或觀察當中，我很快就能了解他人的感受與想法。', 57, 111)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (500, N'當證據不足時，我會暫緩做判斷。', 57, 112)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (501, N'在解決問題時，我試著去考慮各種不同的可能解決方案。', 57, 113)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (502, N'當有足夠的證據顯示我的觀點有所偏頗時，我會立即修正我的觀點。', 57, 114)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (503, N'在著手解決一個問題之前，我先試著去找出此一問題的發生原因。', 57, 115)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (504, N'對於新近發生的爭議問題，我嘗試去了解來龍去脈。', 57, 116)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (505, N'當他人提出一個論點時，我試著去找出這個論點中索隱含的主要假設。', 57, 117)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (506, N'我嘗試進一步去探索新期的事物或觀點。', 57, 118)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (507, N'在討論的情境中，我會仔細聆聽他人的發言。', 57, 119)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (508, N'在做成決定之前，我試著去預測所有變通方案可能產生的結果。', 57, 120)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (509, N'此部分的問題，係用以了解人際互動時他人言行對您自己思考和行為的影響；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 57, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (510, N'我常常信賴他人的建議，並據此行動', 57, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (511, N'在具爭議性的話題被炒熱爭辯之時，我會是最後一個改變意見的人。', 57, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (512, N'一般來說，我會寧願為了和睦而不堅持已見。', 57, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (513, N'面對政治取向的決定時，我傾向依循家族的傳統', 57, 204)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (514, N'和朋友們在一起時，往往由朋友決定我們一起做哪些事情', 57, 205)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (515, N'具魅力與口才的演說者，能容易地影響我的看法。', 57, 206)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (516, N'我做事較獨立自主，不會輕易順從他人。', 57, 207)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (517, N'如果有人非常有說服力，我傾向更改我的意見，並配合他們。', 57, 208)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (518, N'我不輕易對別人妥協或讓步', 57, 209)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (519, N'當我必須快速做出重要決定時，我傾向依賴他人', 57, 210)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (520, N'相較於找個適合自己的朋友群一起生活，我更喜歡以自己的方式過生活。', 57, 211)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (521, N'與網友在線上對話時，如果我有不同的意見，通常我會毫不猶豫的表達出來。', 57, 212)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (522, N'如果我想在網路上針對話題表達意見，通常我會用匿名方式發表。', 57, 213)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (523, N'為了維繫良好互動關係，對於網友在線上社群(例如：FB)發表的意見，即便我不認同，我也會不吝嗇按個讚。', 57, 214)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (524, N'當我遇到困難問題時，從網路搜尋得到的意見對我的決定向來很重要。', 57, 215)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (525, N'我在網路上搜尋的意見，常常會改變我的決定。', 57, 216)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (526, N'我認為：通常在網路上的共同說法，就是一種正確的主流意見。', 57, 217)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (527, N'在非匿名的網路環境下，我會表達不同於他人的意見與看法。', 57, 218)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (528, N'網路上瀏覽他人對社會議題發表的意見，常常會帶動我認同的思緒。', 57, 219)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (529, N'為了避免被社群網友排斥，通常我會配合大家的想法表達相似的意見。', 57, 220)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (530, N'當我遇到困難問題時，線上社群提供的意見對我的決定向來很重要。', 57, 221)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (531, N'請摘錄(複製並貼上)透過網路搜尋引擎(例如：google)所搜尋到的相關說法(內容) 至少五個，並標註資料來源(含：作者/網站名稱/網址)；同時記錄下您對該說法的看法(對於該說法的評分依據)，並以0~4分就您的認同強度給予該說法做評分。<br>0分 -------  1分 ------  2分 ------   3分 ------  4分<br>完全不認同    +         ++      +++       完全認同', 58, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (532, N'請就老師提供的資料，以及您自己搜尋到的資料，選出您最認同的說法或觀點(可以複製→貼上)，並依下列提示，說明您之所以最認同的理由或依據。', 58, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (533, N'在前列第一大題中，我「最認同的說法」為：', 58, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (534, N'請就您給「最認同的說法」之認同強度評分，說明您最認同的理由與抱持的觀點', 58, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (535, N'這個「最認同的說法」是否相同於您對該爭議問題的立場?', 58, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (536, N'在您搜尋到的各個說法中，您認為各說法之間，存在的是「對或錯」的問題，或者是「優或劣」的問題? 或者「二者皆有」? 或者「難以分辨」? 並請就您的判斷做簡單的說明。', 58, 204)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (537, N'您如何確定您在這個議題上的立場是正確的? 為何不是其他的立場?', 58, 205)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (538, N'您認為為什麼人們對同一件事，可以抱持相當不同的看法?', 58, 206)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (539, N'您覺得為什麼專家們在這個爭議問題上的意見會不一致?', 58, 207)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (540, N'此部分的問題，係用以了解您於面對一般問題時慣常抱持的思考態度與習慣；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 59, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (541, N'我嘗試採取不同的角度去思考一個問題', 59, 101)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (542, N'我嘗試去應用一些新的觀點或概念', 59, 102)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (543, N'在討論的情境中，我試著去尊重他人的觀點。', 59, 103)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (544, N'即使是在面臨複雜的問題時，我仍然設法保持理性和邏輯的思考。', 59, 104)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (545, N'在使用一項訊息之前，我會先思考此一訊息是否可靠。', 59, 105)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (546, N'我嘗試去減正新觀點的價值與可靠性。', 59, 106)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (547, N'此部分的問題，係用以了解人際互動時他人言行對您自己思考和行為的影響；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 59, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (548, N'我常常信賴他人的建議，並據此行動', 59, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (549, N'在具爭議性的話題被炒熱爭辯之時，我會是最後一個改變意見的人。', 59, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (550, N'一般來說，我會寧願為了和睦而不堅持已見。', 59, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (551, N'相較於找個適合自己的朋友群一起生活，我更喜歡以自己的方式過生活。', 59, 300)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (552, N'與網友在線上對話時，如果我有不同的意見，通常我會毫不猶豫的表達出來。', 59, 301)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (553, N'如果我想在網路上針對話題表達意見，通常我會用匿名方式發表。', 59, 302)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (554, N'為了維繫良好互動關係，對於網友在線上社群(例如：FB)發表的意見，即便我不認同，我也會不吝嗇按個讚。', 59, 303)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (555, N'當我遇到困難問題時，從網路搜尋得到的意見對我的決定向來很重要。', 59, 304)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (556, N'此部分的問題，係用以了解您於面對一般問題時慣常抱持的思考態度與習慣；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 60, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (557, N'我嘗試採取不同的角度去思考一個問題', 60, 101)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (558, N'我嘗試去應用一些新的觀點或概念', 60, 102)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (559, N'在討論的情境中，我試著去尊重他人的觀點。', 60, 103)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (560, N'即使是在面臨複雜的問題時，我仍然設法保持理性和邏輯的思考。', 60, 104)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (561, N'在使用一項訊息之前，我會先思考此一訊息是否可靠。', 60, 105)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (562, N'我嘗試去減正新觀點的價值與可靠性。', 60, 106)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (563, N'此部分的問題，係用以了解人際互動時他人言行對您自己思考和行為的影響；敬請您仔細閱讀每一題後，圈選出一個最能描述您現況的答案。阿拉伯數字1, 2, 3, 4, 5, 6 代表的是使用頻率的高低： 數字越高表示使用的頻率越高。', 60, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (564, N'我常常信賴他人的建議，並據此行動', 60, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (565, N'在具爭議性的話題被炒熱爭辯之時，我會是最後一個改變意見的人。', 60, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (566, N'一般來說，我會寧願為了和睦而不堅持已見。', 60, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (567, N'相較於找個適合自己的朋友群一起生活，我更喜歡以自己的方式過生活。', 60, 300)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (568, N'與網友在線上對話時，如果我有不同的意見，通常我會毫不猶豫的表達出來。', 60, 301)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (569, N'如果我想在網路上針對話題表達意見，通常我會用匿名方式發表。', 60, 302)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (570, N'為了維繫良好互動關係，對於網友在線上社群(例如：FB)發表的意見，即便我不認同，我也會不吝嗇按個讚。', 60, 303)
GO
print 'Processed 100 total records'
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (571, N'當我遇到困難問題時，從網路搜尋得到的意見對我的決定向來很重要。', 60, 304)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (600, N'請摘錄(複製並貼上)透過網路搜尋引擎(例如：google)所搜尋到的相關說法(內容) 至少五個，並標註資料來源(含：作者/網站名稱/網址)；同時記錄下您對該說法的看法(對於該說法的評分依據)，並以0~4分就您的認同強度給予該說法做評分。<br>0分 -------  1分 ------  2分 ------   3分 ------  4分<br>完全不認同&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完全認同', 64, 100)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (601, N'請就老師提供的資料，以及您自己搜尋到的資料，選出您最認同的說法或觀點(可以複製→貼上)，並依下列提示，說明您之所以最認同的理由或依據。', 64, 200)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (602, N'在前列第一大題中，我「最認同的說法」為：', 64, 201)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (603, N'請就您給「最認同的說法」之認同強度評分，說明您最認同的理由與抱持的觀點', 64, 202)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (604, N'這個「最認同的說法」是否相同於您對該爭議問題的立場?', 64, 203)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (605, N'在您搜尋到的各個說法中，您認為各說法之間，存在的是「對或錯」的問題，或者是「優或劣」的問題? 或者「二者皆有」? 或者「難以分辨」? 並請就您的判斷做簡單的說明。', 64, 204)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (606, N'您如何確定您在這個議題上的立場是正確的? 為何不是其他的立場?', 64, 205)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (607, N'您認為為什麼人們對同一件事，可以抱持相當不同的看法?', 64, 206)
INSERT [dbo].[Questions] ([sid], [question], [survryid], [no]) VALUES (608, N'您覺得為什麼專家們在這個爭議問題上的意見會不一致?', 64, 207)
SET IDENTITY_INSERT [dbo].[Questions] OFF
/****** Object:  Table [dbo].[DiscussionA]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscussionA](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[labid] [int] NOT NULL,
	[groupid] [int] NOT NULL,
	[topic] [nvarchar](500) NOT NULL,
	[topicid] [int] NULL,
	[student_id] [int] NOT NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_DiscussionA] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionA] ON [dbo].[DiscussionA] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscussionA] ON
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (20, 2, 1, N'Option1', NULL, 205, CAST(0x0000A27B00B7968E AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (21, 2, 1, N'OKOK', 20, 205, CAST(0x0000A27B00B982BB AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (22, 2, 1, N'Test', 20, 205, CAST(0x0000A27B00BB2D15 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (23, 2, 1, N'YES', 20, 205, CAST(0x0000A27B00BB3FF1 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (24, 2, 1, N'IOO', 20, 205, CAST(0x0000A27B00BB5EFD AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (25, 2, 1, N'Yes12', 20, 205, CAST(0x0000A27B00BBB690 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (26, 2, 1, N'UUU', 20, 205, CAST(0x0000A27B00BBC619 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (27, 2, 1, N'UIO', 20, 205, CAST(0x0000A27B00BBF043 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (28, 2, 1, N'Testing2', NULL, 205, CAST(0x0000A27B00BD0B39 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (29, 2, 1, N'OK', 28, 205, CAST(0x0000A27B00BD12E6 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (30, 2, 1, N'OKY', 28, 205, CAST(0x0000A27B00BD1F4E AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (31, 2, 1, N'OKI', 20, 205, CAST(0x0000A27B00BD349E AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (32, 2, 1, N'OKI', 28, 205, CAST(0x0000A27B00BD3532 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (33, 2, 1, N'NGHH', 28, 205, CAST(0x0000A27B00BD4777 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (34, 2, 1, N'NGHH', 20, 205, CAST(0x0000A27B00BD480F AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (35, 2, 1, N'HAHA', NULL, 208, CAST(0x0000A27B00BE556F AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (36, 2, 1, N'YES I Agree', 28, 208, CAST(0x0000A27B00BE63FF AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (37, 2, 1, N'HAHAH', 28, 208, CAST(0x0000A27B00BE6ED9 AS DateTime))
INSERT [dbo].[DiscussionA] ([sid], [labid], [groupid], [topic], [topicid], [student_id], [time]) VALUES (38, 2, 1, N'HAHAH', 35, 208, CAST(0x0000A27B00BE6F72 AS DateTime))
SET IDENTITY_INSERT [dbo].[DiscussionA] OFF
/****** Object:  Table [dbo].[Answers]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[labid] [int] NOT NULL,
	[surveyid] [int] NOT NULL,
	[qid] [int] NOT NULL,
	[studentid] [int] NOT NULL,
	[contents] [nvarchar](1000) NOT NULL,
	[phase] [nvarchar](10) NOT NULL,
	[opinions] [nvarchar](1000) NULL,
	[links] [nvarchar](1000) NULL,
	[rank] [int] NULL,
	[optionid] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Answers] ON [dbo].[Answers] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answers] ON
INSERT [dbo].[Answers] ([sid], [labid], [surveyid], [qid], [studentid], [contents], [phase], [opinions], [links], [rank], [optionid]) VALUES (1, 2, 58, 531, 204, N'XC', N'PartA', N'ZXC', N'XZC', 1, 1)
SET IDENTITY_INSERT [dbo].[Answers] OFF
/****** Object:  Table [dbo].[ScaleAnswers]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScaleAnswers](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[labid] [int] NOT NULL,
	[surveyid] [int] NOT NULL,
	[qid] [int] NOT NULL,
	[studentid] [int] NOT NULL,
	[rank] [int] NULL,
 CONSTRAINT [PK_ScaleAnswers] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ScaleAnswers] ON
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (62, 2, 59, 541, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (63, 2, 59, 542, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (64, 2, 59, 543, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (65, 2, 59, 544, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (66, 2, 59, 545, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (67, 2, 59, 546, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (68, 2, 59, 548, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (69, 2, 59, 549, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (70, 2, 59, 550, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (71, 2, 60, 557, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (72, 2, 60, 558, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (73, 2, 60, 559, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (74, 2, 60, 560, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (75, 2, 60, 561, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (76, 2, 60, 562, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (77, 2, 60, 564, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (78, 2, 60, 565, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (79, 2, 60, 566, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (80, 2, 57, 489, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (81, 2, 57, 490, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (82, 2, 57, 491, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (83, 2, 57, 492, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (84, 2, 57, 493, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (85, 2, 57, 494, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (86, 2, 57, 495, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (87, 2, 57, 496, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (88, 2, 57, 497, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (89, 2, 57, 498, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (90, 2, 57, 499, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (91, 2, 57, 500, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (92, 2, 57, 501, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (93, 2, 57, 502, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (94, 2, 57, 503, 219, 2)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (95, 2, 57, 504, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (96, 2, 57, 505, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (97, 2, 57, 506, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (98, 2, 57, 507, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (99, 2, 57, 508, 219, 1)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (100, 2, 57, 510, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (101, 2, 57, 511, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (102, 2, 57, 512, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (103, 2, 57, 513, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (104, 2, 57, 514, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (105, 2, 57, 515, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (106, 2, 57, 516, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (107, 2, 57, 517, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (108, 2, 57, 518, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (109, 2, 57, 519, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (110, 2, 57, 520, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (111, 2, 57, 521, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (112, 2, 57, 522, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (113, 2, 57, 523, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (114, 2, 57, 524, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (115, 2, 57, 525, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (116, 2, 57, 526, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (117, 2, 57, 527, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (118, 2, 57, 528, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (119, 2, 57, 529, 219, 3)
INSERT [dbo].[ScaleAnswers] ([sid], [labid], [surveyid], [qid], [studentid], [rank]) VALUES (120, 2, 57, 530, 219, 3)
SET IDENTITY_INSERT [dbo].[ScaleAnswers] OFF
/****** Object:  Table [dbo].[DiscussionAFeedback]    Script Date: 11/19/2013 12:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscussionAFeedback](
	[discuss_id] [int] NOT NULL,
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[gfeedback] [nvarchar](1) NULL,
	[qfeedback] [nvarchar](1) NULL,
 CONSTRAINT [PK_DiscussionAFeedback] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscussionAFeedback] ON
INSERT [dbo].[DiscussionAFeedback] ([discuss_id], [sid], [student_id], [gfeedback], [qfeedback]) VALUES (20, 1, 205, N'Y', N'Y')
SET IDENTITY_INSERT [dbo].[DiscussionAFeedback] OFF
/****** Object:  ForeignKey [FK_Users_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Labs]
GO
/****** Object:  ForeignKey [FK_Survey_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Users]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Users]
GO
/****** Object:  ForeignKey [FK_Status_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Labs]
GO
/****** Object:  ForeignKey [FK_Status_Users]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Users]
GO
/****** Object:  ForeignKey [FK_Questions_Questions]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Questions] FOREIGN KEY([survryid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Questions]
GO
/****** Object:  ForeignKey [FK_DiscussionA_DiscussionA]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_DiscussionA] FOREIGN KEY([topicid])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_DiscussionA]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Users]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Users]
GO
/****** Object:  ForeignKey [FK_Answers_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Labs]
GO
/****** Object:  ForeignKey [FK_Answers_Questions]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  ForeignKey [FK_Answers_Survey]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Survey]
GO
/****** Object:  ForeignKey [FK_Answers_Users]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Labs]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Labs]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Questions]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Questions]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Survey]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Survey]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Users]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionAFeedback_DiscussionA]    Script Date: 11/19/2013 12:45:36 ******/
ALTER TABLE [dbo].[DiscussionAFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionAFeedback_DiscussionA] FOREIGN KEY([discuss_id])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionAFeedback] CHECK CONSTRAINT [FK_DiscussionAFeedback_DiscussionA]
GO
