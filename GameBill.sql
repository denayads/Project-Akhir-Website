USE [master]
GO
/****** Object:  Database [GameBill]    Script Date: 07/31/2024 18:37:01 ******/
CREATE DATABASE [GameBill] ON  PRIMARY 
( NAME = N'GameBill', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GameBill.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GameBill_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GameBill_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[users]    Script Date: 07/31/2024 18:37:02 ******/
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
/****** Object:  Table [dbo].[platforms]    Script Date: 07/31/2024 18:37:02 ******/
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
/****** Object:  Table [dbo].[genre]    Script Date: 07/31/2024 18:37:02 ******/
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
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (15, N'Fantasy')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (16, N'Comedy')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (17, N'Historical')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (18, N'Fighting')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (19, N'Arcade')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (20, N'Strategy')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (21, N'Turn-based strategy (TBS)')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (22, N'Tactical')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (23, N'Warfare')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (24, N'Simulator')
INSERT [dbo].[genre] ([id], [genre_name]) VALUES (25, N'Sport')
SET IDENTITY_INSERT [dbo].[genre] OFF
/****** Object:  Table [dbo].[games]    Script Date: 07/31/2024 18:37:02 ******/
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
	[prices] [money] NULL,
	[img_location] [nvarchar](max) NULL,
	[id_users] [bigint] NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[games] ON
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (1, N'Cyberpunk 2077', N'Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality. You can customize your character’s cyberware, skillset and playstyle, and explore a vast city where the choices you make shape the story and the world around you.', CAST(0xE7410B00 AS Date), N'CD Projekt RED', N'CD Projekt', N'Single player', N'Cyberpunk', N'First person', 699999.0000, N'assets/img/Cyberpunk2077_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (2, N'Resident Evil 4', N'Resident Evil 4 is a remake of the 2005 original Resident Evil 4 reimagined for 2023 to bring state-of-the-art survival horror. Resident Evil 4 preserves the essence of the original game, while introducing modernized gameplay, a reimagined storyline,', CAST(0x2A450B00 AS Date), N'Capcom Development Division 1', N'Capcom', N'Single player', N'Resident Evil', N'Third person', 595999.0000, N'assets/img/ResidentEvil4_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (3, N'Alan Wake II', N'Saga Anderson arrives to investigate ritualistic murders in a small town. Alan Wake pens a dark story to shape the reality around him. These two heroes are somehow connected. Can they become the heroes they need to be?', CAST(0x03460B00 AS Date), N'Remedy Entertainment', N'Epic Games', N'Single player', N'Alan Wake', N'Third person', 570500.0000, N'assets/img/AlanWake2_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (4, N'Marvel''s Spider-Man 2', N'Marvel''s Spider-Man 2 is the next game in the critically acclaimed Marvel''s Spider-Man franchise. Developed by Insomniac Games in collaboration with PlayStation and Marvel Games.', CAST(0xFC450B00 AS Date), N'Insomniac Games', N'Sony Interactive Entertainment', N'Single player', N'Marvel''s Spider-Man', N'Third person', 800000.0000, N'assets/img/MarvelsSpiderMan2_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (5, N'One Piece Odyssey', N'One Piece Odyssey is an RPG that puts players in control of Luffy and the other Straw Hat Pirates in an open world. You can travel around an island embarking on quests, exploring dungeons, solving puzzles and battling creatures in turn-based combat. During fights, the crew is divided up between active members and reserve members. All characters receive EXP, regardless of whether they are part of the active party or not.', CAST(0xE3440B00 AS Date), N'ILCA', N'Bandai Namco Entertainment', N'Single player', N'One Piece', N'Third person', 599000.0000, N'assets/img/OnePieceOdyssey_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (6, N'God of War Ragnarök: Valhalla', N'God of War Ragnarök: Valhalla is a free DLC that introduces a new mode that uses elements of the roguelite genre. Players progress through a series of trials set in procedurally generated levels, where they must choose a relic, shield, and rage ability for each trial run. After completing a challenge within a trial, players can opt for upgrading their weapon, relic, or stats, but these enhancements only apply to that specific trial run. Each run and the completion of specific gameplay challenges unlock permanent rewards. If a player dies, they restart the trial from the beginning. The downloadable content (DLC) also introduces new enemies, including new and familiar ones from the Greek era games like cyclopes and minotaurs.', CAST(0x31460B00 AS Date), N'SIE Santa Monica Studio', N'SIE Santa Monica Studio', N'Single Player', N'God of War', N'Third person', 879000.0000, NULL, 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (7, N'Dead Space', N'The sci-fi survival horror classic Dead Space returns, completely rebuilt from the ground up by Motive Studios to offer a deeper and more immersive experience. Harnessing the power of the Frostbite game engine and next generation consoles, this remake brings jaw-dropping visual fidelity and improvements to gameplay while staying true to the original.', CAST(0xF2440B00 AS Date), N'Motive Studios', N'Electronic Arts', N'Single player', N'Dead Space', N'Third person', 659000.0000, N'assets/img/DeadSpace_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (8, N'Star Wars Jedi: Survivor', N'The story of Cal Kestis continues in Star Wars Jedi: Survivor, a third-person, galaxy-spanning, action-adventure game from Respawn Entertainment, developed in collaboration with Lucasfilm Games. This narratively driven, single-player title picks up five years after the events of Star Wars Jedi: Fallen Order and follows Cal’s increasingly desperate fight as the galaxy descends further into darkness. Pushed to the edges of the galaxy by the Empire, Cal will find himself surrounded by threats new and familiar. As one of the last surviving Jedi Knights, Cal is driven to make a stand during the galaxy’s darkest times — but how far is he willing to go to protect himself, his crew, and the legacy of the Jedi Order?', CAST(0x4D450B00 AS Date), N'Respawn Entertainment', N'Electronic Arts', N'Single player', N'Star Wars', N'Third person', 759000.0000, N'assets/img/StarWarsJediSurvivor_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (9, N'Street Fighter 6', N'The evolution of fighting games starts with our traditional Fighting Ground, and then we''re turning the genre on its head with World Tour and Battle Hub for a total of three modes where anyone can play to their liking.

No one starts off as a champion. You get there step by step, punch by punch.
Take up the challenge and bring your game to the next level.', CAST(0x70450B00 AS Date), N'Capcom', N'Capcom', N'Single player', N'Street Fighter', N'Side view', 830999.0000, N'assets/img/StreetFighter6_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (10, N'Hogwarts Legacy', N'Hogwarts Legacy is an immersive, open-world action RPG set in the world first introduced in the Harry Potter books. Now you can take control of the action and be at the center of your own adventure in the wizarding world. Embark on a journey through familiar and new locations as you explore and discover fantastic beasts, customize your character and craft potions, master spell casting, upgrade talents, and become the wizard you want to be. Discover the feeling of living at Hogwarts as you make allies, battle Dark wizards, and ultimately decide the fate of the wizarding world. Your legacy is what you make of it.', CAST(0x00450B00 AS Date), N'Avalanche Software', N'Portkey Games', N'Single player', N'Harry Potter', N'Third person', 799000.0000, N'assets/img/HogwartsLegacy_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (11, N'Like a Dragon Gaiden: The Man Who Erased His Name', N'This game covers Kiryu''s story between Like a Dragon 7 and Like a Dragon 8.', CAST(0x10460B00 AS Date), N'Ryū Ga Gotoku Studios', N'Sega', N'Single player', N'Yakuza: Like a Dragon', N'Third person', 510000.0000, N'assets/img/LikeaDragonGaiden_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (12, N'Like a Dragon: Ishin!', N'Being remade from the ground up in UE4, this Yakuza spin-off returns us to feudal Japan in this remake for PlayStation 5, PlayStation 4, Xbox Series X|S, Xbox One, Windows, and Steam!

Like a Dragon: Ishin! will be a remake of Ryuu ga Gotoku Ishin! from 22 February 2014. The original game only released domestically in Japan, but the remake will release globally in February 2023.', CAST(0x0B450B00 AS Date), N'Ryū Ga Gotoku Studios', N'Sega', N'Single player', N'Yakuza: Like a Dragon', N'Third person', 648000.0000, N'assets/img/LikeaDragonIshin_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (13, N'Jagged Alliance 3', N'The country of Grand Chien is thrown into chaos when the elected president goes missing and the paramilitary force known as "the Legion" seizes control. Hire mercenaries, meet interesting characters, and fight in tactically deep turn-based combat in this true successor to a beloved franchise.', CAST(0x9A450B00 AS Date), N'Haemimont Games', N'THQ Nordic', N'Single player', N'Jagged Alliance', N'Bird view / Isometric', 399999.0000, N'assets/img/JaggedAlliance3_1.jpg', 1)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (14, N'Football Manager 2024', N'Progress never stops when you''re pursuing footballing greatness. Gameplay upgrades empower you to develop a blueprint for success on and off the pitch. Pre-order for 10% off and Early Access*.', CAST(0x0D460B00 AS Date), N'Sports Interactive', N'Sega', N'Single player', N'Football Manager', N'-', 649999.0000, N'assets/img/FootballManager2024_1.jpg', 2)
INSERT [dbo].[games] ([id], [game_name], [description], [release_dates], [developers], [publishers], [game_modes], [franchises], [player_perspectives], [prices], [img_location], [id_users]) VALUES (15, N'Wartales', N'Wartales is an open world RPG in which you lead a group of mercenaries in their search for wealth across a massive medieval universe. Explore the world, recruit companions, collect bounties and unravel the secrets of the tombs of the ancients!', CAST(0x3D450B00 AS Date), N'Shiro Games', N'Shiro Unlimited', N'Single player', N'-', N'Bird view / Isometric', 379999.0000, N'assets/img/Wartales_1.jpg', 1)
SET IDENTITY_INSERT [dbo].[games] OFF
/****** Object:  Table [dbo].[checkout]    Script Date: 07/31/2024 18:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_order] [nvarchar](50) NOT NULL,
	[id_games] [bigint] NOT NULL,
	[id_users] [bigint] NOT NULL,
	[dates] [date] NOT NULL,
	[img_location] [nvarchar](max) NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_checkout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[checkout] ON
INSERT [dbo].[checkout] ([id], [id_order], [id_games], [id_users], [dates], [img_location], [status]) VALUES (1, N'GB/3/14.07.2024.10.49.28', 2, 3, CAST(0x08470B00 AS Date), N'assets/img/Bukti1.jpg', N'Payment verified')
INSERT [dbo].[checkout] ([id], [id_order], [id_games], [id_users], [dates], [img_location], [status]) VALUES (2, N'GB/3/14.07.2024.10.49.28', 1, 3, CAST(0x08470B00 AS Date), N'assets/img/Bukti1.jpg', N'Payment verified')
INSERT [dbo].[checkout] ([id], [id_order], [id_games], [id_users], [dates], [img_location], [status]) VALUES (3, N'GB/3/28.07.2024.06.35.10', 1, 3, CAST(0x16470B00 AS Date), NULL, N'Waiting for payment')
INSERT [dbo].[checkout] ([id], [id_order], [id_games], [id_users], [dates], [img_location], [status]) VALUES (4, N'GB/3/28.07.2024.06.35.10', 3, 3, CAST(0x16470B00 AS Date), NULL, N'Waiting for payment')
SET IDENTITY_INSERT [dbo].[checkout] OFF
/****** Object:  Table [dbo].[cart]    Script Date: 07/31/2024 18:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_games] [bigint] NOT NULL,
	[id_users] [bigint] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[games_platforms]    Script Date: 07/31/2024 18:37:02 ******/
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
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (16, 5, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (17, 5, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (18, 5, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (19, 5, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (20, 6, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (21, 6, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (22, 6, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (23, 7, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (24, 7, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (25, 7, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (26, 8, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (27, 8, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (28, 8, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (29, 9, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (30, 9, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (31, 9, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (32, 9, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (33, 9, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (34, 10, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (35, 10, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (36, 10, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (37, 10, 6)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (38, 10, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (39, 10, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (40, 11, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (41, 11, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (42, 11, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (43, 11, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (44, 11, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (45, 12, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (46, 12, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (47, 12, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (48, 12, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (49, 12, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (50, 13, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (51, 13, 4)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (52, 13, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (53, 13, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (54, 13, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (55, 14, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (56, 14, 5)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (57, 14, 7)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (58, 14, 8)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (59, 15, 1)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (60, 15, 6)
INSERT [dbo].[games_platforms] ([id], [id_games], [id_platforms]) VALUES (61, 15, 8)
SET IDENTITY_INSERT [dbo].[games_platforms] OFF
/****** Object:  Table [dbo].[games_genre]    Script Date: 07/31/2024 18:37:02 ******/
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
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (25, 5, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (26, 5, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (27, 5, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (28, 5, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (29, 5, 10)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (30, 5, 15)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (31, 5, 16)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (32, 6, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (33, 6, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (34, 6, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (35, 6, 12)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (36, 6, 15)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (37, 6, 17)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (38, 7, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (39, 7, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (40, 7, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (41, 7, 5)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (42, 7, 6)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (43, 7, 9)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (44, 7, 11)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (45, 8, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (46, 8, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (47, 8, 5)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (48, 8, 15)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (49, 9, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (50, 9, 15)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (51, 9, 18)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (52, 9, 19)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (53, 10, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (54, 10, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (55, 10, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (56, 10, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (57, 10, 15)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (58, 11, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (59, 11, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (60, 11, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (61, 11, 12)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (62, 12, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (63, 12, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (64, 12, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (65, 12, 12)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (66, 12, 17)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (67, 13, 1)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (68, 13, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (69, 13, 20)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (70, 13, 21)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (71, 13, 22)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (72, 13, 23)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (73, 14, 20)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (74, 14, 24)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (75, 14, 25)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (76, 15, 2)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (77, 15, 3)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (78, 15, 4)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (79, 15, 7)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (80, 15, 11)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (81, 15, 20)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (82, 15, 21)
INSERT [dbo].[games_genre] ([id], [id_games], [id_genre]) VALUES (83, 15, 22)
SET IDENTITY_INSERT [dbo].[games_genre] OFF
/****** Object:  Default [DF_users_admin]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_admin]  DEFAULT ((0)) FOR [admin]
GO
/****** Object:  Default [DF_checkout_date]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[checkout] ADD  CONSTRAINT [DF_checkout_date]  DEFAULT (getdate()) FOR [dates]
GO
/****** Object:  Default [DF_checkout_status]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[checkout] ADD  CONSTRAINT [DF_checkout_status]  DEFAULT ('Waiting for payment') FOR [status]
GO
/****** Object:  ForeignKey [FK_games_users]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[games]  WITH CHECK ADD  CONSTRAINT [FK_games_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[games] CHECK CONSTRAINT [FK_games_users]
GO
/****** Object:  ForeignKey [FK_checkout_games]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_games]
GO
/****** Object:  ForeignKey [FK_checkout_users]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[checkout]  WITH CHECK ADD  CONSTRAINT [FK_checkout_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[checkout] CHECK CONSTRAINT [FK_checkout_users]
GO
/****** Object:  ForeignKey [FK_cart_games]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_games]
GO
/****** Object:  ForeignKey [FK_cart_users]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_users]
GO
/****** Object:  ForeignKey [FK_games_platforms_games]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_games]
GO
/****** Object:  ForeignKey [FK_games_platforms_platforms]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[games_platforms]  WITH CHECK ADD  CONSTRAINT [FK_games_platforms_platforms] FOREIGN KEY([id_platforms])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[games_platforms] CHECK CONSTRAINT [FK_games_platforms_platforms]
GO
/****** Object:  ForeignKey [FK_games_genre_games]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_games] FOREIGN KEY([id_games])
REFERENCES [dbo].[games] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_games]
GO
/****** Object:  ForeignKey [FK_games_genre_genre]    Script Date: 07/31/2024 18:37:02 ******/
ALTER TABLE [dbo].[games_genre]  WITH CHECK ADD  CONSTRAINT [FK_games_genre_genre] FOREIGN KEY([id_genre])
REFERENCES [dbo].[genre] ([id])
GO
ALTER TABLE [dbo].[games_genre] CHECK CONSTRAINT [FK_games_genre_genre]
GO
