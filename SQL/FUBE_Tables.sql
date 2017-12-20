USE [master]
GO

/****** Object:  Database [FUBE]    Script Date: 12/15/2017 10:33:06 PM ******/
CREATE DATABASE [FUBE]
/*
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FUBE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FUBE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FUBE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FUBE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
*/
GO


ALTER DATABASE [FUBE] SET COMPATIBILITY_LEVEL = 120

/*
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FUBE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
*/

ALTER DATABASE [FUBE] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FUBE] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FUBE] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FUBE] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FUBE] SET ARITHABORT OFF 
GO

ALTER DATABASE [FUBE] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [FUBE] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FUBE] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FUBE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FUBE] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FUBE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FUBE] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FUBE] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FUBE] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FUBE] SET  DISABLE_BROKER 
GO

ALTER DATABASE [FUBE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FUBE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FUBE] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FUBE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FUBE] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FUBE] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FUBE] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FUBE] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [FUBE] SET  MULTI_USER 
GO

ALTER DATABASE [FUBE] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [FUBE] SET DB_CHAINING OFF 
GO

ALTER DATABASE [FUBE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [FUBE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [FUBE] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [FUBE] SET  READ_WRITE 
GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 12/15/2017 10:33:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[Tubes]    Script Date: 12/15/2017 10:33:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tubes](
	[TubeID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Image] [image] NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Tubes] PRIMARY KEY CLUSTERED 
(
	[TubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 12/15/2017 10:34:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[ShipDate] [date] NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/15/2017 10:34:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItems](
	[OrderID] [int] NULL,
	[TubeID] [int] NULL,
	[Quantity] [numeric](3, 0) NULL,
	[SizeMultiplier] [numeric](3, 2) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[Ingredients]    Script Date: 12/15/2017 10:34:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Ingredients](
	[IngredientID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [float] NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [FUBE]
GO

/****** Object:  Table [dbo].[Admin]    Script Date: 12/15/2017 10:34:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


