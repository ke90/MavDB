-- Löscht die Datenbank MAV, falls sie existiert
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'MAV')
BEGIN
    ALTER DATABASE MAV SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MAV;
    PRINT 'Datenbank MAV gelöscht.';
END
GO

-- Erstellt die Datenbank MAV neu
CREATE DATABASE MAV;
PRINT 'Datenbank MAV erfolgreich erstellt.';
GO

USE [MAV]
GO
/****** Object:  Table [dbo].[schlagwort_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schlagwort_zuordnung_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[schlagwort_id] [int] NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[schlagwort_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schlagwort_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[schlagwort_id] [int] NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_schlagwort_zuordnung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[schlagwort_zuordnung_rev])
)
GO
/****** Object:  Table [dbo].[vorgesetzter_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vorgesetzter_zuordnung_rev](
	[id] [int] NOT NULL,
	[m_grunddaten_id] [int] NULL,
	[v_id] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[vorgesetzter_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vorgesetzter_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_grunddaten_id] [int] NULL,
	[v_id] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_vorgesetzter_zuordnung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[vorgesetzter_zuordnung_rev])
)
GO
/****** Object:  Table [dbo].[m_oe_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_oe_zuordnung_rev](
	[id] [int] NOT NULL,
	[mitarbeiter_id] [int] NULL,
	[o_id] [int] NULL,
	[pos_id] [int] NULL,
	[haupt_oe] [bit] NULL,
	[beginn] [datetime2](7) NULL,
	[ende] [datetime2](7) NULL,
	[timestamp] [datetime] NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[m_oe_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_oe_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mitarbeiter_id] [int] NULL,
	[o_id] [int] NULL,
	[pos_id] [int] NULL,
	[haupt_oe] [bit] NULL,
	[beginn] [datetime2](7) NULL,
	[ende] [datetime2](7) NULL,
	[timestamp]  AS (getdate()),
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_m_oe_zuordnung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[m_oe_zuordnung_rev])
)
GO
/****** Object:  Table [dbo].[mitarbeiter_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mitarbeiter_rev](
	[id] [int] NOT NULL,
	[m_id] [varchar](50) NULL,
	[m_funktion_id] [int] NULL,
	[m_vorname] [varchar](255) NULL,
	[m_nachname] [varchar](255) NULL,
	[anrede] [varchar](50) NULL,
	[m_namenszusatz] [varchar](255) NULL,
	[m_geburtsdatum] [date] NULL,
	[m_geschlecht] [varchar](255) NULL,
	[m_email] [varchar](255) NULL,
	[m_tel] [varchar](255) NULL,
	[m_fax] [varchar](255) NULL,
	[m_login] [varchar](255) NULL,
	[21c_kennung] [varchar](50) NULL,
	[id_old] [int] NULL,
	[eintrittsdatum] [date] NULL,
	[enddatum] [date] NULL,
	[abwesenheitsstatus] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL,
	[werberkuerzel] [varchar](255) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[mitarbeiter]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mitarbeiter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [varchar](50) NULL,
	[m_funktion_id] [int] NULL,
	[m_vorname] [varchar](255) NULL,
	[m_nachname] [varchar](255) NULL,
	[anrede] [varchar](50) NULL,
	[m_namenszusatz] [varchar](255) NULL,
	[m_geburtsdatum] [date] NULL,
	[m_geschlecht] [varchar](255) NULL,
	[m_email] [varchar](255) NULL,
	[m_tel] [varchar](255) NULL,
	[m_fax] [varchar](255) NULL,
	[m_login] [varchar](255) NULL,
	[21c_kennung] [varchar](50) NULL,
	[id_old] [int] NULL,
	[eintrittsdatum] [date] NULL,
	[enddatum] [date] NULL,
	[abwesenheitsstatus] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
	[werberkuerzel] [varchar](255) NULL,
 CONSTRAINT [PK_mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[mitarbeiter_rev])
)
GO
/****** Object:  Table [dbo].[orga_einheit_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orga_einheit_rev](
	[id] [int] NOT NULL,
	[oe] [varchar](255) NULL,
	[typ_id] [int] NULL,
	[bezeichnung_id] [int] NULL,
	[aufgabengebiet_id] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL,
	[team_id_old] [int] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[orga_einheit]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orga_einheit](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oe] [varchar](255) NULL,
	[typ_id] [int] NULL,
	[bezeichnung_id] [int] NULL,
	[aufgabengebiet_id] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
	[team_id_old] [int] NULL,
 CONSTRAINT [PK_orga_einheit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[orga_einheit_rev])
)
GO
/****** Object:  Table [dbo].[leitet_oe_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leitet_oe_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[oe_id] [int] NOT NULL,
	[erstellt_am1] [datetime2](0) NOT NULL,
	[bearbeitet_am1] [datetime2](0) NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[leitet_oe]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leitet_oe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[oe_id] [int] NOT NULL,
	[erstellt_am1] [datetime2](0) NOT NULL,
	[bearbeitet_am1] [datetime2](0) NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_leitet_oe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[leitet_oe_rev])
)
GO
/****** Object:  View [dbo].[mitarbeiter_vorgesetzter_zo]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[mitarbeiter_vorgesetzter_zo]
AS
SELECT        zo.mitarbeiter_id, m.m_vorname, m.m_nachname, zo.o_id, oe.oe, vg.m_vorname AS v_vorname, vg.m_nachname AS v_nachname
FROM            dbo.m_oe_zuordnung AS zo INNER JOIN
                         dbo.orga_einheit AS oe ON zo.o_id = oe.id INNER JOIN
                         dbo.leitet_oe AS loe ON oe.id = loe.oe_id INNER JOIN
                         dbo.mitarbeiter AS vg ON loe.m_id = vg.id INNER JOIN
                         dbo.mitarbeiter AS m ON zo.mitarbeiter_id = m.id
GO
/****** Object:  Table [dbo].[interne_funktionsbezeichnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interne_funktionsbezeichnung_rev](
	[id] [int] NOT NULL,
	[funktionsbezeichnung] [varchar](255) NULL,
	[funktionsbezeichnung_m] [varchar](255) NULL,
	[funktionsbezeichnung_w] [varchar](255) NULL,
	[funktionsbezeichnung_g] [varchar](255) NULL,
	[int_id_old] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[interne_funktionsbezeichnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interne_funktionsbezeichnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[funktionsbezeichnung] [varchar](255) NULL,
	[funktionsbezeichnung_m] [varchar](255) NULL,
	[funktionsbezeichnung_w] [varchar](255) NULL,
	[funktionsbezeichnung_g] [varchar](255) NULL,
	[int_id_old] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_interne_funktionsbezeichnung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[interne_funktionsbezeichnung_rev])
)
GO
/****** Object:  View [dbo].[oe_nur_leiter]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[oe_nur_leiter] AS
SELECT         CONCAT('o_', CAST(dbo.m_oe_zuordnung.o_id AS varchar))  AS parentId, CONCAT('m_', CAST(dbo.m_oe_zuordnung.mitarbeiter_id AS varchar))  AS id, dbo.m_oe_zuordnung.haupt_oe, CASE WHEN leitet_oe.id IS NULL 
                         THEN 0 ELSE 1 END AS is_leiter,  CONCAT(dbo.mitarbeiter.m_vorname, ' ', dbo.mitarbeiter.m_nachname)  AS name, 
                         CASE WHEN mitarbeiter.anrede = 'Herrn' THEN ifb.[funktionsbezeichnung_m] WHEN mitarbeiter.anrede = 'Frau' THEN ifb.[funktionsbezeichnung_w] ELSE ifb.[funktionsbezeichnung_g] END AS funktionsbezeichnung
FROM            dbo.m_oe_zuordnung INNER JOIN
                         dbo.mitarbeiter ON dbo.mitarbeiter.id = dbo.m_oe_zuordnung.mitarbeiter_id LEFT OUTER JOIN
                         dbo.leitet_oe ON dbo.m_oe_zuordnung.mitarbeiter_id = dbo.leitet_oe.m_id AND dbo.m_oe_zuordnung.o_id = dbo.leitet_oe.oe_id LEFT OUTER JOIN
                         dbo.interne_funktionsbezeichnung AS ifb ON ifb.id = dbo.mitarbeiter.m_funktion_id
WHERE        (dbo.leitet_oe.m_id IS NOT NULL)
GO
/****** Object:  Table [dbo].[aufgabengebiet_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aufgabengebiet_rev](
	[id] [int] NOT NULL,
	[aufgabengebiet] [varchar](255) NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[aufgabengebiet]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aufgabengebiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aufgabengebiet] [varchar](255) NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_aufgabengebiet2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[aufgabengebiet_rev])
)
GO
/****** Object:  Table [dbo].[oe_hierarchie_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_hierarchie_rev](
	[id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[child_id] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[oe_hierarchie]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_hierarchie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[child_id] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_oe_hierarchie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[oe_hierarchie_rev])
)
GO
/****** Object:  Table [dbo].[oe_bezeichnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_bezeichnung_rev](
	[id] [int] NOT NULL,
	[bezeichnung] [varchar](255) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[oe_bezeichnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_bezeichnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bezeichnung] [varchar](255) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_oe_bezeichnung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[oe_bezeichnung_rev])
)
GO
/****** Object:  Table [dbo].[position_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position_rev](
	[id] [int] NOT NULL,
	[position] [varchar](255) NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[position]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position] [varchar](255) NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[position_rev])
)
GO
/****** Object:  Table [dbo].[oe_typ_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_typ_rev](
	[id] [int] NOT NULL,
	[oe_typ] [varchar](255) NULL,
	[farb_code] [varchar](255) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[oe_typ]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oe_typ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oe_typ] [varchar](255) NULL,
	[farb_code] [varchar](255) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_oe_typ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[oe_typ_rev])
)
GO
/****** Object:  View [dbo].[oe_ohne_leiter]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[oe_ohne_leiter]
AS
(SELECT        CONCAT('o_', CAST(o_id AS varchar)) AS parentId, CONCAT('m_', CAST(mitarbeiter_id AS varchar)) AS id, m_oe_zuordnung.haupt_oe AS haupt_oe, CASE WHEN leitet_oe.id IS NULL THEN 0 ELSE 1 END AS is_leiter, 
                         CONCAT(m_vorname, ' ', m_nachname) AS name, NULL AS farb_code, position, CASE 
WHEN mitarbeiter.anrede = 'Herrn' THEN interne_funktionsbezeichnung.[funktionsbezeichnung_m]
					WHEN mitarbeiter.anrede = 'Frau' THEN interne_funktionsbezeichnung.[funktionsbezeichnung_w]
					ELSE [funktionsbezeichnung_g] END AS funktionsbezeichnung
FROM            m_oe_zuordnung LEFT JOIN
                         mitarbeiter ON mitarbeiter.id = m_oe_zuordnung.mitarbeiter_id LEFT JOIN
                         interne_funktionsbezeichnung ON mitarbeiter.m_funktion_id = interne_funktionsbezeichnung.id LEFT JOIN
                         leitet_oe ON m_oe_zuordnung.mitarbeiter_id = leitet_oe.m_id AND m_oe_zuordnung.o_id = leitet_oe.oe_id LEFT JOIN
                         orga_einheit ON orga_einheit.id = m_oe_zuordnung.o_id LEFT JOIN
                         oe_bezeichnung bz ON bz.id = orga_einheit.bezeichnung_id LEFT JOIN
                         aufgabengebiet a ON a.id = orga_einheit.aufgabengebiet_id LEFT JOIN
                         position p ON p.id = m_oe_zuordnung.pos_id
WHERE        leitet_oe.m_id IS NULL AND NOT o_id = 0)
UNION ALL
(SELECT        CASE WHEN oe_hierarchie.parent_id IS NULL THEN NULL ELSE CONCAT('o_', CAST(oe_hierarchie.parent_id AS varchar)) END AS parentId, CONCAT('o_', CAST(oe_hierarchie.child_id AS varchar)) AS id, NULL AS haupt_oe, 
                          0 AS is_leiter, CONCAT(oe_typ, ' ', orga_einheit.oe, ' ', bez.bezeichnung) AS name, farb_code, NULL AS position, NULL AS funktionsbezeichnung
 FROM            oe_hierarchie LEFT JOIN
                          orga_einheit ON orga_einheit.id = oe_hierarchie.child_id LEFT JOIN
                          oe_typ ON orga_einheit.typ_id = oe_typ.id LEFT JOIN
                          oe_bezeichnung bez ON bez.id = orga_einheit.bezeichnung_id)
GO
/****** Object:  View [dbo].[oe_organigramm]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[oe_organigramm] AS
SELECT CONCAT(oe_typ,' ',orga_einheit.oe,' ',bezeichnung) as oe,
                            [parent_id] as parentId 
                            ,[child_id] as id
                            ,oe_typ.farb_code
                    FROM [MAV].[dbo].[oe_hierarchie]
                    LEFT join orga_einheit on oe_hierarchie.child_id = orga_einheit.id
                    LEFT join oe_typ on oe_typ.id = orga_einheit.typ_id
                    LEFT JOIN oe_bezeichnung ON oe_bezeichnung.id = orga_einheit.bezeichnung_id
GO
/****** Object:  Table [dbo].[prozess_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozess_zuordnung_rev](
	[id] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[m_id] [int] NULL,
	[referenz_prozess_id] [int] NULL,
	[vertretungs_id] [int] NULL,
	[rank] [int] NULL,
	[von] [datetime] NULL,
	[bis] [datetime] NULL,
	[aktiv] [tinyint] NULL,
	[timestamp] [datetime] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[prozess_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozess_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NOT NULL,
	[m_id] [int] NULL,
	[referenz_prozess_id] [int] NULL,
	[vertretungs_id] [int] NULL,
	[rank] [int] NULL,
	[von] [datetime] NULL,
	[bis] [datetime] NULL,
	[aktiv] [tinyint] NULL,
	[timestamp] [datetime] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[prozess_zuordnung_rev])
)
GO
/****** Object:  View [dbo].[organigramm_komplett]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[organigramm_komplett]
AS
(SELECT        CONCAT('o_', CAST(o_id AS varchar)) AS parentId, CONCAT('m_', CAST(mitarbeiter_id AS varchar)) AS id, m_oe_zuordnung.haupt_oe AS haupt_oe, CASE WHEN leitet_oe.id IS NULL THEN 0 ELSE 1 END AS is_leiter, 
                         m_vorname AS vorname, m_nachname AS nachname, mitarbeiter.m_namenszusatz AS bezeichnung, NULL AS farb_code, position, 
                         CASE WHEN mitarbeiter.anrede = 'Herrn' THEN interne_funktionsbezeichnung.[funktionsbezeichnung_m] WHEN mitarbeiter.anrede = 'Frau' THEN interne_funktionsbezeichnung.[funktionsbezeichnung_w] ELSE [funktionsbezeichnung_g]
                          END AS funktionsbezeichnung, m_email AS email, m_tel AS tel, m_fax AS fax, m_login AS login, CASE WHEN EXISTS
                             (SELECT        [id]
                               FROM            [MAV].[dbo].[prozess_zuordnung]
                               WHERE        mitarbeiter.id = prozess_zuordnung.m_id AND CURRENT_TIMESTAMP BETWEEN prozess_zuordnung.von AND prozess_zuordnung.bis) THEN 0 ELSE 1 END AS anwesend
FROM            m_oe_zuordnung LEFT JOIN
                         mitarbeiter ON mitarbeiter.id = m_oe_zuordnung.mitarbeiter_id LEFT JOIN
                         interne_funktionsbezeichnung ON mitarbeiter.m_funktion_id = interne_funktionsbezeichnung.id LEFT JOIN
                         leitet_oe ON m_oe_zuordnung.mitarbeiter_id = leitet_oe.m_id AND m_oe_zuordnung.o_id = leitet_oe.oe_id LEFT JOIN
                         orga_einheit ON orga_einheit.id = m_oe_zuordnung.o_id LEFT JOIN
                         oe_bezeichnung bz ON bz.id = orga_einheit.bezeichnung_id LEFT JOIN
                         aufgabengebiet a ON a.id = orga_einheit.aufgabengebiet_id LEFT JOIN
                         position p ON p.id = m_oe_zuordnung.pos_id
WHERE        NOT o_id = 0 AND mitarbeiter.enddatum IS NULL)
UNION ALL
(SELECT        CASE WHEN oe_hierarchie.parent_id IS NULL THEN NULL ELSE CONCAT('o_', CAST(oe_hierarchie.parent_id AS varchar)) END AS parentId, CONCAT('o_', CAST(oe_hierarchie.child_id AS varchar)) AS id, NULL AS haupt_oe, 
                          0 AS is_leiter, NULL AS vorname, NULL AS nachname, CONCAT(oe_typ, ' ', orga_einheit.oe, ' ', bez.bezeichnung) AS bezeichnung, farb_code, NULL AS position, NULL AS funktionsbezeichnung, NULL AS email, NULL 
                          AS tel, NULL AS fax, NULL AS login, NULL AS test
 FROM            oe_hierarchie LEFT JOIN
                          orga_einheit ON orga_einheit.id = oe_hierarchie.child_id LEFT JOIN
                          oe_typ ON orga_einheit.typ_id = oe_typ.id LEFT JOIN
                          oe_bezeichnung bez ON bez.id = orga_einheit.bezeichnung_id)
GO
/****** Object:  View [dbo].[view_hierarchieuebersicht]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_hierarchieuebersicht]
AS
WITH hierarchieebenen(id, parent_id, child_id, ebene) AS (SELECT        id, parent_id, child_id, 0 AS ebene
                                                                                                                              FROM            dbo.oe_hierarchie
                                                                                                                              WHERE        (parent_id IS NULL)
                                                                                                                              UNION ALL
                                                                                                                              SELECT        oe_hierarchie_1.id, oe_hierarchie_1.parent_id, oe_hierarchie_1.child_id, h.ebene + 1 AS Expr1
                                                                                                                              FROM            dbo.oe_hierarchie AS oe_hierarchie_1 INNER JOIN
                                                                                                                                                       hierarchieebenen AS h ON oe_hierarchie_1.parent_id = h.child_id)
    SELECT DISTINCT 
                              m.id, h.id AS Expr1, h.parent_id, h.child_id, h.ebene, moe.id AS Expr2, moe.mitarbeiter_id, moe.o_id, moe.pos_id, moe.haupt_oe, moe.timestamp, m.id AS Expr3, m.m_id, m.m_funktion_id, m.m_vorname, m.m_nachname, 
                              m.m_namenszusatz, m.m_geburtsdatum, m.m_geschlecht, m.m_email, m.m_tel, m.m_login
     FROM            hierarchieebenen AS h INNER JOIN
                              dbo.m_oe_zuordnung AS moe ON h.child_id = moe.o_id INNER JOIN
                              dbo.mitarbeiter AS m ON moe.mitarbeiter_id = m.id
GO
/****** Object:  Table [dbo].[azubis_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[azubis_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[lehrjahr] [int] NULL,
	[beendet] [bit] NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[azubis]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[azubis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[lehrjahr] [int] NULL,
	[beendet] [bit] NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_azubis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[azubis_rev])
)
GO
/****** Object:  View [dbo].[vorgesetzte_mit_orgaeinheiten]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vorgesetzte_mit_orgaeinheiten]
AS
SELECT        ma.m_id, ma.m_vorname, ma.m_nachname, ma.m_namenszusatz, ma.m_geburtsdatum, ma.m_geschlecht, oe.oe, ag.aufgabengebiet, dbo.oe_bezeichnung.bezeichnung, typ.oe_typ
FROM            dbo.mitarbeiter AS ma INNER JOIN
                         dbo.leitet_oe ON ma.id = dbo.leitet_oe.m_id INNER JOIN
                         dbo.orga_einheit AS oe ON dbo.leitet_oe.oe_id = oe.id INNER JOIN
                         dbo.aufgabengebiet AS ag ON oe.aufgabengebiet_id = ag.id INNER JOIN
                         dbo.oe_bezeichnung ON oe.bezeichnung_id = dbo.oe_bezeichnung.id INNER JOIN
                         dbo.oe_typ AS typ ON typ.id = oe.typ_id
GO
/****** Object:  Table [dbo].[m_kanal_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_kanal_zuordnung_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[kanal_id] [int] NOT NULL,
	[wert] [varchar](255) NULL,
	[haupt] [bit] NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[m_kanal_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_kanal_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[kanal_id] [int] NOT NULL,
	[wert] [varchar](255) NULL,
	[haupt] [bit] NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[m_kanal_zuordnung_rev])
)
GO
/****** Object:  Table [dbo].[kanal_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kanal_rev](
	[id] [int] NOT NULL,
	[kanal] [varchar](255) NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[kanal]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kanal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kanal] [varchar](255) NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[kanal_rev])
)
GO
/****** Object:  Table [dbo].[MSSQL_TemporalHistoryFor_1560392628]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSSQL_TemporalHistoryFor_1560392628](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[strasse] [varchar](255) NULL,
	[plz] [varchar](255) NULL,
	[ort] [varchar](255) NULL,
	[tel] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[postfach] [varchar](255) NULL,
	[postfach_plz] [varchar](255) NULL,
	[enddatum] [datetime2](0) NULL,
	[id_old] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL,
	[timestamp] [datetime2](0) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[anschriften]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anschriften](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[strasse] [varchar](255) NULL,
	[plz] [varchar](255) NULL,
	[ort] [varchar](255) NULL,
	[tel] [varchar](255) NULL,
	[fax] [varchar](255) NULL,
	[postfach] [varchar](255) NULL,
	[postfach_plz] [varchar](255) NULL,
	[enddatum] [datetime2](0) NULL,
	[id_old] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
	[timestamp] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[MSSQL_TemporalHistoryFor_1560392628])
)
GO
/****** Object:  Table [dbo].[anschrift_zuordnung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anschrift_zuordnung_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NULL,
	[anschriften_id] [int] NULL,
	[haupt_anschrift] [int] NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[anschrift_zuordnung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anschrift_zuordnung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NULL,
	[anschriften_id] [int] NULL,
	[haupt_anschrift] [int] NULL,
	[timestamp] [datetime2](0) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[anschrift_zuordnung_rev])
)
GO
/****** Object:  View [dbo].[view_mitarbeiter]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* AND m.enddatum IS NULL*/
CREATE VIEW [dbo].[view_mitarbeiter]
AS
SELECT        m.id, m.m_id AS personalnummer, m.[21c_kennung] AS kennung_21c, { fn CONCAT(m.[21c_kennung], '@02053') } AS kennung_02053, m.m_login AS nt_login, m.anrede, m.m_namenszusatz AS titel, m.m_nachname AS name, 
                         m.m_vorname,
                             (SELECT        wert
                               FROM            dbo.m_kanal_zuordnung
                               WHERE        (m.id = m_id) AND (kanal_id = 2) AND (haupt = 1)) AS tel,
                             (SELECT        wert
                               FROM            dbo.m_kanal_zuordnung AS m_kanal_zuordnung_3
                               WHERE        (m.id = m_id) AND (kanal_id = 3) AND (haupt = 1)) AS fax,
                             (SELECT        wert
                               FROM            dbo.m_kanal_zuordnung AS m_kanal_zuordnung_2
                               WHERE        (m.id = m_id) AND (kanal_id = 5) AND (haupt = 1)) AS mobil_geschaeft,
                             (SELECT        wert
                               FROM            dbo.m_kanal_zuordnung AS m_kanal_zuordnung_1
                               WHERE        (m.id = m_id) AND (kanal_id = 1) AND (haupt = 1)) AS email, a.strasse AS ap_strasse, a.ort AS ap_ort, a.plz AS ap_plz, 
                         CASE WHEN m.m_geschlecht = 'männlich' THEN fkt.funktionsbezeichnung_m ELSE fkt.funktionsbezeichnung_w END AS interne_funktion, CASE WHEN o1.typ_id = 28 THEN CONCAT(t1.oe_typ, ' ', b1.bezeichnung) ELSE NULL 
                         END AS ap_team, CASE WHEN o2.typ_id = 27 THEN CONCAT(t2.oe_typ, ' ', b2.bezeichnung) WHEN o1.typ_ID = 27 THEN CONCAT(t1.oe_typ, ' ', b1.bezeichnung) ELSE NULL END AS ap_referat, 
                         CASE WHEN o3.typ_id = 26 THEN CONCAT(t3.oe_typ, ' ', b3.bezeichnung) WHEN o2.typ_id = 26 THEN CONCAT(t2.oe_typ, ' ', b2.bezeichnung) WHEN o1.typ_id = 26 THEN CONCAT(t1.oe_typ, ' ', b1.bezeichnung) ELSE NULL 
                         END AS ap_abteilung, CASE WHEN o4.typ_id = 25 THEN CONCAT(t4.oe_typ, ' ', b4.bezeichnung) WHEN o3.typ_id = 25 THEN CONCAT(t3.oe_typ, ' ', b3.bezeichnung) WHEN o2.typ_id = 25 THEN CONCAT(t2.oe_typ, ' ', 
                         b2.bezeichnung) WHEN o1.typ_id = 25 THEN CONCAT(t1.oe_typ, ' ', b1.bezeichnung) ELSE NULL END AS ap_geschaeftsbereich, CASE WHEN o1.typ_id = 31 THEN CONCAT(t1.oe_typ, ' ', b1.bezeichnung) ELSE NULL 
                         END AS ap_stabstelle, m.eintrittsdatum, m.enddatum
FROM            dbo.mitarbeiter AS m LEFT OUTER JOIN
                         dbo.interne_funktionsbezeichnung AS fkt ON m.m_funktion_id = fkt.id LEFT OUTER JOIN
                         dbo.anschrift_zuordnung AS az ON m.id = az.m_id LEFT OUTER JOIN
                         dbo.anschriften AS a ON az.anschriften_id = a.id LEFT OUTER JOIN
                         dbo.m_oe_zuordnung AS moe ON m.id = moe.mitarbeiter_id LEFT OUTER JOIN
                         dbo.orga_einheit AS o1 ON o1.id = moe.o_id LEFT OUTER JOIN
                         dbo.oe_hierarchie AS h1 ON o1.id = h1.child_id LEFT OUTER JOIN
                         dbo.oe_bezeichnung AS b1 ON o1.bezeichnung_id = b1.id LEFT OUTER JOIN
                         dbo.oe_typ AS t1 ON o1.typ_id = t1.id LEFT OUTER JOIN
                         dbo.orga_einheit AS o2 ON h1.parent_id = o2.id LEFT OUTER JOIN
                         dbo.oe_hierarchie AS h2 ON o2.id = h2.child_id LEFT OUTER JOIN
                         dbo.oe_bezeichnung AS b2 ON o2.bezeichnung_id = b2.id LEFT OUTER JOIN
                         dbo.oe_typ AS t2 ON o2.typ_id = t2.id LEFT OUTER JOIN
                         dbo.orga_einheit AS o3 ON h2.parent_id = o3.id LEFT OUTER JOIN
                         dbo.oe_hierarchie AS h3 ON o3.id = h3.child_id LEFT OUTER JOIN
                         dbo.oe_bezeichnung AS b3 ON o3.bezeichnung_id = b3.id LEFT OUTER JOIN
                         dbo.oe_typ AS t3 ON o3.typ_id = t3.id LEFT OUTER JOIN
                         dbo.orga_einheit AS o4 ON h3.parent_id = o4.id LEFT OUTER JOIN
                         dbo.oe_bezeichnung AS b4 ON o4.bezeichnung_id = b4.id LEFT OUTER JOIN
                         dbo.oe_typ AS t4 ON o4.typ_id = t4.id
WHERE        (az.haupt_anschrift = 1) AND (moe.haupt_oe = 1)
GO
/****** Object:  View [dbo].[view_direkte_vorgesetzte]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_direkte_vorgesetzte] AS
SELECT 
DISTINCT(m.id),
m.[21c_kennung],
m.anrede,
m.m_namenszusatz,
m.m_nachname,
m.m_vorname,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE fk1.[21c_kennung] END,
	fk2.[21c_kennung] ,
	fk3.[21c_kennung] ,
	fk4.[21c_kennung] 
) vorgesetzter_kennung_21c,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE fk1.anrede END,
	fk2.anrede,
	fk3.anrede,
	fk4.anrede
) vorgesetzter_anrede,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE fk1.m_namenszusatz END,
	fk2.m_namenszusatz,
fk3.m_namenszusatz,
	fk4.m_namenszusatz
) vorgesetzter_titel,
COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE fk1.m_nachname END,
	fk2.m_nachname,
	fk3.m_nachname,
	fk4.m_nachname
) vorgesetzter_nachname,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE fk1.m_vorname END,
	fk2.m_vorname,
	fk3.m_vorname,
	fk4.m_vorname
) vorgesetzter_vorname,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE (SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 1 AND m_id = fk1.id) END,
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 1 AND m_id = fk2.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 1 AND m_id = fk3.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 1 AND m_id = fk4.id)
) as vorgesetzter_email,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE (SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 2 AND m_id = fk1.id) END,
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 2 AND m_id = fk2.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 2 AND m_id = fk3.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 2 AND m_id = fk4.id)
) as vorgesetzter_tel,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE (SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 3 AND m_id = fk1.id) END,
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 3 AND m_id = fk2.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 3 AND m_id = fk3.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 3 AND m_id = fk4.id)
) as vorgesetzter_fax,

COALESCE(
	CASE WHEN m.id = fk1.id THEN NULL ELSE (SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 5 AND m_id = fk1.id) END,
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 5 AND m_id = fk2.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 5 AND m_id = fk3.id),
	(SELECT wert FROM m_kanal_zuordnung WHERE haupt = 1 AND kanal_id = 5 AND m_id = fk4.id)
) as vorgesetzter_mobil


FROM
mitarbeiter m
left join m_oe_zuordnung moe on m.id = moe.mitarbeiter_id
LEFT JOIN orga_einheit o1 ON o1.id = moe.o_id
LEFT JOIN leitet_oe loe1 ON o1.id = loe1.oe_id
LEFT JOIN mitarbeiter fk1 ON loe1.m_id = fk1.id
LEFT JOIN oe_hierarchie h1 ON o1.id = h1.child_id
LEFT JOIN orga_einheit o2 ON h1.parent_id = o2.id
LEFT JOIN leitet_oe loe2 ON o2.id = loe2.oe_id
LEFT JOIN mitarbeiter fk2 ON loe2.m_id = fk2.id
LEFT JOIN oe_hierarchie h2 ON o2.id = h2.child_id
LEFT JOIN orga_einheit o3 ON h2.parent_id = o3.id
LEFT JOIN leitet_oe loe3 ON o3.id = loe3.oe_id
LEFT JOIN mitarbeiter fk3 ON loe3.m_id = fk3.id
LEFT JOIN oe_hierarchie h3 ON o3.id = h3.child_id
LEFT JOIN orga_einheit o4 ON h3.parent_id = o4.id
LEFT JOIN leitet_oe loe4 ON o4.id = loe4.oe_id
LEFT JOIN mitarbeiter fk4 ON loe4.m_id = fk4.id
where moe.haupt_oe = 1
AND fk1.enddatum is null
and fk2.enddatum is null
and fk3.enddatum is null
and fk4.enddatum is null
GO
/****** Object:  Table [dbo].[prozesse_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozesse_rev](
	[id] [int] NOT NULL,
	[prozess] [varchar](255) NULL,
	[aktiv] [tinyint] NULL,
	[timestamp] [datetime] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[prozesse]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozesse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prozess] [varchar](255) NULL,
	[aktiv] [tinyint] NULL,
	[timestamp] [datetime] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[prozesse_rev])
)
GO
/****** Object:  Table [dbo].[mitarbeiter_info_text_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mitarbeiter_info_text_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[info_text] [varchar](max) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[mitarbeiter_info_text]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mitarbeiter_info_text](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[info_text] [varchar](max) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_mitarbeiter_info_text] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[mitarbeiter_info_text_rev])
)
GO
/****** Object:  Table [dbo].[schlagwoerter_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schlagwoerter_rev](
	[id] [int] NOT NULL,
	[schlagwort] [varchar](255) NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[schlagwoerter]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schlagwoerter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[schlagwort] [varchar](255) NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_schlagwoerter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[schlagwoerter_rev])
)
GO
/****** Object:  Table [dbo].[prozess_hierachie_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozess_hierachie_rev](
	[id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[child_id] [int] NOT NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[prozess_hierachie]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prozess_hierachie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[child_id] [int] NOT NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_prozess_hierachie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[prozess_hierachie_rev])
)
GO
/****** Object:  Table [dbo].[haupt_prozess_vertretung_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[haupt_prozess_vertretung_rev](
	[id] [int] NOT NULL,
	[p_id] [int] NULL,
	[m_id] [int] NULL,
	[v_id] [int] NULL,
	[rank] [int] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[haupt_prozess_vertretung]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[haupt_prozess_vertretung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[m_id] [int] NULL,
	[v_id] [int] NULL,
	[rank] [int] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[haupt_prozess_vertretung_rev])
)
GO
/****** Object:  Table [dbo].[zuo_sonder_oe_azubi_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zuo_sonder_oe_azubi_rev](
	[id] [int] NOT NULL,
	[m_id] [int] NOT NULL,
	[s_id] [int] NOT NULL,
	[beginn] [date] NOT NULL,
	[ende] [date] NOT NULL,
	[timestamp] [timestamp] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[zuo_sonder_oe_azubi]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zuo_sonder_oe_azubi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[s_id] [int] NOT NULL,
	[beginn] [date] NOT NULL,
	[ende] [date] NOT NULL,
	[timestamp] [timestamp] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_zuo_sonder_oe_azubi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[zuo_sonder_oe_azubi_rev])
)
GO
/****** Object:  Table [dbo].[sonder_azubi_oe_rev]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sonder_azubi_oe_rev](
	[id] [int] NOT NULL,
	[bezeichnung] [varchar](255) NULL,
	[aktiv] [tinyint] NULL,
	[v_beginn] [datetime2](0) NOT NULL,
	[v_ende] [datetime2](0) NOT NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
/****** Object:  Table [dbo].[sonder_azubi_oe]    Script Date: 05.02.2024 10:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sonder_azubi_oe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bezeichnung] [varchar](255) NULL,
	[aktiv] [tinyint] NULL,
	[v_beginn] [datetime2](0) GENERATED ALWAYS AS ROW START NOT NULL,
	[v_ende] [datetime2](0) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_sonder_azubi_oe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([v_beginn], [v_ende])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[sonder_azubi_oe_rev])
)
GO
ALTER TABLE [dbo].[anschrift_zuordnung] ADD  CONSTRAINT [DF_anschrift_zuordnung_haupt_anschrift]  DEFAULT ((1)) FOR [haupt_anschrift]
GO
ALTER TABLE [dbo].[anschrift_zuordnung] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[anschriften] ADD  DEFAULT ('99991231 23:59:59') FOR [enddatum]
GO
ALTER TABLE [dbo].[anschriften] ADD  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[azubis] ADD  CONSTRAINT [DF_azubis_beendet]  DEFAULT ((0)) FOR [beendet]
GO
ALTER TABLE [dbo].[kanal] ADD  CONSTRAINT [DF_kanal_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[leitet_oe] ADD  DEFAULT (getdate()) FOR [erstellt_am1]
GO
ALTER TABLE [dbo].[leitet_oe] ADD  DEFAULT (getdate()) FOR [bearbeitet_am1]
GO
ALTER TABLE [dbo].[leitet_oe_rev] ADD  DEFAULT (getdate()) FOR [erstellt_am1]
GO
ALTER TABLE [dbo].[leitet_oe_rev] ADD  DEFAULT (getdate()) FOR [bearbeitet_am1]
GO
ALTER TABLE [dbo].[m_kanal_zuordnung] ADD  CONSTRAINT [DF_m_kanal_zuordnung_haupt]  DEFAULT ((1)) FOR [haupt]
GO
ALTER TABLE [dbo].[m_kanal_zuordnung] ADD  CONSTRAINT [DF_m_kanal_zuordnung_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[m_oe_zuordnung] ADD  CONSTRAINT [DF_m_oe_zuordnung_v_beginn]  DEFAULT ('19000101') FOR [v_beginn]
GO
ALTER TABLE [dbo].[m_oe_zuordnung] ADD  CONSTRAINT [DF_m_oe_zuordnung_v_ende]  DEFAULT ('99991231 23:59:59') FOR [v_ende]
GO
ALTER TABLE [dbo].[prozess_zuordnung] ADD  CONSTRAINT [DF_prozess_zuordnung_aktiv]  DEFAULT ((1)) FOR [aktiv]
GO
ALTER TABLE [dbo].[prozess_zuordnung] ADD  CONSTRAINT [DF_prozess_zuordnung_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[sonder_azubi_oe] ADD  CONSTRAINT [DF_sonder_azubi_oe_aktiv]  DEFAULT ((1)) FOR [aktiv]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "zo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oe"
            Begin Extent = 
               Top = 261
               Left = 302
               Bottom = 391
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loe"
            Begin Extent = 
               Top = 279
               Left = 776
               Bottom = 392
               Right = 943
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vg"
            Begin Extent = 
               Top = 241
               Left = 1203
               Bottom = 371
               Right = 1383
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 891
               Bottom = 136
               Right = 1071
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2010
         Table = 1170
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mitarbeiter_vorgesetzter_zo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mitarbeiter_vorgesetzter_zo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mitarbeiter_vorgesetzter_zo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[27] 2[36] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'oe_ohne_leiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'oe_ohne_leiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'organigramm_komplett'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'organigramm_komplett'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "h"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "moe"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 136
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 136
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_hierarchieuebersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_hierarchieuebersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fkt"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "az"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 136
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 138
               Left = 299
               Bottom = 268
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "moe"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o1"
            Begin Extent = 
               Top = 270
               Left = 243
               Bottom = 400
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h1"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
         Begin Table = "b1"
            Begin Extent = 
               Top = 402
               Left = 243
               Bottom = 532
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t1"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o2"
            Begin Extent = 
               Top = 534
               Left = 243
               Bottom = 664
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h2"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b2"
            Begin Extent = 
               Top = 666
               Left = 243
               Bottom = 796
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 798
               Left = 38
               Bottom = 928
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o3"
            Begin Extent = 
               Top = 798
               Left = 243
               Bottom = 928
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "h3"
            Begin Extent = 
               Top = 930
               Left = 38
               Bottom = 1060
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b3"
            Begin Extent = 
               Top = 930
               Left = 243
               Bottom = 1060
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t3"
            Begin Extent = 
               Top = 1062
               Left = 38
               Bottom = 1192
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o4"
            Begin Extent = 
               Top = 1062
               Left = 243
               Bottom = 1192
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b4"
            Begin Extent = 
               Top = 1194
               Left = 38
               Bottom = 1324
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t4"
            Begin Extent = 
               Top = 1194
               Left = 243
               Bottom = 1324
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane3', @value=N' GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=3 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ma"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "leitet_oe"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 119
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oe"
            Begin Extent = 
               Top = 57
               Left = 556
               Bottom = 187
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ag"
            Begin Extent = 
               Top = 256
               Left = 626
               Bottom = 352
               Right = 798
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oe_bezeichnung"
            Begin Extent = 
               Top = 221
               Left = 992
               Bottom = 317
               Right = 1159
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "typ"
            Begin Extent = 
               Top = 6
               Left = 1101
               Bottom = 102
               Right = 1268
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vorgesetzte_mit_orgaeinheiten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vorgesetzte_mit_orgaeinheiten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vorgesetzte_mit_orgaeinheiten'
GO

Go
INSERT INTO [dbo].[mitarbeiter]
           ([m_id]
           ,[m_vorname]
           ,[m_nachname]
           ,[m_email]
           ,[m_login]
           ,[enddatum])
     VALUES
           (234735, 'Mud', 'Smith', 'mud.smith@cr7.de', 'sfi2201', NULL),
           (234736, 'Diego', 'Rodriguez', 'diego.rodriguez@cr7.de', 'sfi2203', NULL),
           (234737, 'Milten', 'Plescott', 'milten.plescott@cr7.de', 'sfi2204', NULL),
           (234738, 'Gorn', 'Mighty', 'gorn.mighty@cr7.de', 'sfi2205', NULL),
           (234739, 'Lester', 'River', 'lester.river@cr7.de', 'sfi2206', NULL),
           (234740, 'Xardas', 'Nox', 'xardas.nox@cr7.de', 'sfi2207', NULL),
           (234741, 'Lares', 'Trail', 'lares.trail@cr7.de', 'sfi2208', NULL),
           (234742, 'Lee', 'Farmer', 'lee.farmer@cr7.de', 'sfi2209', NULL),
           (234743, 'Vatras', 'Divine', 'vatras.divine@cr7.de', 'sfi2210', NULL),
           (234744, 'Cavalorn', 'Hunter', 'cavalorn.hunter@cr7.de', 'sfi2211', NULL),
		   (234745, 'Thoros', 'Bold', 'thoros.bold@cr7.de', 'sfi2212', NULL),
           (234746, 'Saturas', 'Wise', 'saturas.wise@cr7.de', 'sfi2213', NULL),
           (234747, 'Pyrokar', 'Mage', 'pyrokar.mage@cr7.de', 'sfi2214', NULL),
           (234748, 'Raven', 'Dark', 'raven.dark@cr7.de', 'sfi2215', NULL),
           (234749, 'Gomez', 'Baron', 'gomez.baron@cr7.de', 'sfi2216', NULL),
           (234750, 'Kor Angar', 'Teacher', 'kor.angar@cr7.de', 'sfi2217', NULL),
           (234751, 'Biff', 'Strong', 'biff.strong@cr7.de', 'sfi2218', NULL),
           (234752, 'Fisk', 'Trader', 'fisk.trader@cr7.de', 'sfi2219', NULL),
           (234753, 'Arto', 'Sailor', 'arto.sailor@cr7.de', 'sfi2220', NULL),
           (234754, 'Cronos', 'Scholar', 'cronos.scholar@cr7.de', 'sfi2221', NULL);


INSERT INTO [dbo].[oe_typ]
           ([oe_typ])
     VALUES
           ('Abteilung'),
		   ('Team'),
		   ('Referat'),
		   ('Geschäftsbereich')

INSERT INTO [dbo].[oe_bezeichnung]
           ([bezeichnung])
     VALUES
           ('Firmenkundenservice'),
		   ('Softwareentwicklung'),
		   ('Querschnitt und Infrastruktur'),
		   ('Unternehmensentwicklung')

INSERT INTO [dbo].[orga_einheit]
           ([oe]
           ,[typ_id]
           ,[bezeichnung_id])
     VALUES
           ('DIG/IT3',3,2),
		   ('DIG/IT2',3,3),
		   ('FKS',1,1),
		   ('UE',4,4)

INSERT INTO [dbo].[m_oe_zuordnung] ([mitarbeiter_id], [o_id], [haupt_oe]) 
	 VALUES
			('234735', 1, 1),
			('234736', 1, 1),
			('234737', 2, 1),
			('234738', 3, 1),
			('234739', 1, 1),
			('234740', 2, 1),
			('234741', 1, 1),
			('234742', 1, 1),
			('234743', 3, 1),
			('234744', 3, 1),
			('234745', 1, 1),
			('234746', 1, 1),
			('234747', 1, 1),
			('234748', 3, 1),
			('234749', 2, 1),
			('234750', 3, 1),
			('234751', 2, 1),
			('234752', 3, 1),
			('234753', 1, 1),
			('234754', 2, 1);
Go