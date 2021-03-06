USE [master]
GO
/****** Object:  Database [DormManagement]    Script Date: 3/21/2015 11:09:43 PM ******/
CREATE DATABASE [DormManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DormManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DormManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DormManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DormManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DormManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DormManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DormManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DormManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DormManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DormManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DormManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [DormManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DormManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DormManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DormManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DormManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DormManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DormManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DormManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DormManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DormManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DormManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DormManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DormManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DormManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DormManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DormManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DormManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DormManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [DormManagement] SET  MULTI_USER 
GO
ALTER DATABASE [DormManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DormManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DormManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DormManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DormManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DormManagement', N'ON'
GO
USE [DormManagement]
GO
/****** Object:  Table [dbo].[ClosedItem]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClosedItem](
	[ClosedItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[LostItem_ID] [int] NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ClosedItem] PRIMARY KEY CLUSTERED 
(
	[ClosedItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DamagedItem]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DamagedItem](
	[DamagedItem_ID] [int] NOT NULL,
	[Note] [nvarchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Dorm_ID] [int] IDENTITY(1,1) NOT NULL,
	[Room_ID] [int] NOT NULL,
 CONSTRAINT [PK_DamagedItem] PRIMARY KEY CLUSTERED 
(
	[DamagedItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_ID] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](50) NOT NULL,
	[University] [nvarchar](100) NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dorm]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dorm](
	[Dorm_ID] [int] IDENTITY(1,1) NOT NULL,
	[DormName] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Dorm] PRIMARY KEY CLUSTERED 
(
	[Dorm_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Family]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Family](
	[Family_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Family] PRIMARY KEY CLUSTERED 
(
	[Family_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hostel]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostel](
	[Hostel_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Dorm_ID] [int] NOT NULL,
	[Room_ID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Hostel] PRIMARY KEY CLUSTERED 
(
	[Hostel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LostItem]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LostItem](
	[LostItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Dorm_ID] [int] NOT NULL,
 CONSTRAINT [PK_LostItem] PRIMARY KEY CLUSTERED 
(
	[LostItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NOT NULL,
	[Room_ID] [int] NOT NULL,
	[RemainingDebt] [decimal](5, 2) NOT NULL,
	[PaymentType_ID] [int] NOT NULL,
	[Dorm_ID] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Room_ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [int] NOT NULL,
	[RoomType_ID] [int] NULL,
	[Dorm_ID] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Room_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomType_ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Price] [decimal](5, 2) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[StudentSurname] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Family_ID] [int] NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[Birthdate] [datetime] NULL,
	[TC_ID] [nvarchar](12) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ClosedItem]  WITH CHECK ADD  CONSTRAINT [FK_ClosedItem_LostItem] FOREIGN KEY([LostItem_ID])
REFERENCES [dbo].[LostItem] ([LostItem_ID])
GO
ALTER TABLE [dbo].[ClosedItem] CHECK CONSTRAINT [FK_ClosedItem_LostItem]
GO
ALTER TABLE [dbo].[ClosedItem]  WITH CHECK ADD  CONSTRAINT [FK_ClosedItem_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[ClosedItem] CHECK CONSTRAINT [FK_ClosedItem_Student]
GO
ALTER TABLE [dbo].[DamagedItem]  WITH CHECK ADD  CONSTRAINT [FK_DamagedItem_Dorm] FOREIGN KEY([Dorm_ID])
REFERENCES [dbo].[Dorm] ([Dorm_ID])
GO
ALTER TABLE [dbo].[DamagedItem] CHECK CONSTRAINT [FK_DamagedItem_Dorm]
GO
ALTER TABLE [dbo].[DamagedItem]  WITH CHECK ADD  CONSTRAINT [FK_DamagedItem_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[DamagedItem] CHECK CONSTRAINT [FK_DamagedItem_Room]
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Hostel_Dorm] FOREIGN KEY([Dorm_ID])
REFERENCES [dbo].[Dorm] ([Dorm_ID])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FK_Hostel_Dorm]
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Hostel_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FK_Hostel_Room]
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Hostel_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FK_Hostel_Student]
GO
ALTER TABLE [dbo].[LostItem]  WITH CHECK ADD  CONSTRAINT [FK_LostItem_Dorm] FOREIGN KEY([Dorm_ID])
REFERENCES [dbo].[Dorm] ([Dorm_ID])
GO
ALTER TABLE [dbo].[LostItem] CHECK CONSTRAINT [FK_LostItem_Dorm]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Dorm] FOREIGN KEY([Dorm_ID])
REFERENCES [dbo].[Dorm] ([Dorm_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Dorm]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([Room_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Room]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Student]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Dorm] FOREIGN KEY([Dorm_ID])
REFERENCES [dbo].[Dorm] ([Dorm_ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Dorm]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomType_ID])
REFERENCES [dbo].[RoomType] ([RoomType_ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([Department_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Family] FOREIGN KEY([Family_ID])
REFERENCES [dbo].[Family] ([Family_ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Family]
GO
/****** Object:  StoredProcedure [dbo].[Get_Dorm]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Dorm]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DormName from Dorm
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Room]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Room]
	@DormName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoomNo from Room where Dorm_ID=(select Dorm_ID from Dorm where DormName=@DormName)
END

GO
/****** Object:  StoredProcedure [dbo].[Get_RoomType]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_RoomType] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TypeName from RoomType
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Dorm]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Dorm]
	@dormname nvarchar(50), 
	@location nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure her
	Insert into Dorm(DormName, Location) values (@dormname, @location)
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Room]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Room]
	
	@roomno int,
	@roomtype nvarchar(50),
	@DormName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure her
	insert into Room(RoomNo, RoomType_ID,Dorm_ID) values 
(@roomno,(select RoomType_ID from RoomType where TypeName=@roomtype)
,(select Dorm_ID from Dorm where DormName=@DormName))
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_RoomType]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_RoomType]
	@typename nvarchar(50), 
	@roomprice decimal(5,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure her
	Insert into RoomType(TypeName, Price) values (@typename, @roomprice)
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Student]    Script Date: 3/21/2015 11:09:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Student]
	-- Add the parameters for the stored procedure here
@uni nvarchar (50),
@deptname nvarchar (50),
@grade int,
@Name nvarchar(50),
@Surname nvarchar(50),
@Phone nvarchar(50),
@SName nvarchar(50),
@SSurname nvarchar(50),
@Mail nvarchar(50),
@SPhone nvarchar(50),
@Gender nvarchar(50),
@Birthdate datetime,
@TC int,
@DormName nvarchar(50),
@RoomNo int,
@StartDate datetime,
@EndDate datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Department(University, DepName, Grade) Values (@uni, @deptname, @grade) 
	insert into Family(Name,Surname,Phone) Values (@Name,@Surname,@Phone)
		insert into Student(StudentName,StudentSurname,Mail,Phone,Gender,Birthdate,TC_ID,Family_ID,Department_ID) 
		values(@SName,@SSurname,@Mail,@Phone,@Gender,@Birthdate,@TC,@@IDENTITY,@@IDENTITY)
	insert into Hostel(Student_ID,Dorm_ID,Room_ID,StartDate,EndDate) 
	values((select Student_ID from Student where StudentName=@SName and StudentSurname=@SSurname),
			(select Dorm_ID from Dorm where DormName=@DormName),
			(select Room_ID from Room where RoomNo=@RoomNo),@StartDate,@EndDate)


end

GO
USE [master]
GO
ALTER DATABASE [DormManagement] SET  READ_WRITE 
GO
