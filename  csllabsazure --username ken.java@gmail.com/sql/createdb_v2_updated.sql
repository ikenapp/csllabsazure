USE [LabsDB]
GO
/****** Object:  Table [dbo].[DiscussionB]    Script Date: 11/20/2013 08:57:50 ******/
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
	[num] [int] NULL,
 CONSTRAINT [PK_DiscussionB] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscussionA]    Script Date: 11/20/2013 08:57:50 ******/
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
	[num] [int] NULL,
 CONSTRAINT [PK_DiscussionA] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 11/20/2013 08:57:50 ******/
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
	[attributes] [nvarchar](50) NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscussionAFeedback]    Script Date: 11/20/2013 08:57:50 ******/
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
	[num] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Answers_Labs]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Labs]
GO
/****** Object:  ForeignKey [FK_Answers_Questions]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  ForeignKey [FK_Answers_Survey]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Survey]
GO
/****** Object:  ForeignKey [FK_Answers_Users]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionA_DiscussionA]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_DiscussionA] FOREIGN KEY([topicid])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_DiscussionA]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Labs]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Users]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionAFeedback_DiscussionA]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionAFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionAFeedback_DiscussionA] FOREIGN KEY([discuss_id])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionAFeedback] CHECK CONSTRAINT [FK_DiscussionAFeedback_DiscussionA]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Labs]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Users]    Script Date: 11/20/2013 08:57:50 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Users]
GO
