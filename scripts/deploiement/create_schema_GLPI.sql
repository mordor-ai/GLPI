USE [GLPI]
GO
/****** Object:  Table [dbo].[D_CALENDRIER]    Script Date: 15/02/2019 09:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_CALENDRIER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_CALENDRIER](
	[CAL_KEY] [int] NULL,
	[CAL_DT_JOUR] [datetime] NULL,
	[CAL_ANNEE] [int] NULL,
	[CAL_TRIM] [int] NULL,
	[CAL_MOIS] [varchar](2) NULL,
	[CAL_SEM_ISO] [varchar](2) NULL,
	[CAL_ANNEE_MOIS] [varchar](6) NULL,
	[CAL_ANNEE_SEM] [varchar](6) NULL,
	[CAL_JOUR_LIB] [varchar](10) NULL,
	[CAL_MOIS_LIB] [varchar](10) NULL,
	[CAL_NO_JOUR_AN] [int] NULL,
	[CAL_NO_JOUR_MOIS] [int] NULL,
	[CAL_NO_JOUR_SEMAINE] [int] NULL,
	[CAL_NB_JOUR_MOIS] [int] NULL,
	[CAL_FISC_ANNEE] [int] NULL,
	[CAL_FISC_TRIM] [int] NULL,
	[CAL_FISC_MOIS] [varchar](2) NULL,
	[CAL_FISC_ANNEE_MOIS] [varchar](6) NULL,
	[CAL_FISC_ANNEE_SEM] [varchar](6) NULL,
	[CAL_FISC_NO_JOUR_AN] [int] NULL,
	[TECH_DATE_CREA] [datetime] NULL,
	[TECH_DATE_MOD] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[D_PRIORITE]    Script Date: 15/02/2019 09:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_PRIORITE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_PRIORITE](
	[PRIO_ID] [int] NOT NULL,
	[PRIO_LBL] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[D_USERS]    Script Date: 15/02/2019 09:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[D_USERS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[D_USERS](
	[ID] [int] NULL,
	[name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[realname] [varchar](255) NULL,
	[firstname] [varchar](255) NULL,
	[active] [int] NULL,
	[last_login] [datetime] NULL,
	[date_mod] [datetime] NULL,
	[deleted] [int] NULL,
	[FK_profiles] [int] NULL,
	[FK_entities] [int] NULL,
	[title] [int] NULL,
	[type] [int] NULL,
	[dateformat] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[F_GLPI]    Script Date: 15/02/2019 09:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_GLPI]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[F_GLPI](
	[ID] [int] NULL,
	[CAL_KEY_CREATE] [int] NULL,
	[CAL_KEY_CLOSE] [int] NULL,
	[CAL_KEY_MODIFICATION] [int] NULL,
	[LINK] [varchar](500) NULL,
	[name] [varchar](500) NULL,
	[group_ID] [int] NULL,
	[group_name] [varchar](500) NULL,
	[status_FR] [varchar](500) NULL,
	[status_EN] [varchar](500) NULL,
	[categrory_ID] [int] NULL,
	[category_name] [varchar](500) NULL,
	[category_completename] [varchar](500) NULL,
	[assign] [int] NULL,
	[firstname] [varchar](500) NULL,
	[assigned_login] [varchar](500) NULL,
	[assigned_email] [varchar](500) NULL,
	[assigned_name] [varchar](500) NULL,
	[author_login] [varchar](500) NULL,
	[author_email] [varchar](500) NULL,
	[author_name] [varchar](500) NULL,
	[author_group] [varchar](500) NULL,
	[first_1000_content] [varchar](1000) NULL,
	[realtime] [decimal](20, 4) NULL,
	[category] [int] NULL,
	[cost_time] [decimal](20, 4) NULL,
	[cost_fixed] [decimal](20, 4) NULL,
	[cost_material] [decimal](20, 4) NULL,
	[priorité] [int] NULL,
	[entity] [varchar](255) NULL,
	[TECH_DATE_CREA] [datetime] NULL,
	[TECH_DATE_MOD] [datetime] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Index [idx_D_USERS_lookup]    Script Date: 15/02/2019 09:53:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[D_USERS]') AND name = N'idx_D_USERS_lookup')
CREATE NONCLUSTERED INDEX [idx_D_USERS_lookup] ON [dbo].[D_USERS]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_glpi_lookup]    Script Date: 15/02/2019 09:53:41 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[F_GLPI]') AND name = N'idx_glpi_lookup')
CREATE NONCLUSTERED INDEX [idx_glpi_lookup] ON [dbo].[F_GLPI]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
