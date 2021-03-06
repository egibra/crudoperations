/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2012 (11.0.2100)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [LoginDataBase]    Script Date: 2017-09-09 14:14:17 ******/
CREATE DATABASE [LoginDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LoginDataBase', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LoginDataBase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LoginDataBase_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LoginDataBase_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LoginDataBase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoginDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoginDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoginDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoginDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoginDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoginDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoginDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoginDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoginDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoginDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoginDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoginDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoginDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoginDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoginDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoginDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoginDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoginDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoginDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoginDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoginDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoginDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoginDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoginDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LoginDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [LoginDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoginDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LoginDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LoginDataBase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LoginDataBase]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2017-09-09 14:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL,
	[Role] [int] NULL,
	[Salary] [float] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (31, N'manager', N'HQJYwkQKjRnnFikrIx4xkA==', N'manager', N'manager', 2, 700)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (32, N'worker', N'thgi6DV9yv936qzPNI2RNA==', N'worker', N'worker', 3, 250)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (1009, N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'admin', N'admin', 1, 1100)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2004, N'jonas', N'661kFJzHZ7om7waYGSef1Q==', N'worker1', N'worker1', 3, 100)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2005, N'worker2', N'AZJbeJLiyhlJk6/dIKfHYQ==', N'worker2', N'worker2', 3, 200)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2007, N'worker4', N'IhOTE1vPKnVbisnaQDZcZw==', N'worker4', N'worker5', 3, 2000)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2008, N'worker5', N'aiHbitt1cstdGxXfqkRp5A==', N'worker5', N'worker5', 3, 200)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2009, N'worker6', N'FrfiHJZNLguYpaRxKg3yQQ==', N'worker6', N'worker6', 3, 300)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2010, N'worker7', N'4pVOGr8LcTjZ3Xo8E/Wq7A==', N'worker7', N'worker7', 3, 700)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2011, N'worker8', N'/JQOqwyZjcrDKJaefZIbMg==', N'worker8', N'worker8', 3, 800)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2012, N'worker9', N'YRu9UKsVmq+yZYTBFuJYfg==', N'worker9', N'worker9', 3, 900)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2013, N'worker10', N'3hk9VZBWuSxSzwLsO7E63w==', N'worker10', N'worker10', 3, 1000)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2014, N'worker11', N'YckRYto7HEthdmtdXVf5nA==', N'worker11', N'worker11', 3, 1100)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2015, N'worker12', N'CBroIOql+vFMtgWMsJZ5SQ==', N'worker12', N'worker12', 3, 1200)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Surname], [Role], [Salary]) VALUES (2016, N'worker13', N'3YVpMWhjexOHOJ74qPl5Cg==', N'worker13', N'worker13', 3, 1300)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [LoginDataBase] SET  READ_WRITE 
GO
