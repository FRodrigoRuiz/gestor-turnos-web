USE [master]
GO
/****** Object:  Database [TURNOS_DB]    Script Date: 1/30/2024 3:54:28 PM ******/
CREATE DATABASE [TURNOS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TURNOS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLAS2022\MSSQL\DATA\TURNOS_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TURNOS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLAS2022\MSSQL\DATA\TURNOS_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TURNOS_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TURNOS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TURNOS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TURNOS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TURNOS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TURNOS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TURNOS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TURNOS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TURNOS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TURNOS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TURNOS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TURNOS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TURNOS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TURNOS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TURNOS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TURNOS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TURNOS_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TURNOS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TURNOS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TURNOS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TURNOS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TURNOS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TURNOS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TURNOS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TURNOS_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [TURNOS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [TURNOS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TURNOS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TURNOS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TURNOS_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TURNOS_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TURNOS_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TURNOS_DB', N'ON'
GO
ALTER DATABASE [TURNOS_DB] SET QUERY_STORE = OFF
GO
USE [TURNOS_DB]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[IdDoctor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDoctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[IdTurno] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[IdDoctor] [int] NULL,
	[FechaTurno] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_turnos]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_turnos]()
returns table
as
return
	Select t.IdTurno, p.IdPersona, p.NombreCompleto, d.IdDoctor, d.Nombre,
	convert(char(10),t.FechaTurno,103)[FechaTurno]
	from Turno t
	inner join Persona p on p.IdPersona = t.IdPersona
	inner join Doctor d on d.IdDoctor = t.IdDoctor
GO
/****** Object:  UserDefinedFunction [dbo].[fn_turno]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_turno](@idTurno int)
returns table
as
return
	Select t.IdTurno, p.IdPersona, p.NombreCompleto, d.IdDoctor, d.Nombre,
	convert(char(10),t.FechaTurno,103)[FechaTurno]
	from Turno t
	inner join Persona p on p.IdPersona = t.IdPersona
	inner join Doctor d on d.IdDoctor = t.IdDoctor
	where t.IdTurno = @idTurno
GO
/****** Object:  UserDefinedFunction [dbo].[fn_personas]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_personas]()
returns table
as
return
	select IdPersona, NombreCompleto from Persona
GO
/****** Object:  UserDefinedFunction [dbo].[fn_doctores]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_doctores]()
returns table
as
return
	select IdDoctor, Nombre from Doctor
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([IdDoctor], [Nombre]) VALUES (1, N'Arturo Mendez')
INSERT [dbo].[Doctor] ([IdDoctor], [Nombre]) VALUES (2, N'Franco Gonzales')
INSERT [dbo].[Doctor] ([IdDoctor], [Nombre]) VALUES (3, N'Juan Laje')
INSERT [dbo].[Doctor] ([IdDoctor], [Nombre]) VALUES (4, N'Facundo Ugarte')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([IdPersona], [NombreCompleto]) VALUES (1, N'Rodrigo Ruiz')
INSERT [dbo].[Persona] ([IdPersona], [NombreCompleto]) VALUES (2, N'Alexander Porras')
INSERT [dbo].[Persona] ([IdPersona], [NombreCompleto]) VALUES (3, N'Marcos Sanchez')
INSERT [dbo].[Persona] ([IdPersona], [NombreCompleto]) VALUES (4, N'Manuel Ortiz')
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([IdTurno], [IdPersona], [IdDoctor], [FechaTurno]) VALUES (1, 1, 1, CAST(N'2024-01-26' AS Date))
INSERT [dbo].[Turno] ([IdTurno], [IdPersona], [IdDoctor], [FechaTurno]) VALUES (2, 3, 3, CAST(N'2024-01-02' AS Date))
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD FOREIGN KEY([IdDoctor])
REFERENCES [dbo].[Doctor] ([IdDoctor])
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearTurno]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_CrearTurno](
@IdPersona int,
@IdDoctor int,
@FechaTurno varchar(10)
)
as
begin
	set dateformat dmy
	Insert into Turno(IdPersona, IdDoctor, FechaTurno)
	values(@IdPersona, @IdDoctor, CONVERT(date, @FechaTurno))
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarTurno]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_EditarTurno](
@IdTurno int,
@IdPersona int,
@IdDoctor int,
@FechaTurno varchar(10)
)
as
begin
	set dateformat dmy
	
	Update Turno set
	IdPersona = @IdPersona,
	IdDoctor = @IdDoctor,
	FechaTurno = CONVERT(date, @FechaTurno)
	where IdTurno = @IdTurno
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarTurno]    Script Date: 1/30/2024 3:54:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_EliminarTurno](
@IdTurno int
)
as
begin
	Delete from Turno
	where IdTurno = @IdTurno
end
GO
USE [master]
GO
ALTER DATABASE [TURNOS_DB] SET  READ_WRITE 
GO
