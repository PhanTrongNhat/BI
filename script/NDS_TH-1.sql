create database NDS_TH
go
use NDS_TH
------------------Tao Bang Nguon
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NguonDuLieu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NguonDuLieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenNguonDuLieu] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
 CONSTRAINT [PK_NguonDuLieu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------Tao Bang Vehicle
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vehicle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accident_Index] int NULL,
    [Vehicle_Type] int NULL,
   
    [Age_of_Driver] varchar(50) NULL,
    [Engine_Capacity_(CC)] varchar(50) NULL,
    [Age_of_Vehicle] varchar(50) NULL,
	[NguonDuLieu] int NULL,
	[Journey_Purpose] int NULL,


 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
----------------------------Accidents
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accidents]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accident_Index] varchar(50) NOT NULL,
    [Longitude] varchar(50) NULL,
    [Latitude] varchar(50) NULL,
    [Accident_Severity] int NULL,
    [Number_of_Casualties] int NULL,
    [Time] time NULL,
    [Date] datetime NULL,
    [Local_Authority_(District)] int NULL,
    [Road_Type] int NULL,
    [Urban_or_Rural_Area] int NULL,
    [Speed_limit] int NULL,
	[LSOA] int NULL,
	[NguonDuLieu] int NULL,

 CONSTRAINT [PK_Accidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO



---------------------------Tao Bang postcodes
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Postcodes]') AND type in (N'U'))
--BEGIN
--CREATE TABLE [dbo].[Postcodes](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[postcode] varchar(50) NULL,
--    [city] varchar(50) NULL,
--    [county] varchar(50) NULL,
--    [country_code] varchar(50) NULL,
--    [country_name] varchar(50) NULL,
--    [region_code] varchar(50) NULL,
--    [region_name] varchar(50) NULL,
--	  [NguonDuLieu] int NULL,
-- CONSTRAINT [PK_Postcodes] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--END
--GO


-------------------------Tao Bang postcodes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Postcodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Postcodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[postcode] varchar(50) NOT NULL,
    [city] varchar(50) NULL,
	[id_country] int NULL,
	[id_region] int NULL,
    --[county] varchar(50) NULL,
    --[country_code] varchar(50) NULL,
    --[country_name] varchar(50) NULL,
    --[region_code] varchar(50) NULL,
    --[region_name] varchar(50) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Postcodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-------------------------Tao Bang countrycodes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countrycodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].Countrycodes(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[country_code] varchar(50) NOT NULL,
    [country_name] varchar(50) NULL,
	[NguonDuLieu] int NULL,
 CONSTRAINT [PK_Countrycodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-------------------------Tao Bang Regioncodes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Regioncodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].Regioncodes(
	[Id] [int] IDENTITY(1,1) NOT NULL,
    [region_code] varchar(50) NOT NULL,
    [region_name] varchar(50) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Regioncodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


--------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Postcodes_Countrycodes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Postcodes]'))
ALTER TABLE [dbo].Postcodes  WITH CHECK ADD  CONSTRAINT [FK_Postcodes_Countrycodes] FOREIGN KEY([id_country])
REFERENCES [dbo].[Countrycodes] ([Id])


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Postcodes_Regioncodes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Postcodes]'))
ALTER TABLE [dbo].Postcodes  WITH CHECK ADD  CONSTRAINT [FK_Postcodes_Regioncodes] FOREIGN KEY([id_region])
REFERENCES [dbo].[Regioncodes] ([Id])
----------------------------------- Casualties
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Casualties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Casualties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accident_Index] int NULL ,
    [Casualty_Type] int NULL,
    [Sex_of_Casualty] int NULL,

    [Casualty_Severity] int NULL,
	[Age_Band_Of_Casualty] int NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Casualties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Accident_Severity
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accident_Severity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accident_Severity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Accident_Severity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Local_Authority_District
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Local_Authority_(District)]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Local_Authority_(District)](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Local_Authority_(District)] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Road_Type
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Road_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Road_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Road_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Urban_or_Rural_Area
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Urban_or_Rural_Area]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Urban_or_Rural_Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Urban_or_Rural_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Vehicle_Type
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vehicle_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Vehicle_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

-----------------------------------------jorney
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Journey_Purpose]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Journey_Purpose](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Journey_Purpose] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
-----------------------------------------Age_Band_Of_Casualty
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Age_Band_Of_Casualty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Age_Band_Of_Casualty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Age_Band_Of_Casualty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Casualty_Type
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Casualty_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Casualty_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Casualty_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Sex_of_Casualty
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sex_of_Casualty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sex_of_Casualty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Sex_of_Casualty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
---------------------------------------Casualty_Severity
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Casualty_Severity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Casualty_Severity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	 [code] int NOT NULL,
    [label] nvarchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_Casualty_Severity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
--------------------------------------------- PCD_OA

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PCD_LSOA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PCD_LSOA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pcds] int  NULL,
	 [Isoa11cd] varchar(50) NOT NULL,
    [lsoa11nm] varchar(50) NULL,
	 [ladnm] varchar(255) NULL,
	  [NguonDuLieu] int NULL,
 CONSTRAINT [PK_PCD_LSOA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
----------------------------------------

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accidents_PCD_LSOA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH           CHECK ADD  CONSTRAINT [FK_Accidents_PCD_LSOA] FOREIGN KEY([LSOA])
REFERENCES [dbo].[PCD_LSOA] ([Id])
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PCD_LSOA_Postcodes]') AND parent_object_id = OBJECT_ID(N'[dbo].[PCD_LSOA]'))
ALTER TABLE [dbo].[PCD_LSOA]  WITH CHECK ADD  CONSTRAINT [FK_PCD_LSOA_Postcodes] FOREIGN KEY([pcds])
REFERENCES [dbo].[Postcodes] ([Id])
GO


------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accident_Accident_Severity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_Accident_Severity] FOREIGN KEY([Accident_Severity])
REFERENCES [dbo].[Accident_Severity] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accidents_Local_Authority_(District)]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_Local_Authority_(District)] FOREIGN KEY([Local_Authority_(District)])
REFERENCES [dbo].[Local_Authority_(District)] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accidents_Road_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_Road_Type] FOREIGN KEY([Road_Type])
REFERENCES [dbo].[Road_Type] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accidents_Urban_or_Rural_Area]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_Urban_or_Rural_Area] FOREIGN KEY([Urban_or_Rural_Area])
REFERENCES [dbo].[Urban_or_Rural_Area] ([Id])
GO
--------------------------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_Casualty_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_Casualty_Type] FOREIGN KEY([Casualty_Type])
REFERENCES [dbo].[Casualty_Type] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_Sex_of_Casualty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_Sex_of_Casualty] FOREIGN KEY([Sex_of_Casualty])
REFERENCES [dbo].[Sex_of_Casualty] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_Casualty_Severity]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_Casualty_Severity] FOREIGN KEY([Casualty_Severity])
REFERENCES [dbo].[Casualty_Severity] ([Id])
GO
------------------------------------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_Vehicle_Type]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Vehicle_Type] FOREIGN KEY([Vehicle_Type])
REFERENCES [dbo].[Vehicle_Type] ([Id])
GO
---++++++++++++++-------------++++++++++++++--------------++++++++++++------------------------######################
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accident_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accidents]'))
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualty_Severity_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualty_Severity]'))
ALTER TABLE [dbo].[Casualty_Severity]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_Severity_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualty_Type_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualty_Type]'))
ALTER TABLE [dbo].[Casualty_Type]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_Type_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accident_Severity_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accident_Severity]'))
ALTER TABLE [dbo].[Accident_Severity]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Severity_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Local_Authority_(District)_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Local_Authority_(District)]'))
ALTER TABLE [dbo].[Local_Authority_(District)]  WITH CHECK ADD  CONSTRAINT [FK_Local_Authority_(District)_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Postcodes_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Postcodes]'))
ALTER TABLE [dbo].[Postcodes]  WITH CHECK ADD  CONSTRAINT [FK_Postcodes_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Road_Type_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Road_Type]'))
ALTER TABLE [dbo].[Road_Type]  WITH CHECK ADD  CONSTRAINT [FK_Road_Type_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sex_of_Casualty_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sex_of_Casualty]'))
ALTER TABLE [dbo].[Sex_of_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Sex_of_Casualty_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Urban_or_Rural_Area_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Urban_or_Rural_Area]'))
ALTER TABLE [dbo].[Urban_or_Rural_Area]  WITH CHECK ADD  CONSTRAINT [FK_Urban_or_Rural_Area_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_Type_NguonDuLieu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle_Type]'))
ALTER TABLE [dbo].[Vehicle_Type]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Type_NguonDuLieu] FOREIGN KEY([NguonDuLieu])
REFERENCES [dbo].[NguonDuLieu] ([Id])
GO
                                                  

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_Accidents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH           CHECK ADD  CONSTRAINT [FK_Vehicle_Accidents] FOREIGN KEY([Accident_Index])
REFERENCES [dbo].[Accidents] ([Id])
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_Accidents]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_Accidents] FOREIGN KEY([Accident_Index])
REFERENCES [dbo].[Accidents] ([Id])
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_Journey_Purpose]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Journey_Purpose] FOREIGN KEY([Journey_Purpose])
REFERENCES [dbo].[Journey_Purpose] ([Id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Casualties_Age_Band_Of_Casualty]') AND parent_object_id = OBJECT_ID(N'[dbo].[Casualties]'))
ALTER TABLE [dbo].[Casualties]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_Age_Band_Of_Casualty] FOREIGN KEY([Age_Band_Of_Casualty])
REFERENCES [dbo].[Age_Band_Of_Casualty] ([Id])
GO
--------------------------------------------------------
    SET IDENTITY_INSERT [dbo].[NguonDuLieu] ON
  insert into [dbo].[NguonDuLieu] ([Id],[TenNguonDuLieu],[NgayTao],[NgayCapNhat]) values 
  (1,N'UK-Postcodes','20010517 22:11:35.743','20010517 22:11:35.743')
    SET IDENTITY_INSERT [dbo].[NguonDuLieu] OFF
GO
   SET IDENTITY_INSERT [dbo].[NguonDuLieu] ON
  insert into [dbo].[NguonDuLieu] ([Id],[TenNguonDuLieu],[NgayTao],[NgayCapNhat]) values 
  (2,N'UK Car Accidents ','20010517 22:11:35.743','20010517 22:11:35.743')
    SET IDENTITY_INSERT [dbo].[NguonDuLieu] OFF
GO
   SET IDENTITY_INSERT [dbo].[NguonDuLieu] ON
  insert into [dbo].[NguonDuLieu] ([Id],[TenNguonDuLieu],[NgayTao],[NgayCapNhat]) values 
  (3,N'PCD_LSOA ','20010517 22:11:35.743','20010517 22:11:35.743')
    SET IDENTITY_INSERT [dbo].[NguonDuLieu] OFF
GO