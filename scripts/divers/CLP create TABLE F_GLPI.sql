
USE [GLPI]
GO

/****** Object:  Table [dbo].[F_GLPI]    Script Date: 08/02/2019 17:29:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[priorité] [int] NULL
) ON [PRIMARY]
GO

USE [GLPI]
GO

/****** Object:  Index [idx_glpi_lookup]    Script Date: 08/02/2019 17:29:55 ******/
CREATE NONCLUSTERED INDEX [idx_glpi_lookup] ON [dbo].[F_GLPI]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE F_GLPI ADD entity VARCHAR(255)
ALTER TABLE F_GLPI ADD TECH_DATE_CREA DATETIME
;
ALTER TABLE F_GLPI ADD TECH_DATE_MOD DATETIME
;