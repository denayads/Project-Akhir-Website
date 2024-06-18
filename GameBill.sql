USE [master]
GO
/****** Object:  Database [GameBill]    Script Date: 06/18/2024 23:43:29 ******/
CREATE DATABASE [GameBill] ON  PRIMARY 
( NAME = N'GameBill', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GameBill.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GameBill_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GameBill_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GameBill] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameBill].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameBill] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GameBill] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GameBill] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GameBill] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GameBill] SET ARITHABORT OFF
GO
ALTER DATABASE [GameBill] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GameBill] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GameBill] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GameBill] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GameBill] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GameBill] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GameBill] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GameBill] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GameBill] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GameBill] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GameBill] SET  DISABLE_BROKER
GO
ALTER DATABASE [GameBill] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GameBill] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GameBill] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GameBill] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GameBill] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GameBill] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GameBill] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GameBill] SET  READ_WRITE
GO
ALTER DATABASE [GameBill] SET RECOVERY SIMPLE
GO
ALTER DATABASE [GameBill] SET  MULTI_USER
GO
ALTER DATABASE [GameBill] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GameBill] SET DB_CHAINING OFF
GO
USE [GameBill]
GO
/****** Object:  Table [dbo].[games]    Script Date: 06/18/2024 23:43:29 ******/
DROP TABLE [dbo].[games]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06/18/2024 23:43:29 ******/
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF_users_admin]
GO
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06/18/2024 23:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[admin] [int] NOT NULL CONSTRAINT [DF_users_admin]  DEFAULT ((0)),
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [user_name], [email], [password], [admin]) VALUES (1, N'admin', N'admin', N'Tf9Oo0DwqCPxXT9PAati6uDl2lecy4Ufjbnf6ExYsrN7iZA6dA4e4XLaeTpuedVg5ff5vQWKEqKAQz7W+kZRCg==', 1)
INSERT [dbo].[users] ([id], [user_name], [email], [password], [admin]) VALUES (2, N'mimin', N'mimin', N'Tf9Oo0DwqCPxXT9PAati6uDl2lecy4Ufjbnf6ExYsrN7iZA6dA4e4XLaeTpuedVg5ff5vQWKEqKAQz7W+kZRCg==', 1)
INSERT [dbo].[users] ([id], [user_name], [email], [password], [admin]) VALUES (3, N'user', N'user@gmail.com', N'Tf9Oo0DwqCPxXT9PAati6uDl2lecy4Ufjbnf6ExYsrN7iZA6dA4e4XLaeTpuedVg5ff5vQWKEqKAQz7W+kZRCg==', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[games]    Script Date: 06/18/2024 23:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[games](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[game_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[release_dates] [date] NOT NULL,
	[developers] [nvarchar](50) NOT NULL,
	[publishers] [nvarchar](50) NOT NULL,
	[game_modes] [nvarchar](50) NOT NULL,
	[themes] [nvarchar](50) NOT NULL,
	[franchises] [nvarchar](50) NULL,
	[player_perspectives] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games] ON
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [themes], [franchises], [player_perspectives]) VALUES (1, N'Grand Theft Auto V: Special Edition', N'The Grand Theft Auto V Special Edition includes: Full retail copy of Grand Theft Auto V; Collectible SteelBook with Exclusive Artwork - features custom color and metallic treatments to bring out the detail of the Michael, Trevor and Franklin artwork created exclusively for this SteelBook; Blueprint Map - exclusive, 21.5” x 26.75” map displays a blueprint view of Los Santos and Blaine County; Special Ability Boost - Michael, Franklin and Trevor each have a unique special ability. With this boost, the special ability bar will generate 25% faster; Stunt Plane Trials – single-player Stunt Plane Trials let players take on additional aerial challenges spread throughout Los Santos and Blaine County; Bonus Outfits, Tattoos and More - Michael, Franklin and Trevor get bonus outfits in their wardrobes, character specific tattoos at tattoo parlors, and special deals from shopkeepers across Los Santos and Blaine County; Additional Weapons - when visiting Ammunation stores in single-player, merchants will have special weapons in their inventory available for free: the Pistol .50, Bullpup Shotgun and melee Hammer.', CAST(0x97370B00 AS Date), N'Rockstar Games', N'Take-Two Interactive', N'Single player', N'Open world', N'Grand Theft Auto', N'Third person')
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [themes], [franchises], [player_perspectives]) VALUES (2, N'The Witcher 3: Wild Hunt - Game of the Year Edition', N'Become a professional monster slayer and embark on an adventure of epic proportions! Upon its release, The Witcher 3: Wild Hunt became an instant classic, claiming over 250 Game of the Year awards. Now you can enjoy this huge, over 100-hour long, open-world adventure along with both its story-driven expansions worth an extra 50 hours of gameplay. This edition includes all additional content - new weapons, armor, companion outfits, new game mode and side quests.', CAST(0xCC3B0B00 AS Date), N'CD Projekt RED', N'CD Projekt', N'Single player', N'Open world', N'The Witcher', N'Third person')
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [themes], [franchises], [player_perspectives]) VALUES (3, N'The Elder Scrolls V: Skyrim - Anniversary Edition', N'The Elder Scrolls V: Skyrim - Anniversary Edition contains the full game plus all three expansions and over 500 pieces of unique content from Creation Club, including pre-existing and new quests, dungeons, bosses, weapons, spells and more!', CAST(0x38430B00 AS Date), N'Bethesda Game Studios', N'Bethesda Softworks', N'Single player', N'Open world', N'The Elder Scrolls', N'Third person')
SET IDENTITY_INSERT [dbo].[games] OFF
