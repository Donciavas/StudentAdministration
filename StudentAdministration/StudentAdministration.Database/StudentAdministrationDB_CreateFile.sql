USE [master]
GO
/****** Object:  Database [StudentAdministrationDB]    Script Date: 2022-11-24 18:37:59 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'StudentAdministrationDB')
BEGIN
CREATE DATABASE [StudentAdministrationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentAdministrationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentAdministrationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentAdministrationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentAdministrationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [StudentAdministrationDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentAdministrationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentAdministrationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentAdministrationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentAdministrationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentAdministrationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentAdministrationDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StudentAdministrationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentAdministrationDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentAdministrationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentAdministrationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentAdministrationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentAdministrationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentAdministrationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentAdministrationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentAdministrationDB', N'ON'
GO
ALTER DATABASE [StudentAdministrationDB] SET QUERY_STORE = OFF
GO
USE [StudentAdministrationDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductVersion] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[PersonalNumber] [nvarchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentStudieEnrolls]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentStudieEnrolls](
	[Id] [uniqueidentifier] NOT NULL,
	[ProgramId] [uniqueidentifier] NOT NULL,
	[EnrollYear] [int] NOT NULL,
	[StudentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_StudentStudieEnrolls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudiesPrograms]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesPrograms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudiesPrograms](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_StudiesPrograms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudiesSubject]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubject]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudiesSubject](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Credits] [int] NOT NULL,
	[StudiesProgramId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StudiesSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudiesSubSubject]    Script Date: 2022-11-24 18:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudiesSubSubject](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Credits] [int] NOT NULL,
	[StudiesProgramId] [uniqueidentifier] NULL,
	[StudiesSubSubjectId] [uniqueidentifier] NULL,
	[StudiesSubjectId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_StudiesSubSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220816102015_testDB', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220816103004_testDB2', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220816103144_testDB3', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220818055226_UpdateDB', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221124104131_Rethinking Relationship', N'7.0.0')
GO
INSERT [dbo].[Student] ([PersonalNumber], [Id], [Name], [LastName]) VALUES (N'39302161918', N'9b441a8d-c285-44b1-825d-1624192716d3', N'Test', N'Testas')
GO
INSERT [dbo].[Student] ([PersonalNumber], [Id], [Name], [LastName]) VALUES (N'39503111990', N'4a918bc7-20ac-47f4-9519-b989d03b06ad', N'Vardenis', N'Pavardenis')
GO
INSERT [dbo].[StudentStudieEnrolls] ([Id], [ProgramId], [EnrollYear], [StudentId]) VALUES (N'94f55529-5c38-4d51-9da2-1e49299d423e', N'507a301a-1ab3-4ef4-8c40-8355206dba4a', 2022, N'4a918bc7-20ac-47f4-9519-b989d03b06ad')
GO
INSERT [dbo].[StudentStudieEnrolls] ([Id], [ProgramId], [EnrollYear], [StudentId]) VALUES (N'f64c796a-1a2e-4dfd-b061-4b58f09d81ce', N'79fa2f88-b292-4720-92e2-2c7381b260f3', 2021, N'9b441a8d-c285-44b1-825d-1624192716d3')
GO
INSERT [dbo].[StudiesPrograms] ([Id], [Name], [Credits]) VALUES (N'79fa2f88-b292-4720-92e2-2c7381b260f3', N'Program', 58)
GO
INSERT [dbo].[StudiesPrograms] ([Id], [Name], [Credits]) VALUES (N'507a301a-1ab3-4ef4-8c40-8355206dba4a', N'Object Oriented Programming', 75)
GO
INSERT [dbo].[StudiesSubject] ([Id], [Name], [Credits], [StudiesProgramId]) VALUES (N'98267f29-3f49-4de7-a3fa-236e529b0c23', N'Subject', 8, N'79fa2f88-b292-4720-92e2-2c7381b260f3')
GO
INSERT [dbo].[StudiesSubject] ([Id], [Name], [Credits], [StudiesProgramId]) VALUES (N'c62d303e-8281-4c52-af41-53c9a734c879', N'.NET framework', 15, N'507a301a-1ab3-4ef4-8c40-8355206dba4a')
GO
INSERT [dbo].[StudiesSubject] ([Id], [Name], [Credits], [StudiesProgramId]) VALUES (N'8eb1a28b-0c87-44d2-8bb2-d8bae1c6a6c0', N'Subject2', 6, N'79fa2f88-b292-4720-92e2-2c7381b260f3')
GO
INSERT [dbo].[StudiesSubject] ([Id], [Name], [Credits], [StudiesProgramId]) VALUES (N'32ad9923-7ac7-4282-b7f5-dabb43222e35', N'Databases', 14, N'507a301a-1ab3-4ef4-8c40-8355206dba4a')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'b12a23a5-2648-4f60-9dff-036efc5b7402', N'ORM', 1, NULL, N'e1b5c94b-0e67-4ee5-8faf-f45e5508d6d3', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'6dd5c984-f3c2-4bd6-989a-1222435a12d7', N'SubjectOfSubSubject3', 1, NULL, N'cbf3ccce-1da0-40f6-bcdc-dfc54b804f73', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'c1636177-1818-451c-96d1-22e4b0bd02ff', N'SubjectOfSubSubject4', 1, NULL, N'cbf3ccce-1da0-40f6-bcdc-dfc54b804f73', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'ee62e20f-d9c5-444b-882c-3bcb8b71e404', N'C# beginner lvl 1', 2, NULL, N'97378864-0d68-4f9f-9d25-767763ac4fe1', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'9aabf681-807a-40be-accc-433f834108a2', N'DBContext', 1, NULL, N'bf4c1522-fe76-4042-a5f0-4500ea3209c5', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'bf4c1522-fe76-4042-a5f0-4500ea3209c5', N'Repositories', 3, NULL, N'e1b5c94b-0e67-4ee5-8faf-f45e5508d6d3', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'b22ac964-3c16-4e92-b798-4a824b473250', N'SubSubject3', 2, NULL, NULL, N'8eb1a28b-0c87-44d2-8bb2-d8bae1c6a6c0')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'ba1010fb-eb0a-491b-bd1c-608a8931ef96', N'SubSubject4', 2, NULL, NULL, N'8eb1a28b-0c87-44d2-8bb2-d8bae1c6a6c0')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'eb93f907-ecd6-4e20-a0a6-6df1ca97cff0', N'C# advance lvl 2', 4, NULL, NULL, N'c62d303e-8281-4c52-af41-53c9a734c879')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'973594fc-b6ac-481f-9346-7111f54beb9d', N'NOSQL', 5, NULL, NULL, N'32ad9923-7ac7-4282-b7f5-dabb43222e35')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'97378864-0d68-4f9f-9d25-767763ac4fe1', N'C# advance lvl 1', 4, NULL, NULL, N'c62d303e-8281-4c52-af41-53c9a734c879')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'036ceaa7-b2bc-43a7-943e-7c16865ab564', N'DBSet', 2, NULL, N'bf4c1522-fe76-4042-a5f0-4500ea3209c5', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'df46e7ec-1c84-4dcc-a19e-8bebc5a432cf', N'Mapper', 1, NULL, N'b12a23a5-2648-4f60-9dff-036efc5b7402', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'3377c183-99a5-46ae-80cf-b3dc9dfc4b64', N'SubjectOfSubSubject2', 1, NULL, N'fd781692-32ff-4042-bd84-ff5bc54e707d', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'4de22547-11d3-42e0-897f-b40edeb9afa2', N'C# tips n tricks', 10, N'507a301a-1ab3-4ef4-8c40-8355206dba4a', NULL, NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'3c5c2007-e2ee-45cd-becb-b92578abe897', N'SubjectOfSubSubject', 1, NULL, N'fd781692-32ff-4042-bd84-ff5bc54e707d', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'e0625a9e-5f97-4666-9a7b-d349bff7db36', N'Software Development', 20, N'507a301a-1ab3-4ef4-8c40-8355206dba4a', NULL, NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'75540df4-8886-4cd1-9426-dee6db8f2972', N'SubSubject5', 2, N'79fa2f88-b292-4720-92e2-2c7381b260f3', NULL, NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'cbf3ccce-1da0-40f6-bcdc-dfc54b804f73', N'SubSubject2', 2, NULL, NULL, N'98267f29-3f49-4de7-a3fa-236e529b0c23')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'fedba987-98ef-44bb-88cb-e94a5b91da9b', N'SubSubject6', 2, N'79fa2f88-b292-4720-92e2-2c7381b260f3', NULL, NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'b2dfb58b-c6fa-46bb-8066-e977083a797f', N'C# beginner lvl 2', 2, NULL, N'97378864-0d68-4f9f-9d25-767763ac4fe1', NULL)
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'e1b5c94b-0e67-4ee5-8faf-f45e5508d6d3', N'SQL', 5, NULL, NULL, N'32ad9923-7ac7-4282-b7f5-dabb43222e35')
GO
INSERT [dbo].[StudiesSubSubject] ([Id], [Name], [Credits], [StudiesProgramId], [StudiesSubSubjectId], [StudiesSubjectId]) VALUES (N'fd781692-32ff-4042-bd84-ff5bc54e707d', N'SubSubject', 2, NULL, NULL, N'98267f29-3f49-4de7-a3fa-236e529b0c23')
GO
/****** Object:  Index [IX_StudentStudieEnrolls_ProgramId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]') AND name = N'IX_StudentStudieEnrolls_ProgramId')
CREATE NONCLUSTERED INDEX [IX_StudentStudieEnrolls_ProgramId] ON [dbo].[StudentStudieEnrolls]
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentStudieEnrolls_StudentId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]') AND name = N'IX_StudentStudieEnrolls_StudentId')
CREATE NONCLUSTERED INDEX [IX_StudentStudieEnrolls_StudentId] ON [dbo].[StudentStudieEnrolls]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudiesSubject_StudiesProgramId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubject]') AND name = N'IX_StudiesSubject_StudiesProgramId')
CREATE NONCLUSTERED INDEX [IX_StudiesSubject_StudiesProgramId] ON [dbo].[StudiesSubject]
(
	[StudiesProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudiesSubSubject_StudiesProgramId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]') AND name = N'IX_StudiesSubSubject_StudiesProgramId')
CREATE NONCLUSTERED INDEX [IX_StudiesSubSubject_StudiesProgramId] ON [dbo].[StudiesSubSubject]
(
	[StudiesProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudiesSubSubject_StudiesSubjectId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]') AND name = N'IX_StudiesSubSubject_StudiesSubjectId')
CREATE NONCLUSTERED INDEX [IX_StudiesSubSubject_StudiesSubjectId] ON [dbo].[StudiesSubSubject]
(
	[StudiesSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudiesSubSubject_StudiesSubSubjectId]    Script Date: 2022-11-24 18:38:00 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]') AND name = N'IX_StudiesSubSubject_StudiesSubSubjectId')
CREATE NONCLUSTERED INDEX [IX_StudiesSubSubject_StudiesSubSubjectId] ON [dbo].[StudiesSubSubject]
(
	[StudiesSubSubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentStudieEnrolls_Student_StudentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]'))
ALTER TABLE [dbo].[StudentStudieEnrolls]  WITH CHECK ADD  CONSTRAINT [FK_StudentStudieEnrolls_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentStudieEnrolls_Student_StudentId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]'))
ALTER TABLE [dbo].[StudentStudieEnrolls] CHECK CONSTRAINT [FK_StudentStudieEnrolls_Student_StudentId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentStudieEnrolls_StudiesPrograms_ProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]'))
ALTER TABLE [dbo].[StudentStudieEnrolls]  WITH CHECK ADD  CONSTRAINT [FK_StudentStudieEnrolls_StudiesPrograms_ProgramId] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[StudiesPrograms] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentStudieEnrolls_StudiesPrograms_ProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudentStudieEnrolls]'))
ALTER TABLE [dbo].[StudentStudieEnrolls] CHECK CONSTRAINT [FK_StudentStudieEnrolls_StudiesPrograms_ProgramId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubject_StudiesPrograms_StudiesProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubject]'))
ALTER TABLE [dbo].[StudiesSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudiesSubject_StudiesPrograms_StudiesProgramId] FOREIGN KEY([StudiesProgramId])
REFERENCES [dbo].[StudiesPrograms] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubject_StudiesPrograms_StudiesProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubject]'))
ALTER TABLE [dbo].[StudiesSubject] CHECK CONSTRAINT [FK_StudiesSubject_StudiesPrograms_StudiesProgramId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesPrograms_StudiesProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudiesSubSubject_StudiesPrograms_StudiesProgramId] FOREIGN KEY([StudiesProgramId])
REFERENCES [dbo].[StudiesPrograms] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesPrograms_StudiesProgramId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject] CHECK CONSTRAINT [FK_StudiesSubSubject_StudiesPrograms_StudiesProgramId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId] FOREIGN KEY([StudiesSubjectId])
REFERENCES [dbo].[StudiesSubject] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject] CHECK CONSTRAINT [FK_StudiesSubSubject_StudiesSubject_StudiesSubjectId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesSubSubject_StudiesSubSubjectId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudiesSubSubject_StudiesSubSubject_StudiesSubSubjectId] FOREIGN KEY([StudiesSubSubjectId])
REFERENCES [dbo].[StudiesSubSubject] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudiesSubSubject_StudiesSubSubject_StudiesSubSubjectId]') AND parent_object_id = OBJECT_ID(N'[dbo].[StudiesSubSubject]'))
ALTER TABLE [dbo].[StudiesSubSubject] CHECK CONSTRAINT [FK_StudiesSubSubject_StudiesSubSubject_StudiesSubSubjectId]
GO
USE [master]
GO
ALTER DATABASE [StudentAdministrationDB] SET  READ_WRITE 
GO
