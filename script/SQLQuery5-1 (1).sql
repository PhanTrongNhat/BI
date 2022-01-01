go 
create database DDS_TH
go
use DDS_TH
go
--1 & 2
create table Fact_Number_of_Victim_Time

(
	ID int identity (1,1) not null,

	DayID int,
	Local_Authority_ID int,
	Accident_Severity_ID int,
	Sum_Number_of_Casualties1 int,
	CONSTRAINT Victim_Table1 PRIMARY KEY ( DayID , Local_Authority_ID, Accident_Severity_ID)
)
go
create table  Dim_Session
(
	ID int identity (1,1) not null,
	DayID int,	
	Session_Name varchar(50),
	NguonDuLieu int,
	CONSTRAINT Time_Dim_PK PRIMARY KEY(ID)
)
go
create table Dim_Day
(
	
	ID int identity (1,1) not null,
	MonthID int,	
	Date_Name int,
	NguonDuLieu int,
	CONSTRAINT Date_Dim_PK PRIMARY KEY(ID)
)
go
create table Dim_Month
(
	ID int identity (1,1) not null,
	QuarterID int,
	Month_Name int,
	NguonDuLieu int,
	CONSTRAINT Date_Dim1_PK PRIMARY KEY(ID)
)
go
create table Dim_Quarter
(
	ID int identity (1,1) not null,
	YearID int,
	QuaterName int,
	NguonDuLieu int,
	CONSTRAINT Date_Dim2_PK PRIMARY KEY(ID)
)
go
create table Dim_Year
(
	ID int identity (1,1) not null,
	YearName int,
	NguonDuLieu int,
	CONSTRAINT Year_Dim_PK PRIMARY KEY(ID)
)
go
create table Dim_Accident
( 
	ID int identity (1,1) not null,
	Accident_Index int,
	Accident_Severity_ID int,
	Local_Authority_District_ID int,
	Urban_or_Rural_Area_ID int, 
	Road_Type int, 
	NguonDuLieu int,
	Number_of_Casualties int,
	CONSTRAINT Accident_Dim_PK PRIMARY KEY(ID)
)
go
create table Dim_Accident_Serverity
(
	ID int identity (1,1) not null,
	Accident_Severity_ID int,
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Accident_Serverity_Dim_PK PRIMARY KEY(ID)
)
go
create table Dim_Local_Authority_District
(
	ID int identity (1,1) not null,
	Local_Authority_District_ID int,
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Local_Authority_District_Dim_Pk PRIMARY KEY(ID)
)

go
alter table Fact_Number_of_Victim_Time add constraint FK_Time_Key1 foreign key (DayID) references Dim_Session(ID)
go
alter table Fact_Number_of_Victim_Time add constraint FK_Accident_Severity_ID foreign key (Accident_Severity_ID) references Dim_Accident_Serverity
go
alter table Fact_Number_of_Victim_Time add constraint FK_Local_Authority_District_ID foreign key (Local_Authority_ID) references Dim_Local_Authority_District
go
alter table Dim_Session add constraint FK_DateID foreign key (DayID) references Dim_Day(ID)
go
alter table Dim_Day add constraint FK_MonthID foreign key (MonthID) references Dim_Month(ID)
go
alter table Dim_Month add constraint FK_QuarterID foreign key (QuarterID) references Dim_Quarter(ID)
go
alter table Dim_Quarter add constraint FK_YearID foreign key (YearID) references Dim_Year(ID)
go
alter table Dim_Accident add constraint FK_Accident_ServerityID foreign key (Accident_Severity_ID) references Dim_Accident_Serverity(ID)
go
alter table Dim_Accident add constraint FK_Local_Authority_DistrictID foreign key (Local_Authority_District_ID) references Dim_Local_Authority_District(ID)
go
---3
create table Fact_Victim_Sex_Casualty
(
	ID int identity (1,1) not null,
	
	DayID int ,
	Sex_of_Casualty_ID int,
	
	Casualty_Type int, 
	Casualty_Severity_ID int, 
	Sum_Number_of_Casualties3 int,
	CONSTRAINT Victim_Table3 PRIMARY KEY (ID)
)
go
create table Dim_Sex_of_Casualty
(
	ID int identity (1,1) not null,
	Sex_of_Casualty_ID int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Sex_of_Casualty_Dimension_Pk PRIMARY KEY(ID)
)
go
create table Dim_Casualty
(	ID int identity (1,1) not null,
	Casualty_ID int, 
	Sex_of_Casualty_ID int, 
	Casualty_Type int, 
	Casualty_Severity_ID int, 
	Age_Band_of_Casualty_ID int, 
	NguonDuLieu int,
	CONSTRAINT Casualty_Pk PRIMARY KEY(ID)
)
go
create table Dim_Casualty_Type
(	ID int identity (1,1) not null,
	Casualty_Type int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Casualty_Type_Pk PRIMARY KEY(ID)
)
go
create table Dim_Casualty_Severity
(
	ID int identity (1,1) not null,
	Casualty_Severity_ID int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Casualty_Severity_Dim_Pk PRIMARY KEY(ID)
)
go
--------------------------

alter table Fact_Victim_Sex_Casualty add constraint FK_Time_Key3 foreign key (DayID) references Dim_Session(ID)
go
alter table Fact_Victim_Sex_Casualty add constraint FK_Sex_of_Casualty_ID3 foreign key (Sex_of_Casualty_ID) references Dim_Sex_of_Casualty(ID)
go
alter table Fact_Victim_Sex_Casualty add constraint FK_Casualty_Type3 foreign key (Casualty_Type) references Dim_Casualty_Type(ID)
go

go
alter table Fact_Victim_Sex_Casualty add constraint FK_Casualty_Severity_ID foreign key (Casualty_Severity_ID) references Dim_Casualty_Severity(ID)
go
---------------------
alter table Dim_Casualty add constraint FK_Casualty_Severity_ID1 foreign key (Casualty_Severity_ID) references Dim_Casualty_Severity(ID)
go
alter table Dim_Casualty add constraint FK_Casualty_Type foreign key (Casualty_Type) references Dim_Casualty_Type(ID)
go
alter table Dim_Casualty add constraint FK_Sex_of_Casualty foreign key (Sex_of_Casualty_ID) references Dim_Sex_of_Casualty(ID)
go

---4
/*create table Fact_Victim_Time_of_Date
(
	ID int identity (1,1) not null,
	DayID int,
	Accident_Severity_ID int,
	AccidentCountSession int,
	CONSTRAINT Victim_Table4 PRIMARY KEY ( ID)
)
go
alter table Fact_Victim_Time_of_Date add constraint FK_Accident_Index4 foreign key (Accident_Index) references Dim_Accident
go
alter table Fact_Victim_Time_of_Date add constraint FK_Accident_Severity_ID4 foreign key (Accident_Severity_ID) references Dim_Accident_Serverity
go
alter table Fact_Victim_Time_of_Date add constraint FK_DayID foreign key (DayID) references Dim_Session(ID)
go
*/
---5
create table Fact_Victim_Area_Road
(
	ID int identity (1,1) not null,

	DayID int,
	Accident_Severity_ID int,
	Urban_or_Rural_Area_ID int, 
	Road_Type int, 
	AccidentCountRoadType int,
	CONSTRAINT Victim_Table5 PRIMARY KEY (ID)
)
go
create table Dim_Urban_of_Rural_Area
(
	ID int identity (1,1) not null,
	Urban_or_Rural_Area_ID int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Urabn_or_Rural_Area_Pk PRIMARY KEY(ID)
)
go
create table Dim_Road_Type
(	ID int identity (1,1) not null,
	Road_Type int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Road_Type_Pk PRIMARY KEY(ID)
)


go
alter table Fact_Victim_Area_Road add constraint FK_Time_Key6 foreign key (DayID) references Dim_Session(ID)
go
alter table Fact_Victim_Area_Road add constraint FK_Accident_Severity_ID5 foreign key (Accident_Severity_ID) references Dim_Accident_Serverity(ID)
go
alter table Fact_Victim_Area_Road add constraint FK_Urban_or_Rural_Area_ID foreign key (Urban_or_Rural_Area_ID) references Dim_Urban_of_Rural_Area(ID)
go
alter table Fact_Victim_Area_Road add constraint FK_Road_Type foreign key (Road_Type) references Dim_Road_Type(ID)
go
------------------------------------------------------
alter table Dim_Accident add constraint FK_Urban_or_Rural_Area foreign key (Urban_or_Rural_Area_ID) references Dim_Urban_of_Rural_Area(ID)
go
alter table Dim_Accident add constraint FK_Road_Type1 foreign key (Road_Type) references Dim_Road_Type(ID)
go

---6
create table Fact_Victim_Casualty_Age
(
	ID int identity (1,1) not null,
	DayID int,
	Accident_Severity_ID int,
	Casualty_Type int, 
	AgeGroup varchar,
	Age_Band_of_Casualty_ID int, 
	Sum_Number_of_Casualties6 int,
	CONSTRAINT Victim_Table6 PRIMARY KEY (ID)
)
create table Dim_Age_Band_of_Casualty
(	ID int identity (1,1) not null,
	Age_Band_of_Casualty_ID int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Age_Pk PRIMARY KEY(ID)
)
go

alter table Fact_Victim_Casualty_Age add constraint FK_Time_Key7 foreign key (DayID) references Dim_Session(ID)
go
alter table Fact_Victim_Casualty_Age add constraint FK_Accident_Severity_ID6 foreign key (Accident_Severity_ID) references Dim_Accident_Serverity

go
alter table Fact_Victim_Casualty_Age add constraint FK_Casualty_Type1 foreign key (Casualty_Type) references Dim_Casualty_Type
go
alter table Fact_Victim_Casualty_Age add constraint FK_Age_Band_of_Casualty_ID foreign key (Age_Band_of_Casualty_ID) references Dim_Age_Band_of_Casualty
go
---------------------------------------------------------------------
alter table Dim_Casualty add constraint FK_Age_Band_of_Casualty foreign key (Age_Band_of_Casualty_ID) references Dim_Age_Band_of_Casualty(ID)
go
---7
create table Fact_Victim_Journey_Vehicle
(
	ID int identity (1,1) not null,
	
	DayID int,
	Vehicle_Type int, 
	Journey_Purpose_ID int,
	CountAccidentJourney int,
	CONSTRAINT Victim_Table7 PRIMARY KEY (ID)
)
go
create table Dim_Vehicle
(
	ID int identity (1,1) not null,
	Vehicle_ID int, 
	Vehicle_Type int, 
	Journey_Purpose_ID int,
	Accident_Index9 int,
	NguonDuLieu int
	CONSTRAINT Vehicle_Dimension_PK PRIMARY KEY(ID)
)
go
create table Dim_Vehicle_Type
(	ID int identity (1,1) not null,
	Vehicle_Type int, 
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Vehicle_Type_Pk PRIMARY KEY(ID)
)
create table Dim_Journey_Purpose
(
	ID int identity (1,1) not null,
	Journey_Purpose_ID int,
	Label nvarchar(255),
	NguonDuLieu int,
	CONSTRAINT Journey_Purpose_Pk PRIMARY KEY(ID)
)
go
alter table Fact_Victim_Journey_Vehicle add constraint FK_Fact_Victim_Journey_Vehicle_session foreign key (DayID) references Dim_Session(ID)
go

alter table Fact_Victim_Journey_Vehicle add constraint FK_Vehicle_Type foreign key (Vehicle_Type) references Dim_Vehicle_Type
go
alter table  Fact_Victim_Journey_Vehicle add constraint Journey_Purpose_ID foreign key (Journey_Purpose_ID) references Dim_Journey_Purpose
go
---------------------------------------------------------------------
alter table Dim_Vehicle add constraint FK_Vehicle_Type1 foreign key (Vehicle_Type) references Dim_Vehicle_Type(ID)
go
alter table Dim_Vehicle add constraint FK_Journey_Purpose foreign key (Journey_Purpose_ID) references Dim_Journey_Purpose(ID)
go
---9
create table Fact_Victim_Vehicle_Built_up_Road
(
	ID int identity (1,1) not null,
	
	DayID int,
	Accident_Severity_ID int,
	Vehicle_Type int,
	Build_up_Road_ID int,
	CountAccidentBuildUpRoad int,
	CONSTRAINT Victim_Table9 PRIMARY KEY (ID)
)
go
create table Dim_Accident_Built_up_Road
( 
	ID int identity (1,1) not null,
	
	Built_up_Road varchar(50),
	CONSTRAINT Accident_Dim9_PK PRIMARY KEY(ID)
)
/*go
alter table Fact_Victim_Vehicle_Built_up_Road add constraint FK_Accident_Index9 foreign key (Accident_Index9) references Dim_Accident_Built_up_Road
*/
go
alter table Fact_Victim_Vehicle_Built_up_Road add constraint FK_Time_Key9 foreign key (DayID) references Dim_Session(ID)
go
alter table Fact_Victim_Vehicle_Built_up_Road add constraint FK_Accident_Severity_ID9 foreign key (Accident_Severity_ID) references Dim_Accident_Serverity
go
alter table Fact_Victim_Vehicle_Built_up_Road add constraint FK_Vehicle_Type9 foreign key (Vehicle_Type) references Dim_Vehicle_Type
go


--11
/****** Object:  Table [dbo].[temp]    Script Date: 1/1/2022 9:08:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[temp](
	[codeUrband] [int] NULL,
	[Speed_limit] int NULL,
	[LSOA] [int] NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[Local_Authority_(District)] [int] NULL,
	[Number_of_Casualties] [int] NULL,
	[codeLocal] [int] NULL,
	[Date] [datetime] NULL,
	[Time] [time](7) NULL,
	[Accident_Index] [varchar](50) NULL,
	[codeAccidentServerity] [int] NULL,
	[codeRoadType] [int] NULL,
	[codeAgeBandOfCasual] [int] NULL,
	[codeCasualservety] [int] NULL,
	[codeCasuatype] [int] NULL,
	[codeSexofCasualty] [int] NULL,
	[IdIndex] [int] NULL,
	[codeJourney] [int] NULL,
	[codeVehicleType] [int] NULL,
	[Age_of_Driver] [varchar](50) NULL,
	[Engine_Capacity_(CC)] [varchar](50) NULL,
	[Age_of_Vehicle] [varchar](50) NULL,
	[Nam] [int] NULL,
	[Thang] [int] NULL,
	[Ngay] [int] NULL,
	[Buoi] [varchar](50) NULL,
	[Quy] [int] NULL,
	[AgeGroup] [varchar]  null,
	[BuiltUpRoad] [varchar]
) ON [PRIMARY]
GO




