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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_Labs] ON [dbo].[Labs] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_1] ON [dbo].[Users] 
(
	[groupid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_2] ON [dbo].[Users] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_3] ON [dbo].[Users] 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_4] ON [dbo].[Users] 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_5] ON [dbo].[Users] 
(
	[nickname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Users_6] ON [dbo].[Users] 
(
	[passsword] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_Survey] ON [dbo].[Survey] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Survey_1] ON [dbo].[Survey] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Survey_2] ON [dbo].[Survey] 
(
	[phase] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Survey_3] ON [dbo].[Survey] 
(
	[surveyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[DiscussionB]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB] ON [dbo].[DiscussionB] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB_1] ON [dbo].[DiscussionB] 
(
	[groupid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB_2] ON [dbo].[DiscussionB] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB_3] ON [dbo].[DiscussionB] 
(
	[num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB_4] ON [dbo].[DiscussionB] 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionB_5] ON [dbo].[DiscussionB] 
(
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_Questions] ON [dbo].[Questions] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Questions_1] ON [dbo].[Questions] 
(
	[survryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Questions_2] ON [dbo].[Questions] 
(
	[no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[DiscussionA]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionA] ON [dbo].[DiscussionA] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_GroupId] ON [dbo].[DiscussionA] 
(
	[groupid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_LabeId] ON [dbo].[DiscussionA] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_NUM] ON [dbo].[DiscussionA] 
(
	[num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_Time] ON [dbo].[DiscussionA] 
(
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_Answers] ON [dbo].[Answers] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_LabId] ON [dbo].[Answers] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_SurveyID] ON [dbo].[Answers] 
(
	[surveyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[ScaleAnswers]    Script Date: 11/20/2013 09:37:04 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_ScaleAnswers] ON [dbo].[ScaleAnswers] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_ScaleAnswers_1] ON [dbo].[ScaleAnswers] 
(
	[labid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_ScaleAnswers_2] ON [dbo].[ScaleAnswers] 
(
	[qid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_ScaleAnswers_3] ON [dbo].[ScaleAnswers] 
(
	[studentid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_ScaleAnswers_4] ON [dbo].[ScaleAnswers] 
(
	[surveyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  Table [dbo].[DiscussionAFeedback]    Script Date: 11/20/2013 09:37:04 ******/
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
	[num] [int] NULL,
 CONSTRAINT [PK_DiscussionAFeedback] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussId] ON [dbo].[DiscussionAFeedback] 
(
	[discuss_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionAFeedback] ON [dbo].[DiscussionAFeedback] 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_DiscussionAFeedback_2] ON [dbo].[DiscussionAFeedback] 
(
	[num] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
CREATE NONCLUSTERED INDEX [IX_StudentId] ON [dbo].[DiscussionAFeedback] 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
GO
/****** Object:  ForeignKey [FK_Users_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Labs]
GO
/****** Object:  ForeignKey [FK_Survey_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionB_Users]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionB]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionB_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionB] CHECK CONSTRAINT [FK_DiscussionB_Users]
GO
/****** Object:  ForeignKey [FK_Status_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Labs]
GO
/****** Object:  ForeignKey [FK_Status_Users]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Users]
GO
/****** Object:  ForeignKey [FK_Questions_Questions]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Questions] FOREIGN KEY([survryid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Questions]
GO
/****** Object:  ForeignKey [FK_DiscussionA_DiscussionA]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_DiscussionA] FOREIGN KEY([topicid])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_DiscussionA]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Labs]
GO
/****** Object:  ForeignKey [FK_DiscussionA_Users]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionA]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionA_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[DiscussionA] CHECK CONSTRAINT [FK_DiscussionA_Users]
GO
/****** Object:  ForeignKey [FK_Answers_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Labs]
GO
/****** Object:  ForeignKey [FK_Answers_Questions]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
/****** Object:  ForeignKey [FK_Answers_Survey]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Survey]
GO
/****** Object:  ForeignKey [FK_Answers_Users]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Labs]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Labs] FOREIGN KEY([labid])
REFERENCES [dbo].[Labs] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Labs]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Questions]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Questions] FOREIGN KEY([qid])
REFERENCES [dbo].[Questions] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Questions]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Survey]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Survey] FOREIGN KEY([surveyid])
REFERENCES [dbo].[Survey] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Survey]
GO
/****** Object:  ForeignKey [FK_ScaleAnswers_Users]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[ScaleAnswers]  WITH CHECK ADD  CONSTRAINT [FK_ScaleAnswers_Users] FOREIGN KEY([studentid])
REFERENCES [dbo].[Users] ([sid])
GO
ALTER TABLE [dbo].[ScaleAnswers] CHECK CONSTRAINT [FK_ScaleAnswers_Users]
GO
/****** Object:  ForeignKey [FK_DiscussionAFeedback_DiscussionA]    Script Date: 11/20/2013 09:37:04 ******/
ALTER TABLE [dbo].[DiscussionAFeedback]  WITH CHECK ADD  CONSTRAINT [FK_DiscussionAFeedback_DiscussionA] FOREIGN KEY([discuss_id])
REFERENCES [dbo].[DiscussionA] ([sid])
GO
ALTER TABLE [dbo].[DiscussionAFeedback] CHECK CONSTRAINT [FK_DiscussionAFeedback_DiscussionA]
GO
