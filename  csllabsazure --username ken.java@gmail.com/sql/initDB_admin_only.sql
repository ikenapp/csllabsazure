SET IDENTITY_INSERT [dbo].[Labs] ON
INSERT [dbo].[Labs] ([sid], [name], [desc], [currentPhase], [begin], [end]) VALUES (1, N'Administrator', N'SysAsmin', N'INIT', CAST(0xA5370B00 AS Date), CAST(0xAB410B00 AS Date))
SET IDENTITY_INSERT [dbo].[Labs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([sid], [name], [nickname], [passsword], [birthday], [age], [group], [school], [dept], [labid], [student_id], [groupid], [gender]) VALUES (3, N'admin', N'asd', N'1234', CAST(0xB9370B00 AS Date), 40, N'admin', N'admin', N'ICE', 1, N'admin', 0, N'F')
SET IDENTITY_INSERT [dbo].[Users] OFF
s