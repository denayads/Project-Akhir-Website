USE [master]
GO
/****** Object:  Database [GameBill]    Script Date: 06/26/2024 14:12:03 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 06/26/2024 14:12:04 ******/
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
/****** Object:  Table [dbo].[platforms]    Script Date: 06/26/2024 14:12:04 ******/
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
/****** Object:  Table [dbo].[genre]    Script Date: 06/26/2024 14:12:04 ******/
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
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (5, N'Science fiction')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (6, N'Shooter')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (7, N'Sandbox')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (8, N'Puzzle')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (9, N'Horror')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (10, N'Mystery')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (11, N'Survival')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (12, N'Hack and slash/Beat ''em up')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (13, N'Stealth')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (14, N'Drama')
SET IDENTITY_INSERT [dbo].[genre] OFF
/****** Object:  Table [dbo].[games]    Script Date: 06/26/2024 14:12:04 ******/
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
	[img_location] [nvarchar](max) NULL,
	[id_users] [bigint] NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games] ON
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [img_location], [id_users]) VALUES (1, N'Cyberpunk 2077', N'Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality. You can customize your character’s cyberware, skillset and playstyle, and explore a vast city where the choices you make shape the story and the world around you.', CAST(0xE7410B00 AS Date), N'CD Projekt RED', N'CD Projekt', N'Single player', N'Cyberpunk', N'First person', NULL, 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [img_location], [id_users]) VALUES (2, N'Resident Evil 4', N'Resident Evil 4 is a remake of the 2005 original Resident Evil 4 reimagined for 2023 to bring state-of-the-art survival horror. Resident Evil 4 preserves the essence of the original game, while introducing modernized gameplay, a reimagined storyline,', CAST(0x2A450B00 AS Date), N'Capcom Development Division 1', N'Capcom', N'Single player', N'Resident Evil', N'Third person', NULL, 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [img_location], [id_users]) VALUES (3, N'Alan Wake II', N'Saga Anderson arrives to investigate ritualistic murders in a small town. Alan Wake pens a dark story to shape the reality around him. These two heroes are somehow connected. Can they become the heroes they need to be?', CAST(0x03460B00 AS Date), N'Remedy Entertainment', N'Epic Games', N'Single player', N'Alan Wake', N'Third person', NULL, 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [img_location], [id_users]) VALUES (4, N'Marvel''s Spider-Man 2', N'Marvel''s Spider-Man 2 is the next game in the critically acclaimed Marvel''s Spider-Man franchise. Developed by Insomniac Games in collaboration with PlayStation and Marvel Games.', CAST(0xFC450B00 AS Date), N'Insomniac Games', N'Sony Interactive Entertainment', N'Single player', N'Marvel''s Spider-Man', N'Third person', NULL, 2)
SET IDENTITY_INSERT [dbo].[games] OFF
/****** Object:  Table [dbo].[games_platforms]    Script Date: 06/26/2024 14:12:04 ******/
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
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (1, 1, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (2, 1, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (3, 1, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (4, 1, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (5, 1, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (6, 1, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (7, 1, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (8, 2, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (9, 2, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (10, 2, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (11, 2, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (12, 3, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (13, 3, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (14, 3, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (15, 4, 7)
SET IDENTITY_INSERT [dbo].[games_platforms] OFF
/****** Object:  Table [dbo].[games_genre]    Script Date: 06/26/2024 14:12:04 ******/
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
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (4, 1, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (5, 1, 5)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (6, 1, 6)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (7, 1, 7)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (8, 2, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (9, 2, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (10, 2, 6)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (11, 2, 8)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (12, 2, 9)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (13, 2, 10)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (14, 3, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (15, 3, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (16, 3, 6)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (17, 3, 9)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (18, 3, 11)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (19, 4, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (20, 4, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (21, 4, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (22, 4, 12)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (23, 4, 13)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (24, 4, 14)
SET IDENTITY_INSERT [dbo].[games_genre] OFF
/****** Object:  Default [DF_users_admin]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_admin]  DEFAULT ((0)) FOR [admin]
GO
/****** Object:  ForeignKey [FK_games_users]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[games]  WITH CHECK ADD  CONSTRAINT [FK_games_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[games] CHECK CONSTRAINT [FK_games_users]
GO
/****** Object:  ForeignKey [FK_games_platforms_games]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_games]
GO
/****** Object:  ForeignKey [FK_games_platforms_platforms]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_platforms] FOREIGN KEY([id_platforms])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_platforms]
GO
/****** Object:  ForeignKey [FK_games_genre_games]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_games]
GO
/****** Object:  ForeignKey [FK_games_genre_genre]    Script Date: 06/26/2024 14:12:04 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_genre] FOREIGN KEY([id_genre])
REFERENCES [dbo].[genre] ([id])
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_genre]
GO
