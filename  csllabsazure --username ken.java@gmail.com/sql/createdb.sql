USE [master]
GO
/****** Object:  Database [LabsDB]    Script Date: 10/21/2013 21:05:08 ******/
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
/****** Object:  Table [dbo].[Labs]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  Table [dbo].[Survey]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 10/21/2013 21:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](250) NOT NULL,
	[survryid] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscussionB]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  Table [dbo].[DiscussionA]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 10/21/2013 21:05:09 ******/
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
	[answer] [nvarchar](500) NOT NULL,
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
/****** Object:  Table [dbo].[DiscussionAFeedback]    Script Date: 10/21/2013 21:05:09 ******/
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
/****** Object:  ForeignKey [FK_Users_Labs]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Labs]
GO
/****** Object:  ForeignKey [FK_Survey_Labs]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Labs]
GO
/****** Object:  ForeignKey [FK_Questions_Questions]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Questions] FOREIGN KEY([survryid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Questions]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Labs]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Users]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionA_DiscussionA]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_DiscussionA] FOREIGN KEY([topicid])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_DiscussionA]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Labs]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Users]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Users]
GO
/****** Object:  ForeignKey [FK_Answers_Labs]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Labs] FOREIGN KEY([sid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Labs]
GO
/****** Object:  ForeignKey [FK_Answers_Questions]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  ForeignKey [FK_Answers_Survey]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Survey]
GO
/****** Object:  ForeignKey [FK_Answers_Users]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([sid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionAFeedback_DiscussionA]    Script Date: 10/21/2013 21:05:09 ******/
ALTER TABLE [dbo].[DiscussionAFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionAFeedback_DiscussionA] FOREIGN KEY([discuss_id])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionAFeedback] CHECK CONSTRAINT [FK_DiscussionAFeedback_DiscussionA]
GO
