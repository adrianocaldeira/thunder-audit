GO
/****** Object:  ForeignKey [FK_AuditClassProperties_AuditClasses]    Script Date: 01/19/2015 19:04:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AuditClassProperties_AuditClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]'))
ALTER TABLE [dbo].[AuditClassProperties] DROP CONSTRAINT [FK_AuditClassProperties_AuditClasses]
GO
/****** Object:  ForeignKey [FK_Audit_AuditClass]    Script Date: 01/19/2015 19:04:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] DROP CONSTRAINT [FK_Audit_AuditClass]
GO
/****** Object:  ForeignKey [FK_Audit_AuditType]    Script Date: 01/19/2015 19:04:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] DROP CONSTRAINT [FK_Audit_AuditType]
GO
/****** Object:  Table [dbo].[AuditClassProperties]    Script Date: 01/19/2015 19:04:27 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AuditClassProperties_AuditClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]'))
ALTER TABLE [dbo].[AuditClassProperties] DROP CONSTRAINT [FK_AuditClassProperties_AuditClasses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]') AND type in (N'U'))
DROP TABLE [dbo].[AuditClassProperties]
GO
/****** Object:  Table [dbo].[Audits]    Script Date: 01/19/2015 19:04:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] DROP CONSTRAINT [FK_Audit_AuditClass]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] DROP CONSTRAINT [FK_Audit_AuditType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND type in (N'U'))
DROP TABLE [dbo].[Audits]
GO
/****** Object:  Table [dbo].[AuditTypes]    Script Date: 01/19/2015 19:04:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditTypes]') AND type in (N'U'))
DROP TABLE [dbo].[AuditTypes]
GO
/****** Object:  Table [dbo].[AuditClassPropertyChanges]    Script Date: 01/19/2015 19:04:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassPropertyChanges]') AND type in (N'U'))
DROP TABLE [dbo].[AuditClassPropertyChanges]
GO
/****** Object:  Table [dbo].[AuditClasses]    Script Date: 01/19/2015 19:04:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClasses]') AND type in (N'U'))
DROP TABLE [dbo].[AuditClasses]
GO
/****** Object:  Table [dbo].[AuditClasses]    Script Date: 01/19/2015 19:04:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AuditClasses]') AND name = N'Name_AuditClasses')
CREATE NONCLUSTERED INDEX [Name_AuditClasses] ON [dbo].[AuditClasses] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditClassPropertyChanges]    Script Date: 01/19/2015 19:04:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassPropertyChanges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditClassPropertyChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditId] [bigint] NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[OldValue] [nvarchar](max) NOT NULL,
	[NewValue] [nvarchar](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditClassPropertyChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassPropertyChanges]') AND name = N'AuditId_AuditClassPropertyChanges')
CREATE NONCLUSTERED INDEX [AuditId_AuditClassPropertyChanges] ON [dbo].[AuditClassPropertyChanges] 
(
	[AuditId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassPropertyChanges]') AND name = N'PropertyId_AuditClassPropertyChanges')
CREATE NONCLUSTERED INDEX [PropertyId_AuditClassPropertyChanges] ON [dbo].[AuditClassPropertyChanges] 
(
	[PropertyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTypes]    Script Date: 01/19/2015 19:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditTypes](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[AuditTypes] ON
INSERT [dbo].[AuditTypes] ([Id], [Name], [Created], [Updated]) VALUES (1, N'Insert', CAST(0x0000A42501333221 AS DateTime), CAST(0x0000A42501333221 AS DateTime))
INSERT [dbo].[AuditTypes] ([Id], [Name], [Created], [Updated]) VALUES (2, N'Update', CAST(0x0000A42501333221 AS DateTime), CAST(0x0000A42501333221 AS DateTime))
INSERT [dbo].[AuditTypes] ([Id], [Name], [Created], [Updated]) VALUES (3, N'Delete', CAST(0x0000A42501333221 AS DateTime), CAST(0x0000A42501333221 AS DateTime))
SET IDENTITY_INSERT [dbo].[AuditTypes] OFF
/****** Object:  Table [dbo].[Audits]    Script Date: 01/19/2015 19:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Audits](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeId] [smallint] NOT NULL,
	[ClassId] [int] NOT NULL,
	[Reference] [nvarchar](100) NOT NULL,
	[GroupReference] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[AuditUser] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_Audits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND name = N'AuditUser_Audits')
CREATE NONCLUSTERED INDEX [AuditUser_Audits] ON [dbo].[Audits] 
(
	[AuditUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND name = N'ClassId_Audits')
CREATE NONCLUSTERED INDEX [ClassId_Audits] ON [dbo].[Audits] 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND name = N'GroupReference_Audits')
CREATE NONCLUSTERED INDEX [GroupReference_Audits] ON [dbo].[Audits] 
(
	[GroupReference] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND name = N'Reference_Audits')
CREATE NONCLUSTERED INDEX [Reference_Audits] ON [dbo].[Audits] 
(
	[Reference] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Audits]') AND name = N'TypeId_Audits')
CREATE NONCLUSTERED INDEX [TypeId_Audits] ON [dbo].[Audits] 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditClassProperties]    Script Date: 01/19/2015 19:04:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditClassProperties](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]') AND name = N'ClassId_AuditClassProperties')
CREATE NONCLUSTERED INDEX [ClassId_AuditClassProperties] ON [dbo].[AuditClassProperties] 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]') AND name = N'Name_AuditProperties')
CREATE NONCLUSTERED INDEX [Name_AuditProperties] ON [dbo].[AuditClassProperties] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_AuditClassProperties_AuditClasses]    Script Date: 01/19/2015 19:04:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AuditClassProperties_AuditClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]'))
ALTER TABLE [dbo].[AuditClassProperties]  WITH CHECK ADD  CONSTRAINT [FK_AuditClassProperties_AuditClasses] FOREIGN KEY([ClassId])
REFERENCES [dbo].[AuditClasses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AuditClassProperties_AuditClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[AuditClassProperties]'))
ALTER TABLE [dbo].[AuditClassProperties] CHECK CONSTRAINT [FK_AuditClassProperties_AuditClasses]
GO
/****** Object:  ForeignKey [FK_Audit_AuditClass]    Script Date: 01/19/2015 19:04:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits]  WITH CHECK ADD  CONSTRAINT [FK_Audit_AuditClass] FOREIGN KEY([ClassId])
REFERENCES [dbo].[AuditClasses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditClass]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] CHECK CONSTRAINT [FK_Audit_AuditClass]
GO
/****** Object:  ForeignKey [FK_Audit_AuditType]    Script Date: 01/19/2015 19:04:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits]  WITH CHECK ADD  CONSTRAINT [FK_Audit_AuditType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[AuditTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Audit_AuditType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Audits]'))
ALTER TABLE [dbo].[Audits] CHECK CONSTRAINT [FK_Audit_AuditType]
GO
