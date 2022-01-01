create database StageTH
go
USE [StageTH]
GO

--1/****** Object:  Table [dbo].[Accident_Severity_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:24:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Accident_Severity_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO

--2/****** Object:  Table [dbo].[Accidents_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:26:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Accidents_UK_Car_Accidents_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Accident_Severity] [int] NULL,
	[Number_of_Casualties] int NULL,
	[Time][time]  NULL,
	[Date] [datetime] NULL,
	[Local_Authority_(District)] [int] NULL,
	[Road_Type] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[Speed_limit] [int] NULL,
	[LSOA] [varchar](50) NULL,
) ON [PRIMARY]
GO
--3/****** Object:  Table [dbo].[Casualties_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:26:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Casualties_UK_Car_Accidents_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Casualty_Type] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL
) ON [PRIMARY]
GO

--4/****** Object:  Table [dbo].[Casualty_Severity_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:28:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Casualty_Severity_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO


--5/****** Object:  Table [dbo].[Casualty_Type_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:28:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Casualty_Type_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
--6/****** Object:  Table [dbo].[Local_Authority_(District)_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:29:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Local_Authority_(District)_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO


--7/****** Object:  Table [dbo].[Postcodes_UK_Postcodes_Stage]    Script Date: 11/28/2021 5:29:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Postcodes_UK_Postcodes_Stage](
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[region_code] [varchar](50) NULL,
	[region_name] [varchar](50) NULL
) ON [PRIMARY]
GO


--8/****** Object:  Table [dbo].[Road_Type_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:29:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Road_Type_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO




--9/****** Object:  Table [dbo].[Sex_of_Casualty_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:30:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sex_of_Casualty_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO


--10/****** Object:  Table [dbo].[Urban_or_Rural_Area_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:30:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Urban_or_Rural_Area_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO


--11/****** Object:  Table [dbo].[Vehicle_Type_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:30:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vehicle_Type_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO


--12/****** Object:  Table [dbo].[Vehicle_UK_Car_Accidents_Stage]    Script Date: 11/28/2021 5:30:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vehicle_UK_Car_Accidents_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Type] [int] NULL,
	[Journey_Purpose_of_Driver] int NULL,
	[Age_of_Driver] [varchar](50) NULL,
	[Engine_Capacity_(CC)] [varchar](50) NULL,
	[Age_of_Vehicle] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PCD_LSOA_Stage](
	
	[pcds] varchar(50)  NULL,
	 [Isoa11cd] varchar(50)  NULL,
    [lsoa11nm] varchar(50) NULL,
	 [ladnm] varchar(255) NULL,
	  

) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Age_Band_of_Casualty_UK_Car_Accidents_Stage]    Script Date: 12/30/2021 10:35:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Age_Band_of_Casualty_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Purpose_UK_Car_Accidents_Stage]    Script Date: 12/30/2021 10:38:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Journey_Purpose_UK_Car_Accidents_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
