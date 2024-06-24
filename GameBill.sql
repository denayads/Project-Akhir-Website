USE [master]
GO
/****** Object:  Database [GameBill]    Script Date: 06/20/2024 18:16:03 ******/
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
/****** Object:  Table [dbo].[games]    Script Date: 06/20/2024 18:16:04 ******/
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
	[franchises] [nvarchar](50) NULL,
	[player_perspectives] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games] ON
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives]) VALUES (1, N'Grand Theft Auto V: Special Edition', N'The Grand Theft Auto V Special Edition includes: Full retail copy of Grand Theft Auto V; Collectible SteelBook with Exclusive Artwork - features custom color and metallic treatments to bring out the detail of the Michael, Trevor and Franklin artwork created exclusively for this SteelBook; Blueprint Map - exclusive, 21.5” x 26.75” map displays a blueprint view of Los Santos and Blaine County; Special Ability Boost - Michael, Franklin and Trevor each have a unique special ability. With this boost, the special ability bar will generate 25% faster; Stunt Plane Trials – single-player Stunt Plane Trials let players take on additional aerial challenges spread throughout Los Santos and Blaine County; Bonus Outfits, Tattoos and More - Michael, Franklin and Trevor get bonus outfits in their wardrobes, character specific tattoos at tattoo parlors, and special deals from shopkeepers across Los Santos and Blaine County; Additional Weapons - when visiting Ammunation stores in single-player, merchants will have special weapons in their inventory available for free: the Pistol .50, Bullpup Shotgun and melee Hammer.', CAST(0x97370B00 AS Date), N'Rockstar Games', N'Take-Two Interactive', N'Single player', N'Grand Theft Auto', N'Third person')
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives]) VALUES (2, N'The Witcher 3: Wild Hunt - Game of the Year Edition', N'The Witcher 3: Wild Hunt is a story-driven, open world adventure set in a dark fantasy universe. You are Geralt of Rivia, mercenary monster slayer. At your disposal is every tool of the trade: razor-sharp swords, lethal mixtures, stealthy crossbows, and powerful combat magic. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down the Child of Prophecy, a living weapon that can alter the shape of the world. The Complete Edition contains every piece of downloadable content released for the game, including two massive story expansions: Hearts of Stone & Blood and Wine. It''s the perfect opportunity to enter this world for the first time or relive the adventure – on the go!', CAST(0xCC3B0B00 AS Date), N'CD Projekt RED', N'CD Projekt', N'Single player', N'The Witcher', N'Third person')
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives]) VALUES (3, N'The Elder Scrolls V: Skyrim - Anniversary Edition', N'The Elder Scrolls V: Skyrim - Anniversary Edition contains the full game plus all three expansions and over 500 pieces of unique content from Creation Club, including pre-existing and new quests, dungeons, bosses, weapons, spells and more!', CAST(0x38430B00 AS Date), N'Bethesda Game Studios', N'Bethesda Softworks', N'Single player', N'The Elder Scrolls', N'Third person')
SET IDENTITY_INSERT [dbo].[games] OFF
/****** Object:  Table [dbo].[users]    Script Date: 06/20/2024 18:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[admin] [int] NOT NULL,
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
/****** Object:  Table [dbo].[platforms]    Script Date: 06/20/2024 18:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[platforms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[platforms_name] [nvarchar](50) NOT NULL,
	[release_dates] [date] NOT NULL,
	[developers] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_platforms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[platforms] ON
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (1, N'PC (Microsoft Windows)', CAST(0x13430B00 AS Date), N'Microsoft')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (2, N'PlayStation 3', CAST(0x3B360B00 AS Date), N'PlayStation')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (3, N'Xbox 360', CAST(0xF5320B00 AS Date), N'Xbox')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (4, N'PlayStation 4', CAST(0x153C0B00 AS Date), N'PlayStation')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (5, N'Xbox One', CAST(0xA13F0B00 AS Date), N'Xbox')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (6, N'Nintendo Switch', CAST(0x77440B00 AS Date), N'Nintendo')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (7, N'PlayStation 5', CAST(0xD3410B00 AS Date), N'PlayStation')
INSERT [dbo].[platforms] ([id], [platforms_name], [release_dates], [developers]) VALUES (8, N'Xbox Series X|S', CAST(0xDF410B00 AS Date), N'Xbox')
SET IDENTITY_INSERT [dbo].[platforms] OFF
/****** Object:  Table [dbo].[genre]    Script Date: 06/20/2024 18:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[genre_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[genre] ON
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (1, N'Action')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (2, N'Adventure')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (3, N'Open world')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (4, N'Role-playing (RPG)')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (5, N'Racing')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (6, N'Shooter')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (7, N'Sport')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (8, N'Fantasy')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (9, N'Historical')
SET IDENTITY_INSERT [dbo].[genre] OFF
/****** Object:  Table [dbo].[games_platforms]    Script Date: 06/20/2024 18:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[games_platforms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_games] [bigint] NOT NULL,
	[id_platforms] [bigint] NOT NULL,
 CONSTRAINT [PK_games_platforms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games_platforms] ON
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (1, 1, 2)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (2, 1, 3)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (3, 1, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (4, 1, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (5, 1, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (6, 1, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (7, 1, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (8, 2, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (9, 2, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (10, 2, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (11, 2, 6)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (12, 2, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (13, 2, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (14, 3, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (15, 3, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (16, 3, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (17, 3, 6)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (18, 3, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (19, 3, 8)
SET IDENTITY_INSERT [dbo].[games_platforms] OFF
/****** Object:  Table [dbo].[games_genre]    Script Date: 06/20/2024 18:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[games_genre](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_games] [bigint] NOT NULL,
	[id_genre] [bigint] NOT NULL,
 CONSTRAINT [PK_games_genre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games_genre] ON
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (1, 1, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (2, 1, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (3, 1, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (4, 1, 5)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (5, 1, 6)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (6, 1, 7)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (7, 2, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (8, 2, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (9, 2, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (10, 2, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (11, 2, 8)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (12, 2, 9)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (13, 3, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (14, 3, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (15, 3, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (16, 3, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (17, 3, 8)
SET IDENTITY_INSERT [dbo].[games_genre] OFF
/****** Object:  Default [DF_users_admin]    Script Date: 06/20/2024 18:16:04 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_admin]  DEFAULT ((0)) FOR [admin]
GO
/****** Object:  ForeignKey [FK_games_platforms_games]    Script Date: 06/20/2024 18:16:04 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_games]
GO
/****** Object:  ForeignKey [FK_games_platforms_platforms]    Script Date: 06/20/2024 18:16:04 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_platforms] FOREIGN KEY([id_platforms])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_platforms]
GO
/****** Object:  ForeignKey [FK_games_genre_games]    Script Date: 06/20/2024 18:16:04 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_games]
GO
/****** Object:  ForeignKey [FK_games_genre_genre]    Script Date: 06/20/2024 18:16:04 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_genre] FOREIGN KEY([id_genre])
REFERENCES [dbo].[genre] ([id])
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_genre]
GO
