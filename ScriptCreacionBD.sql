USE [master]
GO
/****** Object:  Database [VotoPV01]    Script Date: 24/6/2025 14:50:26 ******/
CREATE DATABASE [VotoPV01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VotoPV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VotoPV.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VotoPV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VotoPV_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VotoPV01] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VotoPV01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VotoPV01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VotoPV01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VotoPV01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VotoPV01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VotoPV01] SET ARITHABORT OFF 
GO
ALTER DATABASE [VotoPV01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VotoPV01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VotoPV01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VotoPV01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VotoPV01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VotoPV01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VotoPV01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VotoPV01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VotoPV01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VotoPV01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VotoPV01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VotoPV01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VotoPV01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VotoPV01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VotoPV01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VotoPV01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VotoPV01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VotoPV01] SET RECOVERY FULL 
GO
ALTER DATABASE [VotoPV01] SET  MULTI_USER 
GO
ALTER DATABASE [VotoPV01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VotoPV01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VotoPV01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VotoPV01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VotoPV01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VotoPV01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VotoPV01', N'ON'
GO
ALTER DATABASE [VotoPV01] SET QUERY_STORE = ON
GO
ALTER DATABASE [VotoPV01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VotoPV01]
GO
/****** Object:  Table [dbo].[pv_accionesIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_accionesIA](
	[accionesIAID] [int] IDENTITY(1,1) NOT NULL,
	[infoID] [int] NOT NULL,
	[wfProcesoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_accionesIA] PRIMARY KEY CLUSTERED 
(
	[accionesIAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_afiliaciones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_afiliaciones](
	[afiliacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_afiliaciones] PRIMARY KEY CLUSTERED 
(
	[afiliacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_afiliacionesUsuario]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_afiliacionesUsuario](
	[afiliacionUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[afiliacionID] [int] NOT NULL,
	[usarioID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_archivosDocumentos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_archivosDocumentos](
	[archivoDocumentoID] [int] IDENTITY(1,1) NOT NULL,
	[documentoID] [int] NOT NULL,
	[mediaFileID] [int] NOT NULL,
	[aprobado] [bit] NOT NULL,
 CONSTRAINT [PK_pv_archivosDocumentos] PRIMARY KEY CLUSTERED 
(
	[archivoDocumentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_archivosUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_archivosUsuarios](
	[archivoUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[mediaFileID] [int] NOT NULL,
 CONSTRAINT [PK_pv_archivosUsuarios] PRIMARY KEY CLUSTERED 
(
	[archivoUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_avalGubernamental]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_avalGubernamental](
	[avalID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[tipoID] [int] NOT NULL,
	[fechaAval] [datetime] NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[votacionID] [int] NOT NULL,
	[organizacionID] [int] NOT NULL,
 CONSTRAINT [PK__pv_avalG__20FBA68986EDB1AE] PRIMARY KEY CLUSTERED 
(
	[avalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_boletaRequisitosPropuestas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_boletaRequisitosPropuestas](
	[boletaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[esActual] [bit] NOT NULL,
 CONSTRAINT [PK_pv_boletaRequisitosPropuestas] PRIMARY KEY CLUSTERED 
(
	[boletaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_cantones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_cantones](
	[cantonID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[provinciaID] [int] NOT NULL,
 CONSTRAINT [PK_pv_cantones] PRIMARY KEY CLUSTERED 
(
	[cantonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_comentariosPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_comentariosPropuesta](
	[comentarioid] [int] IDENTITY(1,1) NOT NULL,
	[detalleComentarioID] [int] NOT NULL,
	[estadoComentid] [int] NOT NULL,
	[propuestaid] [int] NOT NULL,
 CONSTRAINT [PK_pv_comentariosPropuesta] PRIMARY KEY CLUSTERED 
(
	[comentarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_comentariosProyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_comentariosProyecto](
	[comentarioProyID] [int] IDENTITY(1,1) NOT NULL,
	[detalleComentarioID] [int] NOT NULL,
	[estadoCommentid] [int] NOT NULL,
	[proyectoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_comentariosProyecto] PRIMARY KEY CLUSTERED 
(
	[comentarioProyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_condicionAval]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_condicionAval](
	[condicionID] [int] IDENTITY(1,1) NOT NULL,
	[avalID] [int] NOT NULL,
	[tipoCondicion] [nvarchar](100) NOT NULL,
	[valorCondicion] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[condicionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_configAPIs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_configAPIs](
	[configAPIID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apiURL] [varchar](500) NOT NULL,
	[rutaEndpoint] [varchar](255) NOT NULL,
	[metodoLlamadaID] [int] NOT NULL,
	[esActiva] [bit] NOT NULL,
	[ultimaModificacion] [datetime] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_pv_configAPIs] PRIMARY KEY CLUSTERED 
(
	[configAPIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_contact]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_contact](
	[contactInfoId] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[value] [varchar](100) NOT NULL,
	[enabled] [bit] NOT NULL,
	[lastUpdate] [datetime] NOT NULL,
	[typeId] [int] NOT NULL,
 CONSTRAINT [PK_pv_contact] PRIMARY KEY CLUSTERED 
(
	[contactInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_contactType]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_contactType](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NULL,
 CONSTRAINT [PK_pv_contactType] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_contextoIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_contextoIA](
	[contextoId] [int] IDENTITY(1,1) NOT NULL,
	[embeddingId] [int] NOT NULL,
	[relacionId] [int] NOT NULL,
	[nombreContexto] [varchar](150) NOT NULL,
	[config] [varchar](150) NULL,
 CONSTRAINT [PK_pv_contextoIA] PRIMARY KEY CLUSTERED 
(
	[contextoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_criterio]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_criterio](
	[criterioID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[comparador] [varchar](2) NOT NULL,
	[valor] [varchar](30) NOT NULL,
	[detalleID] [int] NOT NULL,
 CONSTRAINT [PK_pv_criterio] PRIMARY KEY CLUSTERED 
(
	[criterioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_criteriosExito]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_criteriosExito](
	[criterioExitoID] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](30) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_pv_criteriosExito] PRIMARY KEY CLUSTERED 
(
	[criterioExitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_detalleComentarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_detalleComentarios](
	[detalleComentarioID] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[cuerpo] [varchar](max) NOT NULL,
	[fechaPublicacion] [datetime] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[organizacionID] [int] NULL,
 CONSTRAINT [PK_pv_detalleComentarios] PRIMARY KEY CLUSTERED 
(
	[detalleComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_detalleSegmento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_detalleSegmento](
	[detalleID] [int] IDENTITY(1,1) NOT NULL,
	[segmentoID] [int] NOT NULL,
	[tipoDetalleID] [int] NOT NULL,
	[tabla] [varchar](45) NULL,
	[campo] [varchar](45) NULL,
 CONSTRAINT [PK_pv_detalleSegmento] PRIMARY KEY CLUSTERED 
(
	[detalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_detallesHorarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_detallesHorarios](
	[tipoHorarioId] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL,
	[baseDate] [datetime] NOT NULL,
	[datePart] [int] NOT NULL,
	[lastExecution] [datetime] NOT NULL,
	[nextExecution] [datetime] NOT NULL,
	[horarioId] [int] NOT NULL,
 CONSTRAINT [PK_pv_detallesHorarios] PRIMARY KEY CLUSTERED 
(
	[tipoHorarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_direcciones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_direcciones](
	[direccionid] [int] IDENTITY(1,1) NOT NULL,
	[linea1] [varchar](50) NOT NULL,
	[linea2] [varchar](50) NULL,
	[distritoid] [int] NOT NULL,
	[codigoPostal] [varchar](9) NOT NULL,
 CONSTRAINT [PK_pv_direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_direccionesUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_direccionesUsuarios](
	[direccionUsuarioid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[direccionNacimientoid] [int] NULL,
	[activa] [bit] NULL,
	[direccionViviendaid] [int] NULL,
 CONSTRAINT [PK_pv_direccionesUsuarios] PRIMARY KEY CLUSTERED 
(
	[direccionUsuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_distrito]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_distrito](
	[distritoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantonID] [int] NOT NULL,
 CONSTRAINT [PK_pv_distrito] PRIMARY KEY CLUSTERED 
(
	[distritoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_documento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_documento](
	[documentoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[tipoDocumentoID] [int] NOT NULL,
	[estadoDocumentoID] [int] NOT NULL,
	[ultimaModificacion] [datetime] NOT NULL,
	[esActual] [bit] NOT NULL,
	[idLegal] [varchar](15) NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_documento] PRIMARY KEY CLUSTERED 
(
	[documentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_documentoProyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_documentoProyecto](
	[documentoProyectoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[documentoID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_documentoProyecto] PRIMARY KEY CLUSTERED 
(
	[documentoProyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_documentosOrgs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_documentosOrgs](
	[documentoOrgID] [int] IDENTITY(1,1) NOT NULL,
	[organizacionID] [int] NOT NULL,
	[documentoID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_documentosOrgs] PRIMARY KEY CLUSTERED 
(
	[documentoOrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_documentosPropuestas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_documentosPropuestas](
	[documentoPropuestaID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[documentoID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_documentosPropuestas] PRIMARY KEY CLUSTERED 
(
	[documentoPropuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_documentosUsuario]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_documentosUsuario](
	[documentoUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[documentoID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_documentosUsuario] PRIMARY KEY CLUSTERED 
(
	[documentoUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_educacionUsuario]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_educacionUsuario](
	[educacionUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[nivelID] [int] NOT NULL,
 CONSTRAINT [PK_pv_educacionUsuario] PRIMARY KEY CLUSTERED 
(
	[educacionUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_embeddingsIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_embeddingsIA](
	[embeddingId] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](30) NOT NULL,
	[embedding] [varchar](max) NOT NULL,
	[dimensionesVector] [smallint] NOT NULL,
	[modeloEmbedding] [varchar](50) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_pv_embeddingsIA] PRIMARY KEY CLUSTERED 
(
	[embeddingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_entidadesIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_entidadesIA](
	[entidadId] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[texto] [varchar](255) NOT NULL,
	[confianza] [decimal](5, 2) NOT NULL,
	[posicionInicial] [int] NULL,
	[posicionFin] [int] NULL,
 CONSTRAINT [PK_pv_entidadesIA] PRIMARY KEY CLUSTERED 
(
	[entidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoComentarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoComentarios](
	[estadoComentid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_estadoComentarios] PRIMARY KEY CLUSTERED 
(
	[estadoComentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoDocumento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoDocumento](
	[estadoDocumentoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pv_estadoDocumento] PRIMARY KEY CLUSTERED 
(
	[estadoDocumentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoIncumplimiento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoIncumplimiento](
	[estadoIncumplimientoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_pv_estadoIncumplimiento] PRIMARY KEY CLUSTERED 
(
	[estadoIncumplimientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoPropuesta](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoProyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoProyecto](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoVotacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoVotacion](
	[estadoVotacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripción] [varchar](500) NOT NULL,
 CONSTRAINT [PK_pv_estadoVotacion] PRIMARY KEY CLUSTERED 
(
	[estadoVotacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_etapasProyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_etapasProyecto](
	[etapaProyectoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[statusEtapaProyID] [int] NOT NULL,
	[inversionEstimada] [decimal](18, 2) NOT NULL,
	[monedaID] [int] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
	[duracion] [float] NOT NULL,
 CONSTRAINT [PK_pv_etapasProyecto] PRIMARY KEY CLUSTERED 
(
	[etapaProyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_grupoValidador]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_grupoValidador](
	[grupoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreGrupo] [nvarchar](255) NOT NULL,
	[tipoID] [int] NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_grupoVotacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_grupoVotacion](
	[grupoVotacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[tipoGrupo] [nvarchar](100) NOT NULL,
	[esSegmentado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grupoVotacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_hook]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_hook](
	[hookID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[evento] [nvarchar](100) NOT NULL,
	[prioridad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_horarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_horarios](
	[horarioId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[recurrentType] [varchar](20) NULL,
	[repetition] [int] NOT NULL,
	[endType] [varchar](30) NOT NULL,
	[endDate] [datetime] NULL,
 CONSTRAINT [PK_pv_horarios] PRIMARY KEY CLUSTERED 
(
	[horarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_iaAnalisis]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_iaAnalisis](
	[analisisId] [int] IDENTITY(1,1) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[iaEstadoID] [int] NOT NULL,
	[fechaComienzo] [datetime] NOT NULL,
	[fechaFinalizacion] [datetime] NOT NULL,
	[infoid] [int] NOT NULL,
	[contextoID] [int] NOT NULL,
	[documentoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_iaAnalisis] PRIMARY KEY CLUSTERED 
(
	[analisisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_iaEstado]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_iaEstado](
	[iaEstadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pv_iaEstado] PRIMARY KEY CLUSTERED 
(
	[iaEstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_iaModelo]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_iaModelo](
	[iaModeloID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[parametrosJSON] [varchar](max) NOT NULL,
 CONSTRAINT [PK_pv_iaModelo] PRIMARY KEY CLUSTERED 
(
	[iaModeloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_iaPrompts]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_iaPrompts](
	[promptID] [int] IDENTITY(1,1) NOT NULL,
	[prompt] [varchar](500) NOT NULL,
	[contextoID] [int] NULL,
 CONSTRAINT [PK_pv_iaPrompts] PRIMARY KEY CLUSTERED 
(
	[promptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_identidadDigital]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_identidadDigital](
	[identidadID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[fotoCedulaURL] [varchar](255) NOT NULL,
	[fotoPasaporteURL] [varchar](255) NOT NULL,
	[fechaValidacion] [date] NOT NULL,
	[horarioID] [int] NOT NULL,
 CONSTRAINT [PK_pv_identidadDigital] PRIMARY KEY CLUSTERED 
(
	[identidadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_incumplimiento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_incumplimiento](
	[incumplimientoID] [int] IDENTITY(1,1) NOT NULL,
	[tipoIncumplimiento] [int] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[fechaReporte] [datetime] NOT NULL,
	[estadoIncumplimientoID] [int] NOT NULL,
	[objetivoEtapaID] [int] NOT NULL,
 CONSTRAINT [PK__pv_incum__5CC0EF516DED069E] PRIMARY KEY CLUSTERED 
(
	[incumplimientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_infoIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_infoIA](
	[infoId] [int] IDENTITY(1,1) NOT NULL,
	[iaModeloID] [int] NOT NULL,
	[configAPIID] [int] NOT NULL,
 CONSTRAINT [PK_pv_infoIA] PRIMARY KEY CLUSTERED 
(
	[infoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_intentoPago]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_intentoPago](
	[intentoPagoID] [int] IDENTITY(1,1) NOT NULL,
	[monto] [float] NOT NULL,
	[actualMonto] [float] NOT NULL,
	[resultado] [varchar](500) NOT NULL,
	[numeroAuth] [varchar](30) NOT NULL,
	[reference] [varchar](500) NOT NULL,
	[tokenCargo] [varbinary](256) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
	[metodoPagoID] [int] NOT NULL,
	[monedaID] [int] NOT NULL,
 CONSTRAINT [PK_pv_intentoPago] PRIMARY KEY CLUSTERED 
(
	[intentoPagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_inversion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_inversion](
	[inversionID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[transaccionID] [int] NOT NULL,
	[organizacionID] [bigint] NULL,
 CONSTRAINT [PK__pv_inver__C85E5DB3D01A4BB1] PRIMARY KEY CLUSTERED 
(
	[inversionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_listaBlancaIPs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_listaBlancaIPs](
	[ipPermitido] [int] NULL,
	[ipID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_pv_listaBlancaIPs] PRIMARY KEY CLUSTERED 
(
	[ipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_llaveOrganizaciones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_llaveOrganizaciones](
	[llaveOrganizacionID] [int] IDENTITY(1,1) NOT NULL,
	[llaveEncriptada] [varbinary](260) NOT NULL,
	[numMancomunadas] [int] NOT NULL,
	[ultimaModificacion] [datetime] NOT NULL,
	[organizacionID] [int] NOT NULL,
 CONSTRAINT [PK_pv_llaveOrganizaciones] PRIMARY KEY CLUSTERED 
(
	[llaveOrganizacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_llavesUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_llavesUsuarios](
	[llaveUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[llaveCifrada] [varbinary](260) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[esActiva] [bit] NOT NULL,
	[ultimaModificacion] [datetime] NULL,
 CONSTRAINT [PK_pv_llavesUsuarios] PRIMARY KEY CLUSTERED 
(
	[llaveUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_logOrigen]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_logOrigen](
	[origenlogid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_logOrigen] PRIMARY KEY CLUSTERED 
(
	[origenlogid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_logs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_logs](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[computador] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[trace] [text] NOT NULL,
	[refId1] [bigint] NULL,
	[refId2] [bigint] NULL,
	[valor1] [varchar](100) NULL,
	[valor2] [varchar](100) NULL,
	[checksum] [varbinary](max) NOT NULL,
	[tipologid] [int] NOT NULL,
	[origenlogid] [int] NOT NULL,
	[logseveridadid] [int] NOT NULL,
 CONSTRAINT [PK_pv_logs] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_logTipos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_logTipos](
	[tipologid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descRef1] [varchar](50) NULL,
	[descRef2] [varchar](50) NULL,
	[descVal1] [varchar](50) NULL,
	[descVal2] [varchar](50) NULL,
 CONSTRAINT [PK_pv_logTipos] PRIMARY KEY CLUSTERED 
(
	[tipologid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_mediaFiles]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_mediaFiles](
	[mediaFileId] [int] IDENTITY(1,1) NOT NULL,
	[documentURL] [varchar](200) NOT NULL,
	[lastUpdate] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[mediaTypeId] [int] NOT NULL,
 CONSTRAINT [PK_pv_mediaFiles] PRIMARY KEY CLUSTERED 
(
	[mediaFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_mediaTypes]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_mediaTypes](
	[mediaTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](90) NOT NULL,
	[playerType] [varchar](100) NOT NULL,
 CONSTRAINT [PK_pv_mediaTypes] PRIMARY KEY CLUSTERED 
(
	[mediaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodoLlamadaAPI]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodoLlamadaAPI](
	[metodoLlamadaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pv_metodoLlamadaAPI] PRIMARY KEY CLUSTERED 
(
	[metodoLlamadaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodoPruebas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodoPruebas](
	[metodoPruebaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[configJSON] [varchar](max) NOT NULL,
	[configAPIID] [int] NOT NULL,
 CONSTRAINT [PK_pv_metodoPruebas] PRIMARY KEY CLUSTERED 
(
	[metodoPruebaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodosDisponibles]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodosDisponibles](
	[metodoDisponibleID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[JSONconfigurado] [varchar](max) NOT NULL,
	[refreshToken] [varbinary](255) NOT NULL,
	[token] [varbinary](120) NOT NULL,
	[expToken] [datetime] NOT NULL,
	[maskAccount] [varchar](45) NOT NULL,
	[metodoID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_metodosDisponibles] PRIMARY KEY CLUSTERED 
(
	[metodoDisponibleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodosPago]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodosPago](
	[metodoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[esActivo] [bit] NOT NULL,
	[configuracionJSON] [varchar](max) NOT NULL,
	[logoURL] [varchar](300) NOT NULL,
 CONSTRAINT [PK_pv_metodosPago] PRIMARY KEY CLUSTERED 
(
	[metodoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodosPagoOrgs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodosPagoOrgs](
	[metodoPagoOrgs] [int] IDENTITY(1,1) NOT NULL,
	[metodoDisponibleID] [int] NOT NULL,
	[organizacionID] [int] NOT NULL,
 CONSTRAINT [PK_pv_metodosPagoOrgs] PRIMARY KEY CLUSTERED 
(
	[metodoPagoOrgs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodosPagoUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodosPagoUsuarios](
	[metodoPagoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[metodoDisponibleID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
 CONSTRAINT [PK_pv_metodosPagoUsuarios] PRIMARY KEY CLUSTERED 
(
	[metodoPagoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_metodoTrabajo]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_metodoTrabajo](
	[metodoTrabajoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_pv_metodoTrabajo] PRIMARY KEY CLUSTERED 
(
	[metodoTrabajoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_moduloExtension]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_moduloExtension](
	[moduloID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[version] [nvarchar](50) NOT NULL,
	[fechaInstalacion] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[configuracion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[moduloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_moduloHook]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_moduloHook](
	[moduloHookID] [int] IDENTITY(1,1) NOT NULL,
	[moduloID] [int] NOT NULL,
	[hookID] [int] NOT NULL,
	[metodo] [nvarchar](255) NOT NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[moduloHookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_moneda]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_moneda](
	[monedaID] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [char](3) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[simbolo] [nvarchar](10) NOT NULL,
	[esPredeterminada] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[monedaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_nivelEducacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_nivelEducacion](
	[nivelID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_pv_nivelEducacion] PRIMARY KEY CLUSTERED 
(
	[nivelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_objetivosEtapa]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_objetivosEtapa](
	[objetivoEtapaID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[etapaProyectoID] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[criterioExitoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_objetivosEtapa] PRIMARY KEY CLUSTERED 
(
	[objetivoEtapaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_organizaciones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_organizaciones](
	[organizacionid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[esNacional] [bit] NOT NULL,
	[logoUrl] [varchar](500) NOT NULL,
	[tienePermiso] [bit] NOT NULL,
	[tipoOrganizacionID] [int] NOT NULL,
	[identificacionTributaria] [varchar](10) NOT NULL,
 CONSTRAINT [PK_pv_organizaciones] PRIMARY KEY CLUSTERED 
(
	[organizacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_orgUsuariosRegulares]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_orgUsuariosRegulares](
	[orgUsuarioid] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[organizacionid] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
	[rolInterno] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pv_orgUsuarios] PRIMARY KEY CLUSTERED 
(
	[orgUsuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_orgUsuariosRepresentantes]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_orgUsuariosRepresentantes](
	[usuarioRepresentanteID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[organizacionID] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
	[ultimaModificacion] [datetime] NULL,
	[documentoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_orgUsuariosRepresentantes] PRIMARY KEY CLUSTERED 
(
	[usuarioRepresentanteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_paises]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_paises](
	[paisid] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[esPermitido] [bit] NOT NULL,
 CONSTRAINT [PK_pv_paises] PRIMARY KEY CLUSTERED 
(
	[paisid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_permissions]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_permissions](
	[permissionId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NOT NULL,
	[code] [varchar](10) NOT NULL,
 CONSTRAINT [PK_pv_permissions] PRIMARY KEY CLUSTERED 
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_pesoRespuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_pesoRespuesta](
	[pesoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[multiplicador] [decimal](14, 2) NULL,
 CONSTRAINT [PK_pv_pesoRespuesta] PRIMARY KEY CLUSTERED 
(
	[pesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_planPagos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_planPagos](
	[planID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[numeroCuota] [int] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[monedaID] [int] NOT NULL,
	[horarioID] [int] NOT NULL,
 CONSTRAINT [PK__pv_planD__A2942D18087B6EE2] PRIMARY KEY CLUSTERED 
(
	[planID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_plataformaAutenticacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_plataformaAutenticacion](
	[plataformaAutId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[llaveSecreta] [varbinary](128) NOT NULL,
	[llave] [varbinary](128) NOT NULL,
	[logoURL] [varchar](200) NULL,
 CONSTRAINT [PK_pv_plataformaAutenticacion] PRIMARY KEY CLUSTERED 
(
	[plataformaAutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_preguntas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_preguntas](
	[preguntaID] [int] IDENTITY(1,1) NOT NULL,
	[enunciado] [varchar](500) NULL,
	[tipoPreguntaID] [int] NOT NULL,
	[maxSelecciones] [int] NOT NULL,
	[fechaPublicacion] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[order] [int] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_preguntas] PRIMARY KEY CLUSTERED 
(
	[preguntaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_profesiones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_profesiones](
	[profesionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[sectorProfesionID] [int] NULL,
 CONSTRAINT [PK_pv_profesiones] PRIMARY KEY CLUSTERED 
(
	[profesionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_profesionesUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_profesionesUsuarios](
	[profesionesUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[profesionID] [int] NOT NULL,
	[loEjerce] [bit] NOT NULL,
 CONSTRAINT [PK_pv_profesionesUsuarios] PRIMARY KEY CLUSTERED 
(
	[profesionesUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_proponente]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_proponente](
	[proponenteID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[usuarioID] [int] NULL,
	[organizacionID] [int] NULL,
	[esPrincipal] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proponenteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestaCategoria]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestaCategoria](
	[categoriaid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_propuestaCategoria] PRIMARY KEY CLUSTERED 
(
	[categoriaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestas](
	[propuestaid] [int] IDENTITY(1,1) NOT NULL,
	[categoriaid] [int] NOT NULL,
	[descripcion] [varchar](200) NULL,
	[imgURL] [varchar](300) NULL,
	[fechaInicio] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[fechaFin] [datetime] NULL,
	[checksum] [varbinary](300) NOT NULL,
	[comentarios] [bit] NOT NULL,
	[tipoPropuestaID] [int] NOT NULL,
	[estadoID] [int] NOT NULL,
	[organizacionID] [int] NULL,
 CONSTRAINT [PK_pv_propuestas] PRIMARY KEY CLUSTERED 
(
	[propuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestaSegmentosDirigidos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestaSegmentosDirigidos](
	[propuestaSegmentoDirigoID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[segementoID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_propuestaSegmentosDirigidos] PRIMARY KEY CLUSTERED 
(
	[propuestaSegmentoDirigoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestaSegmentosImpacto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestaSegmentosImpacto](
	[segmentoImpactoID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[segmentoID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_propuestaSegmentosImpacto] PRIMARY KEY CLUSTERED 
(
	[segmentoImpactoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestaVotacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestaVotacion](
	[propuestaVotacionID] [int] NOT NULL,
	[votacionID] [int] NOT NULL,
	[propuestaID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_propuestaVotacion] PRIMARY KEY CLUSTERED 
(
	[propuestaVotacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_provincias]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_provincias](
	[provinciaid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
	[paisid] [tinyint] NULL,
 CONSTRAINT [PK_pv_provincias] PRIMARY KEY CLUSTERED 
(
	[provinciaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_proyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_proyecto](
	[proyectoID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[estadoID] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaEstimadaFin] [datetime] NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[metodoTrabajoID] [int] NOT NULL,
	[montoPedido] [decimal](18, 2) NOT NULL,
	[porcentaje] [decimal](6, 2) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK__pv_proye__543423C65118C989] PRIMARY KEY CLUSTERED 
(
	[proyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__pv_proye__01294C7384DB7576] UNIQUE NONCLUSTERED 
(
	[propuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_pruebasVida]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_pruebasVida](
	[pruebaID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[metodoPruebaID] [int] NOT NULL,
	[resultadoJSON] [varchar](max) NOT NULL,
	[fechaValidacion] [datetime] NOT NULL,
	[sesionID] [int] NOT NULL,
	[entradaJSON] [varchar](max) NOT NULL,
 CONSTRAINT [PK_pv_pruebasVida] PRIMARY KEY CLUSTERED 
(
	[pruebaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_relacionesIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_relacionesIA](
	[relacionId] [int] IDENTITY(1,1) NOT NULL,
	[entidadId] [int] NOT NULL,
	[verbo] [varchar](50) NOT NULL,
	[objeto] [varchar](255) NOT NULL,
	[confianza] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_pv_relacionesIA] PRIMARY KEY CLUSTERED 
(
	[relacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_requisitosPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_requisitosPropuesta](
	[requisitoID] [int] IDENTITY(1,1) NOT NULL,
	[boletaID] [int] NULL,
	[requisito] [varchar](50) NULL,
	[motivo] [varchar](150) NULL,
 CONSTRAINT [PK_pv_requisitosPropuesta] PRIMARY KEY CLUSTERED 
(
	[requisitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_respuestaParticipante]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_respuestaParticipante](
	[respuestaParticipanteID] [int] IDENTITY(1,1) NOT NULL,
	[preguntaID] [int] NOT NULL,
	[respuestaID] [int] NOT NULL,
	[checksum] [varbinary](500) NOT NULL,
	[valor] [varchar](500) NULL,
	[fechaRespuesta] [datetime] NOT NULL,
	[ncRespuesta] [varbinary](256) NOT NULL,
	[tokenGUID] [uniqueidentifier] NOT NULL,
	[pesoRespuesta] [int] NOT NULL,
 CONSTRAINT [PK_pv_respuestaParticipante] PRIMARY KEY CLUSTERED 
(
	[respuestaParticipanteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_respuestas]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_respuestas](
	[respuestaID] [int] IDENTITY(1,1) NOT NULL,
	[preguntaID] [int] NOT NULL,
	[respuesta] [varchar](50) NOT NULL,
	[url] [varchar](500) NULL,
	[value] [varchar](100) NOT NULL,
	[order] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_respuestas] PRIMARY KEY CLUSTERED 
(
	[respuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_resultadosAnalisis]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_resultadosAnalisis](
	[resultadoId] [int] IDENTITY(1,1) NOT NULL,
	[analisisId] [int] NOT NULL,
	[outputAnalisis] [varchar](5000) NOT NULL,
	[puntajeConfianza] [decimal](5, 2) NOT NULL,
	[aceptado] [bit] NOT NULL,
	[razonVeredicto] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_pv_resultadosAnalisis] PRIMARY KEY CLUSTERED 
(
	[resultadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_resultadoVotacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_resultadoVotacion](
	[resultadoID] [int] IDENTITY(1,1) NOT NULL,
	[votacionID] [int] NOT NULL,
	[opcion] [nvarchar](100) NOT NULL,
	[votosAFavor] [int] NOT NULL,
	[votosEnContra] [int] NOT NULL,
	[abstenciones] [int] NOT NULL,
	[resultadoFinal] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[resultadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_revisionHumana]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_revisionHumana](
	[revisionHumanaId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[fechaRevisionHumana] [datetime] NOT NULL,
	[analisisId] [int] NULL,
	[razonVeredicto] [varchar](2000) NULL,
	[argumentoAnalisis] [nchar](10) NULL,
 CONSTRAINT [PK_pv_revisionHumana] PRIMARY KEY CLUSTERED 
(
	[revisionHumanaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_roles]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_roles](
	[rolId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_pv_roles] PRIMARY KEY CLUSTERED 
(
	[rolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_rolesUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_rolesUsuarios](
	[rolUsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[lastUpdate] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[checksum] [varchar](250) NOT NULL,
	[deleted] [bit] NOT NULL,
	[userId] [int] NOT NULL,
	[rolId] [int] NOT NULL,
 CONSTRAINT [PK_pv_rolesUsuarios] PRIMARY KEY CLUSTERED 
(
	[rolUsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_sectorProfesion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_sectorProfesion](
	[sectorID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_sectorProfesion] PRIMARY KEY CLUSTERED 
(
	[sectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_segmento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_segmento](
	[segmentoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[enabled] [bit] NOT NULL,
	[deleted] [bit] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[usuarioID] [int] NOT NULL,
 CONSTRAINT [PK_pv_segmento] PRIMARY KEY CLUSTERED 
(
	[segmentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_sesiones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_sesiones](
	[sesionid] [int] IDENTITY(1,1) NOT NULL,
	[llaveSesion] [varchar](36) NOT NULL,
	[tokenSesion] [varbinary](128) NOT NULL,
	[refreshToken] [varbinary](128) NOT NULL,
	[ultimaActualizacion] [datetime] NULL,
	[siguienteActualizacion] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[plataformaAutId] [tinyint] NOT NULL,
 CONSTRAINT [PK_pv_sesiones] PRIMARY KEY CLUSTERED 
(
	[sesionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_severidadIncumplimiento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_severidadIncumplimiento](
	[severidadIcumplimientoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_pv_severidadIncumplimiento] PRIMARY KEY CLUSTERED 
(
	[severidadIcumplimientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_severidadLogs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_severidadLogs](
	[logseveridadid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_severidadLogs] PRIMARY KEY CLUSTERED 
(
	[logseveridadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_solicitudCambio]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_solicitudCambio](
	[solicitudCambioid] [int] IDENTITY(1,1) NOT NULL,
	[propuestaid] [int] NOT NULL,
	[cambioPlanteado] [varchar](200) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
 CONSTRAINT [PK_pv_solicitudCambio] PRIMARY KEY CLUSTERED 
(
	[solicitudCambioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_statusEtapaProyecto]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_statusEtapaProyecto](
	[statusEtapaProyID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
 CONSTRAINT [PK_pv_statusEtapaProyecto] PRIMARY KEY CLUSTERED 
(
	[statusEtapaProyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_statusRegistro]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_statusRegistro](
	[statusRegistroID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_statusRegistro] PRIMARY KEY CLUSTERED 
(
	[statusRegistroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_statusRegistroOrgs]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_statusRegistroOrgs](
	[statusRegOrgsID] [int] IDENTITY(1,1) NOT NULL,
	[statusRegistroID] [int] NOT NULL,
	[organizacionID] [int] NOT NULL,
	[ultimaModificacion] [datetime] NULL,
 CONSTRAINT [PK_pv_statusRegistroOrgs] PRIMARY KEY CLUSTERED 
(
	[statusRegOrgsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_statusRegistroUsuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_statusRegistroUsuarios](
	[statusRegUsuariosID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[statusRegistroID] [int] NOT NULL,
	[ultimaModificacion] [datetime] NULL,
 CONSTRAINT [PK_pv_StatusRegistroUsuarios] PRIMARY KEY CLUSTERED 
(
	[statusRegUsuariosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_subTipoTransaccion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_subTipoTransaccion](
	[subTipoTransaccionID] [int] IDENTITY(1,1) NOT NULL,
	[tipoTransaccionID] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subTipoTransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tareasEtapa]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tareasEtapa](
	[tareaEtapaID] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[etapaProyectoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_tareasEtapa] PRIMARY KEY CLUSTERED 
(
	[tareaEtapaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tarifaGrupo]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tarifaGrupo](
	[tarifaID] [int] IDENTITY(1,1) NOT NULL,
	[grupoID] [int] NOT NULL,
	[tipoTarifa] [nvarchar](50) NOT NULL,
	[porcentaje] [decimal](5, 2) NULL,
	[montoFijo] [decimal](18, 2) NULL,
	[monedaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tarifaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tasaCambio]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tasaCambio](
	[tasaCambioID] [int] IDENTITY(1,1) NOT NULL,
	[monedaOrigen] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[tasa] [float] NOT NULL,
	[activa] [bit] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[monedaDestino] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tasaCambioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoAval]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoAval](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoDetalle]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoDetalle](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_tipoDetalle] PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoDocumento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoDocumento](
	[tipoDocumentoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pv_tipoDocumento] PRIMARY KEY CLUSTERED 
(
	[tipoDocumentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoGrupoValidador]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoGrupoValidador](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoIncumplimiento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoIncumplimiento](
	[tipoIncumplimientoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[severidadIncumplimientoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_tipoIncumplimiento] PRIMARY KEY CLUSTERED 
(
	[tipoIncumplimientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoOrganizacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoOrganizacion](
	[tipoOrganizacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoOrganizacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombreTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoPregunta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoPregunta](
	[tipoPreguntaID] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_tipoPregunta] PRIMARY KEY CLUSTERED 
(
	[tipoPreguntaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tiposPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tiposPropuesta](
	[tipoPropuestaID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[boletaID] [int] NOT NULL,
 CONSTRAINT [PK_pv_tiposPropuesta] PRIMARY KEY CLUSTERED 
(
	[tipoPropuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoTransaccion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoTransaccion](
	[tipoTransaccionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoTransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoVotacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_tipoVotacion](
	[tipoVotacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoVotacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_transaccion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_transaccion](
	[transaccionID] [bigint] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[proyectoID] [int] NULL,
	[monto] [float] NOT NULL,
	[montoConvertido] [float] NULL,
	[descripcion] [nvarchar](200) NULL,
	[fechaTransaccion] [datetime] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[referencia] [nvarchar](50) NULL,
	[checksum] [varbinary](256) NULL,
	[subTipoTransaccionID] [int] NULL,
	[tasaCambioID] [int] NULL,
	[intentoPagoID] [int] NOT NULL,
 CONSTRAINT [PK__pv_trans__BD57556CAB44BDC2] PRIMARY KEY CLUSTERED 
(
	[transaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_ubicaciones]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_ubicaciones](
	[ubicacionID] [int] IDENTITY(1,1) NOT NULL,
	[paisID] [tinyint] NOT NULL,
	[proviniciaID] [int] NOT NULL,
	[cantonID] [int] NOT NULL,
	[distritoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_ubicaciones] PRIMARY KEY CLUSTERED 
(
	[ubicacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_usuarios]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_usuarios](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[identificacion] [varchar](9) NOT NULL,
	[nacional] [bit] NOT NULL,
	[checksum] [varbinary](260) NULL,
 CONSTRAINT [PK_pv_usuarios] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_usuariosPermisos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_usuariosPermisos](
	[permisoUsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[deleted] [bit] NOT NULL,
	[lastUpdate] [datetime] NOT NULL,
	[checksum] [varchar](250) NOT NULL,
	[userid] [int] NOT NULL,
	[permisoId] [int] NOT NULL,
 CONSTRAINT [PK_pv_usuariosPermisos] PRIMARY KEY CLUSTERED 
(
	[permisoUsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_usuarioVotacionPublica]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_usuarioVotacionPublica](
	[usuarioVotacionPubID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[respuestaParticipanteID] [int] NOT NULL,
	[checksum] [varbinary](256) NOT NULL,
	[ultimaModificacion] [datetime] NOT NULL,
	[votacionID] [int] NOT NULL,
 CONSTRAINT [PK_pv_usuarioVotacionPublica] PRIMARY KEY CLUSTERED 
(
	[usuarioVotacionPubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionIA]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionIA](
	[validacionId] [int] IDENTITY(1,1) NOT NULL,
	[propuestaId] [int] NOT NULL,
	[modeloUsado] [varchar](100) NULL,
	[fechaValidacion] [datetime] NULL,
	[resultado] [varchar](max) NULL,
	[confianza] [decimal](5, 2) NULL,
	[aprobado] [bit] NULL,
	[observaciones] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[validacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionPropuesta](
	[validacionID] [int] IDENTITY(1,1) NOT NULL,
	[versionID] [int] NOT NULL,
	[grupoID] [int] NOT NULL,
	[fechaValidacion] [datetime] NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[comentarios] [nvarchar](max) NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[validacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_versionPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_versionPropuesta](
	[versionID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[numeroVersion] [int] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[versionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[propuestaID] ASC,
	[numeroVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_votacion]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_votacion](
	[votacionID] [int] IDENTITY(1,1) NOT NULL,
	[tipoVotacionID] [int] NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[estadoVotacionID] [int] NOT NULL,
	[ultimaModificacion] [datetime] NOT NULL,
	[privada] [bit] NOT NULL,
	[esSecreta] [bit] NOT NULL,
 CONSTRAINT [PK__pv_votac__F9F1A45B8164A08A] PRIMARY KEY CLUSTERED 
(
	[votacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_votacionesObjetivos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_votacionesObjetivos](
	[votacionObjetivoID] [int] IDENTITY(1,1) NOT NULL,
	[objetivoProyectoID] [int] NOT NULL,
	[votacionID] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[fechaModificacion] [datetime] NOT NULL,
	[checksum(256)] [varbinary](256) NOT NULL,
 CONSTRAINT [PK_pv_votacionesObjetivos] PRIMARY KEY CLUSTERED 
(
	[votacionObjetivoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_votacionPregunta]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_votacionPregunta](
	[votacionPreguntaID] [int] IDENTITY(1,1) NOT NULL,
	[votacionID] [int] NOT NULL,
	[preguntaID] [int] NOT NULL,
 CONSTRAINT [PK_pv_votacionPregunta] PRIMARY KEY CLUSTERED 
(
	[votacionPreguntaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_votacionSegmento]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_votacionSegmento](
	[votacionSegmentoID] [int] IDENTITY(1,1) NOT NULL,
	[segmentoID] [int] NOT NULL,
	[votacionID] [int] NOT NULL,
	[pesoSegmento] [int] NOT NULL,
 CONSTRAINT [PK_pv_votacionSegmento] PRIMARY KEY CLUSTERED 
(
	[votacionSegmentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_votanteGrupo]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_votanteGrupo](
	[votanteGrupoID] [int] IDENTITY(1,1) NOT NULL,
	[grupoVotacionID] [int] NOT NULL,
	[usuarioID] [int] NULL,
	[organizacionID] [int] NULL,
	[fechaIncorporacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[votanteGrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_wfDocumentos]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_wfDocumentos](
	[wfDocumentoID] [int] IDENTITY(1,1) NOT NULL,
	[tipoDocumentoID] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[wfProcesoID] [int] NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_pv_wfDocumentos] PRIMARY KEY CLUSTERED 
(
	[wfDocumentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_wfProceso]    Script Date: 24/6/2025 14:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_wfProceso](
	[wfProcesoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[wfURL] [varchar](200) NOT NULL,
	[configJSON] [varchar](3000) NOT NULL,
	[ultimaActualizacion] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_pv_wfProceso] PRIMARY KEY CLUSTERED 
(
	[wfProcesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_pv_requisitosPropuesta]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [IX_pv_requisitosPropuesta] ON [dbo].[pv_requisitosPropuesta]
(
	[requisitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_subTipoTransaccion_tipo]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_subTipoTransaccion_tipo] ON [dbo].[pv_subTipoTransaccion]
(
	[tipoTransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_tasaCambio_fechas]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_tasaCambio_fechas] ON [dbo].[pv_tasaCambio]
(
	[fechaInicio] ASC,
	[fechaFin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_tasaCambio_moneda]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_tasaCambio_moneda] ON [dbo].[pv_tasaCambio]
(
	[monedaOrigen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_transaccion_fecha]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_transaccion_fecha] ON [dbo].[pv_transaccion]
(
	[fechaTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_transaccion_proyecto]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_transaccion_proyecto] ON [dbo].[pv_transaccion]
(
	[proyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_pv_transaccion_usuario]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [idx_pv_transaccion_usuario] ON [dbo].[pv_transaccion]
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ValidacionIA_Propuesta]    Script Date: 24/6/2025 14:50:27 ******/
CREATE NONCLUSTERED INDEX [IX_ValidacionIA_Propuesta] ON [dbo].[pv_validacionIA]
(
	[propuestaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pv_grupoValidador] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_grupoVotacion] ADD  DEFAULT ((0)) FOR [esSegmentado]
GO
ALTER TABLE [dbo].[pv_hook] ADD  DEFAULT ((0)) FOR [prioridad]
GO
ALTER TABLE [dbo].[pv_incumplimiento] ADD  CONSTRAINT [DF__pv_incump__fecha__02925FBF]  DEFAULT (getdate()) FOR [fechaReporte]
GO
ALTER TABLE [dbo].[pv_moduloExtension] ADD  DEFAULT (getdate()) FOR [fechaInstalacion]
GO
ALTER TABLE [dbo].[pv_moduloExtension] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[pv_moduloHook] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[pv_moneda] ADD  DEFAULT ((0)) FOR [esPredeterminada]
GO
ALTER TABLE [dbo].[pv_proponente] ADD  DEFAULT ((1)) FOR [esPrincipal]
GO
ALTER TABLE [dbo].[pv_proyecto] ADD  CONSTRAINT [DF__pv_proyec__fecha__093F5D4E]  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_subTipoTransaccion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_tasaCambio] ADD  DEFAULT ((1)) FOR [activa]
GO
ALTER TABLE [dbo].[pv_tasaCambio] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_tipoTransaccion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_validacionIA] ADD  DEFAULT (sysdatetime()) FOR [fechaValidacion]
GO
ALTER TABLE [dbo].[pv_validacionPropuesta] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_versionPropuesta] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[pv_votanteGrupo] ADD  DEFAULT (getdate()) FOR [fechaIncorporacion]
GO
ALTER TABLE [dbo].[pv_accionesIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_accionesIA_pv_infoIA] FOREIGN KEY([infoID])
REFERENCES [dbo].[pv_infoIA] ([infoId])
GO
ALTER TABLE [dbo].[pv_accionesIA] CHECK CONSTRAINT [FK_pv_accionesIA_pv_infoIA]
GO
ALTER TABLE [dbo].[pv_accionesIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_accionesIA_pv_wfProceso] FOREIGN KEY([wfProcesoID])
REFERENCES [dbo].[pv_wfProceso] ([wfProcesoID])
GO
ALTER TABLE [dbo].[pv_accionesIA] CHECK CONSTRAINT [FK_pv_accionesIA_pv_wfProceso]
GO
ALTER TABLE [dbo].[pv_afiliacionesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_afiliacionesUsuario_pv_afiliaciones] FOREIGN KEY([afiliacionID])
REFERENCES [dbo].[pv_afiliaciones] ([afiliacionID])
GO
ALTER TABLE [dbo].[pv_afiliacionesUsuario] CHECK CONSTRAINT [FK_pv_afiliacionesUsuario_pv_afiliaciones]
GO
ALTER TABLE [dbo].[pv_afiliacionesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_afiliacionesUsuario_pv_usuarios] FOREIGN KEY([usarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_afiliacionesUsuario] CHECK CONSTRAINT [FK_pv_afiliacionesUsuario_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_archivosDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_pv_archivosDocumentos_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_archivosDocumentos] CHECK CONSTRAINT [FK_pv_archivosDocumentos_pv_documento]
GO
ALTER TABLE [dbo].[pv_archivosDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_pv_archivosDocumentos_pv_mediaFiles] FOREIGN KEY([mediaFileID])
REFERENCES [dbo].[pv_mediaFiles] ([mediaFileId])
GO
ALTER TABLE [dbo].[pv_archivosDocumentos] CHECK CONSTRAINT [FK_pv_archivosDocumentos_pv_mediaFiles]
GO
ALTER TABLE [dbo].[pv_archivosUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_archivosUsuarios_pv_mediaFiles] FOREIGN KEY([mediaFileID])
REFERENCES [dbo].[pv_mediaFiles] ([mediaFileId])
GO
ALTER TABLE [dbo].[pv_archivosUsuarios] CHECK CONSTRAINT [FK_pv_archivosUsuarios_pv_mediaFiles]
GO
ALTER TABLE [dbo].[pv_archivosUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_archivosUsuarios_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_archivosUsuarios] CHECK CONSTRAINT [FK_pv_archivosUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_avalGubernamental]  WITH CHECK ADD  CONSTRAINT [FK__pv_avalGu__tipoI__14B10FFA] FOREIGN KEY([tipoID])
REFERENCES [dbo].[pv_tipoAval] ([tipoID])
GO
ALTER TABLE [dbo].[pv_avalGubernamental] CHECK CONSTRAINT [FK__pv_avalGu__tipoI__14B10FFA]
GO
ALTER TABLE [dbo].[pv_avalGubernamental]  WITH CHECK ADD  CONSTRAINT [FK_pv_avalGubernamental_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_avalGubernamental] CHECK CONSTRAINT [FK_pv_avalGubernamental_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_avalGubernamental]  WITH CHECK ADD  CONSTRAINT [FK_pv_avalGubernamental_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_avalGubernamental] CHECK CONSTRAINT [FK_pv_avalGubernamental_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_avalGubernamental]  WITH CHECK ADD  CONSTRAINT [FK_pv_avalGubernamental_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_avalGubernamental] CHECK CONSTRAINT [FK_pv_avalGubernamental_pv_votacion]
GO
ALTER TABLE [dbo].[pv_cantones]  WITH CHECK ADD  CONSTRAINT [FK_pv_cantones_pv_provincias] FOREIGN KEY([provinciaID])
REFERENCES [dbo].[pv_provincias] ([provinciaid])
GO
ALTER TABLE [dbo].[pv_cantones] CHECK CONSTRAINT [FK_pv_cantones_pv_provincias]
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosPropuesta_pv_detalleComentarios] FOREIGN KEY([detalleComentarioID])
REFERENCES [dbo].[pv_detalleComentarios] ([detalleComentarioID])
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta] CHECK CONSTRAINT [FK_pv_comentariosPropuesta_pv_detalleComentarios]
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosPropuesta_pv_estadoComentarios] FOREIGN KEY([estadoComentid])
REFERENCES [dbo].[pv_estadoComentarios] ([estadoComentid])
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta] CHECK CONSTRAINT [FK_pv_comentariosPropuesta_pv_estadoComentarios]
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas] FOREIGN KEY([propuestaid])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta] CHECK CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_comentariosProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosProyecto_pv_detalleComentarios] FOREIGN KEY([detalleComentarioID])
REFERENCES [dbo].[pv_detalleComentarios] ([detalleComentarioID])
GO
ALTER TABLE [dbo].[pv_comentariosProyecto] CHECK CONSTRAINT [FK_pv_comentariosProyecto_pv_detalleComentarios]
GO
ALTER TABLE [dbo].[pv_comentariosProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosProyecto_pv_estadoComentarios] FOREIGN KEY([estadoCommentid])
REFERENCES [dbo].[pv_estadoComentarios] ([estadoComentid])
GO
ALTER TABLE [dbo].[pv_comentariosProyecto] CHECK CONSTRAINT [FK_pv_comentariosProyecto_pv_estadoComentarios]
GO
ALTER TABLE [dbo].[pv_comentariosProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosProyecto_pv_proyecto] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_comentariosProyecto] CHECK CONSTRAINT [FK_pv_comentariosProyecto_pv_proyecto]
GO
ALTER TABLE [dbo].[pv_condicionAval]  WITH CHECK ADD  CONSTRAINT [FK__pv_condic__avalI__178D7CA5] FOREIGN KEY([avalID])
REFERENCES [dbo].[pv_avalGubernamental] ([avalID])
GO
ALTER TABLE [dbo].[pv_condicionAval] CHECK CONSTRAINT [FK__pv_condic__avalI__178D7CA5]
GO
ALTER TABLE [dbo].[pv_configAPIs]  WITH CHECK ADD  CONSTRAINT [FK_pv_configAPIs_pv_metodoLlamadaAPI] FOREIGN KEY([metodoLlamadaID])
REFERENCES [dbo].[pv_metodoLlamadaAPI] ([metodoLlamadaID])
GO
ALTER TABLE [dbo].[pv_configAPIs] CHECK CONSTRAINT [FK_pv_configAPIs_pv_metodoLlamadaAPI]
GO
ALTER TABLE [dbo].[pv_contact]  WITH CHECK ADD  CONSTRAINT [FK_pv_contact_pv_contactType] FOREIGN KEY([typeId])
REFERENCES [dbo].[pv_contactType] ([typeId])
GO
ALTER TABLE [dbo].[pv_contact] CHECK CONSTRAINT [FK_pv_contact_pv_contactType]
GO
ALTER TABLE [dbo].[pv_contact]  WITH CHECK ADD  CONSTRAINT [FK_pv_contact_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_contact] CHECK CONSTRAINT [FK_pv_contact_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_contextoIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_contextoIA_pv_embeddingsIA] FOREIGN KEY([embeddingId])
REFERENCES [dbo].[pv_embeddingsIA] ([embeddingId])
GO
ALTER TABLE [dbo].[pv_contextoIA] CHECK CONSTRAINT [FK_pv_contextoIA_pv_embeddingsIA]
GO
ALTER TABLE [dbo].[pv_contextoIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_contextoIA_pv_relacionesIA] FOREIGN KEY([relacionId])
REFERENCES [dbo].[pv_relacionesIA] ([relacionId])
GO
ALTER TABLE [dbo].[pv_contextoIA] CHECK CONSTRAINT [FK_pv_contextoIA_pv_relacionesIA]
GO
ALTER TABLE [dbo].[pv_criterio]  WITH CHECK ADD  CONSTRAINT [FK_pv_criterio_pv_detalleSegmento] FOREIGN KEY([detalleID])
REFERENCES [dbo].[pv_detalleSegmento] ([detalleID])
GO
ALTER TABLE [dbo].[pv_criterio] CHECK CONSTRAINT [FK_pv_criterio_pv_detalleSegmento]
GO
ALTER TABLE [dbo].[pv_detalleSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_detalleSegmento_pv_segmento] FOREIGN KEY([segmentoID])
REFERENCES [dbo].[pv_segmento] ([segmentoID])
GO
ALTER TABLE [dbo].[pv_detalleSegmento] CHECK CONSTRAINT [FK_pv_detalleSegmento_pv_segmento]
GO
ALTER TABLE [dbo].[pv_detalleSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_detalleSegmento_pv_tipoDetalle] FOREIGN KEY([tipoDetalleID])
REFERENCES [dbo].[pv_tipoDetalle] ([tipoID])
GO
ALTER TABLE [dbo].[pv_detalleSegmento] CHECK CONSTRAINT [FK_pv_detalleSegmento_pv_tipoDetalle]
GO
ALTER TABLE [dbo].[pv_detallesHorarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_detallesHorarios_pv_horarios] FOREIGN KEY([horarioId])
REFERENCES [dbo].[pv_horarios] ([horarioId])
GO
ALTER TABLE [dbo].[pv_detallesHorarios] CHECK CONSTRAINT [FK_pv_detallesHorarios_pv_horarios]
GO
ALTER TABLE [dbo].[pv_direcciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_direcciones_pv_distrito] FOREIGN KEY([distritoid])
REFERENCES [dbo].[pv_distrito] ([distritoID])
GO
ALTER TABLE [dbo].[pv_direcciones] CHECK CONSTRAINT [FK_pv_direcciones_pv_distrito]
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_direccionesUsuarios_pv_direcciones3] FOREIGN KEY([direccionNacimientoid])
REFERENCES [dbo].[pv_direcciones] ([direccionid])
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios] CHECK CONSTRAINT [FK_pv_direccionesUsuarios_pv_direcciones3]
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_direccionesUsuarios_pv_direcciones4] FOREIGN KEY([direccionViviendaid])
REFERENCES [dbo].[pv_direcciones] ([direccionid])
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios] CHECK CONSTRAINT [FK_pv_direccionesUsuarios_pv_direcciones4]
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_direccionesUsuarios_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_direccionesUsuarios] CHECK CONSTRAINT [FK_pv_direccionesUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_distrito]  WITH CHECK ADD  CONSTRAINT [FK_pv_distrito_pv_cantones] FOREIGN KEY([cantonID])
REFERENCES [dbo].[pv_cantones] ([cantonID])
GO
ALTER TABLE [dbo].[pv_distrito] CHECK CONSTRAINT [FK_pv_distrito_pv_cantones]
GO
ALTER TABLE [dbo].[pv_documento]  WITH CHECK ADD  CONSTRAINT [FK_pv_documento_pv_estadoDocumento] FOREIGN KEY([estadoDocumentoID])
REFERENCES [dbo].[pv_estadoDocumento] ([estadoDocumentoID])
GO
ALTER TABLE [dbo].[pv_documento] CHECK CONSTRAINT [FK_pv_documento_pv_estadoDocumento]
GO
ALTER TABLE [dbo].[pv_documento]  WITH CHECK ADD  CONSTRAINT [FK_pv_documento_pv_tipoDocumento] FOREIGN KEY([tipoDocumentoID])
REFERENCES [dbo].[pv_tipoDocumento] ([tipoDocumentoID])
GO
ALTER TABLE [dbo].[pv_documento] CHECK CONSTRAINT [FK_pv_documento_pv_tipoDocumento]
GO
ALTER TABLE [dbo].[pv_documentoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentoProyecto_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_documentoProyecto] CHECK CONSTRAINT [FK_pv_documentoProyecto_pv_documento]
GO
ALTER TABLE [dbo].[pv_documentoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentoProyecto_pv_proyecto] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_documentoProyecto] CHECK CONSTRAINT [FK_pv_documentoProyecto_pv_proyecto]
GO
ALTER TABLE [dbo].[pv_documentosOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosOrgs_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_documentosOrgs] CHECK CONSTRAINT [FK_pv_documentosOrgs_pv_documento]
GO
ALTER TABLE [dbo].[pv_documentosOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosOrgs_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_documentosOrgs] CHECK CONSTRAINT [FK_pv_documentosOrgs_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_documentosPropuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosPropuestas_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_documentosPropuestas] CHECK CONSTRAINT [FK_pv_documentosPropuestas_pv_documento]
GO
ALTER TABLE [dbo].[pv_documentosPropuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosPropuestas_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_documentosPropuestas] CHECK CONSTRAINT [FK_pv_documentosPropuestas_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_documentosUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosUsuario_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_documentosUsuario] CHECK CONSTRAINT [FK_pv_documentosUsuario_pv_documento]
GO
ALTER TABLE [dbo].[pv_documentosUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_documentosUsuario_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_documentosUsuario] CHECK CONSTRAINT [FK_pv_documentosUsuario_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_educacionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_educacionUsuario_pv_nivelEducacion] FOREIGN KEY([nivelID])
REFERENCES [dbo].[pv_nivelEducacion] ([nivelID])
GO
ALTER TABLE [dbo].[pv_educacionUsuario] CHECK CONSTRAINT [FK_pv_educacionUsuario_pv_nivelEducacion]
GO
ALTER TABLE [dbo].[pv_educacionUsuario]  WITH CHECK ADD  CONSTRAINT [FK_pv_educacionUsuario_pv_usuarios] FOREIGN KEY([userID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_educacionUsuario] CHECK CONSTRAINT [FK_pv_educacionUsuario_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_etapasProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_etapasProyecto_pv_moneda] FOREIGN KEY([monedaID])
REFERENCES [dbo].[pv_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[pv_etapasProyecto] CHECK CONSTRAINT [FK_pv_etapasProyecto_pv_moneda]
GO
ALTER TABLE [dbo].[pv_etapasProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_etapasProyecto_pv_proyecto] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_etapasProyecto] CHECK CONSTRAINT [FK_pv_etapasProyecto_pv_proyecto]
GO
ALTER TABLE [dbo].[pv_etapasProyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_etapasProyecto_pv_statusEtapaProyecto] FOREIGN KEY([statusEtapaProyID])
REFERENCES [dbo].[pv_statusEtapaProyecto] ([statusEtapaProyID])
GO
ALTER TABLE [dbo].[pv_etapasProyecto] CHECK CONSTRAINT [FK_pv_etapasProyecto_pv_statusEtapaProyecto]
GO
ALTER TABLE [dbo].[pv_grupoValidador]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[pv_tipoGrupoValidador] ([tipoID])
GO
ALTER TABLE [dbo].[pv_iaAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaAnalisis_pv_contextoIA] FOREIGN KEY([contextoID])
REFERENCES [dbo].[pv_contextoIA] ([contextoId])
GO
ALTER TABLE [dbo].[pv_iaAnalisis] CHECK CONSTRAINT [FK_pv_iaAnalisis_pv_contextoIA]
GO
ALTER TABLE [dbo].[pv_iaAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaAnalisis_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_iaAnalisis] CHECK CONSTRAINT [FK_pv_iaAnalisis_pv_documento]
GO
ALTER TABLE [dbo].[pv_iaAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaAnalisis_pv_iaEstado] FOREIGN KEY([iaEstadoID])
REFERENCES [dbo].[pv_iaEstado] ([iaEstadoID])
GO
ALTER TABLE [dbo].[pv_iaAnalisis] CHECK CONSTRAINT [FK_pv_iaAnalisis_pv_iaEstado]
GO
ALTER TABLE [dbo].[pv_iaAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaAnalisis_pv_infoIA1] FOREIGN KEY([infoid])
REFERENCES [dbo].[pv_infoIA] ([infoId])
GO
ALTER TABLE [dbo].[pv_iaAnalisis] CHECK CONSTRAINT [FK_pv_iaAnalisis_pv_infoIA1]
GO
ALTER TABLE [dbo].[pv_iaPrompts]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaPrompts_pv_contextoIA] FOREIGN KEY([contextoID])
REFERENCES [dbo].[pv_contextoIA] ([contextoId])
GO
ALTER TABLE [dbo].[pv_iaPrompts] CHECK CONSTRAINT [FK_pv_iaPrompts_pv_contextoIA]
GO
ALTER TABLE [dbo].[pv_identidadDigital]  WITH CHECK ADD  CONSTRAINT [FK_pv_identidadDigital_pv_horarios] FOREIGN KEY([horarioID])
REFERENCES [dbo].[pv_horarios] ([horarioId])
GO
ALTER TABLE [dbo].[pv_identidadDigital] CHECK CONSTRAINT [FK_pv_identidadDigital_pv_horarios]
GO
ALTER TABLE [dbo].[pv_identidadDigital]  WITH CHECK ADD  CONSTRAINT [FK_pv_identidadDigital_pv_usuarios] FOREIGN KEY([userID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_identidadDigital] CHECK CONSTRAINT [FK_pv_identidadDigital_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_incumplimiento]  WITH CHECK ADD  CONSTRAINT [FK_pv_incumplimiento_pv_estadoIncumplimiento] FOREIGN KEY([estadoIncumplimientoID])
REFERENCES [dbo].[pv_estadoIncumplimiento] ([estadoIncumplimientoID])
GO
ALTER TABLE [dbo].[pv_incumplimiento] CHECK CONSTRAINT [FK_pv_incumplimiento_pv_estadoIncumplimiento]
GO
ALTER TABLE [dbo].[pv_incumplimiento]  WITH CHECK ADD  CONSTRAINT [FK_pv_incumplimiento_pv_objetivosEtapa] FOREIGN KEY([objetivoEtapaID])
REFERENCES [dbo].[pv_objetivosEtapa] ([objetivoEtapaID])
GO
ALTER TABLE [dbo].[pv_incumplimiento] CHECK CONSTRAINT [FK_pv_incumplimiento_pv_objetivosEtapa]
GO
ALTER TABLE [dbo].[pv_incumplimiento]  WITH CHECK ADD  CONSTRAINT [FK_pv_incumplimiento_pv_tipoIncumplimiento] FOREIGN KEY([tipoIncumplimiento])
REFERENCES [dbo].[pv_tipoIncumplimiento] ([tipoIncumplimientoID])
GO
ALTER TABLE [dbo].[pv_incumplimiento] CHECK CONSTRAINT [FK_pv_incumplimiento_pv_tipoIncumplimiento]
GO
ALTER TABLE [dbo].[pv_infoIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_infoIA_pv_configAPIs] FOREIGN KEY([configAPIID])
REFERENCES [dbo].[pv_configAPIs] ([configAPIID])
GO
ALTER TABLE [dbo].[pv_infoIA] CHECK CONSTRAINT [FK_pv_infoIA_pv_configAPIs]
GO
ALTER TABLE [dbo].[pv_infoIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_infoIA_pv_iaModelo] FOREIGN KEY([iaModeloID])
REFERENCES [dbo].[pv_iaModelo] ([iaModeloID])
GO
ALTER TABLE [dbo].[pv_infoIA] CHECK CONSTRAINT [FK_pv_infoIA_pv_iaModelo]
GO
ALTER TABLE [dbo].[pv_inversion]  WITH CHECK ADD  CONSTRAINT [FK__pv_invers__proye__2B947552] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_inversion] CHECK CONSTRAINT [FK__pv_invers__proye__2B947552]
GO
ALTER TABLE [dbo].[pv_inversion]  WITH CHECK ADD  CONSTRAINT [FK_pv_inversion_pv_transaccion] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_transaccion] ([transaccionID])
GO
ALTER TABLE [dbo].[pv_inversion] CHECK CONSTRAINT [FK_pv_inversion_pv_transaccion]
GO
ALTER TABLE [dbo].[pv_inversion]  WITH CHECK ADD  CONSTRAINT [FK_pv_inversion_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_inversion] CHECK CONSTRAINT [FK_pv_inversion_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_llaveOrganizaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_llaveOrganizaciones_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_llaveOrganizaciones] CHECK CONSTRAINT [FK_pv_llaveOrganizaciones_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_logs]  WITH CHECK ADD  CONSTRAINT [FK_pv_logs_pv_logOrigen] FOREIGN KEY([origenlogid])
REFERENCES [dbo].[pv_logOrigen] ([origenlogid])
GO
ALTER TABLE [dbo].[pv_logs] CHECK CONSTRAINT [FK_pv_logs_pv_logOrigen]
GO
ALTER TABLE [dbo].[pv_logs]  WITH CHECK ADD  CONSTRAINT [FK_pv_logs_pv_logTipos] FOREIGN KEY([tipologid])
REFERENCES [dbo].[pv_logTipos] ([tipologid])
GO
ALTER TABLE [dbo].[pv_logs] CHECK CONSTRAINT [FK_pv_logs_pv_logTipos]
GO
ALTER TABLE [dbo].[pv_logs]  WITH CHECK ADD  CONSTRAINT [FK_pv_logs_pv_severidadLogs] FOREIGN KEY([logseveridadid])
REFERENCES [dbo].[pv_severidadLogs] ([logseveridadid])
GO
ALTER TABLE [dbo].[pv_logs] CHECK CONSTRAINT [FK_pv_logs_pv_severidadLogs]
GO
ALTER TABLE [dbo].[pv_mediaFiles]  WITH CHECK ADD  CONSTRAINT [FK_pv_mediaFiles_pv_mediaTypes] FOREIGN KEY([mediaTypeId])
REFERENCES [dbo].[pv_mediaTypes] ([mediaTypeId])
GO
ALTER TABLE [dbo].[pv_mediaFiles] CHECK CONSTRAINT [FK_pv_mediaFiles_pv_mediaTypes]
GO
ALTER TABLE [dbo].[pv_metodoPruebas]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodoPruebas_pv_configAPIs] FOREIGN KEY([configAPIID])
REFERENCES [dbo].[pv_configAPIs] ([configAPIID])
GO
ALTER TABLE [dbo].[pv_metodoPruebas] CHECK CONSTRAINT [FK_pv_metodoPruebas_pv_configAPIs]
GO
ALTER TABLE [dbo].[pv_metodosDisponibles]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodosDisponibles_pv_metodosPago] FOREIGN KEY([metodoID])
REFERENCES [dbo].[pv_metodosPago] ([metodoID])
GO
ALTER TABLE [dbo].[pv_metodosDisponibles] CHECK CONSTRAINT [FK_pv_metodosDisponibles_pv_metodosPago]
GO
ALTER TABLE [dbo].[pv_metodosPagoOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodosPagoOrgs_pv_metodosDisponibles] FOREIGN KEY([metodoDisponibleID])
REFERENCES [dbo].[pv_metodosDisponibles] ([metodoDisponibleID])
GO
ALTER TABLE [dbo].[pv_metodosPagoOrgs] CHECK CONSTRAINT [FK_pv_metodosPagoOrgs_pv_metodosDisponibles]
GO
ALTER TABLE [dbo].[pv_metodosPagoOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodosPagoOrgs_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_metodosPagoOrgs] CHECK CONSTRAINT [FK_pv_metodosPagoOrgs_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_metodosPagoUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodosPagoUsuarios_pv_metodosDisponibles] FOREIGN KEY([metodoDisponibleID])
REFERENCES [dbo].[pv_metodosDisponibles] ([metodoDisponibleID])
GO
ALTER TABLE [dbo].[pv_metodosPagoUsuarios] CHECK CONSTRAINT [FK_pv_metodosPagoUsuarios_pv_metodosDisponibles]
GO
ALTER TABLE [dbo].[pv_metodosPagoUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_metodosPagoUsuarios_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_metodosPagoUsuarios] CHECK CONSTRAINT [FK_pv_metodosPagoUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_moduloHook]  WITH CHECK ADD FOREIGN KEY([hookID])
REFERENCES [dbo].[pv_hook] ([hookID])
GO
ALTER TABLE [dbo].[pv_moduloHook]  WITH CHECK ADD FOREIGN KEY([moduloID])
REFERENCES [dbo].[pv_moduloExtension] ([moduloID])
GO
ALTER TABLE [dbo].[pv_objetivosEtapa]  WITH CHECK ADD  CONSTRAINT [FK_pv_objetivosEtapa_pv_criteriosExito1] FOREIGN KEY([criterioExitoID])
REFERENCES [dbo].[pv_criteriosExito] ([criterioExitoID])
GO
ALTER TABLE [dbo].[pv_objetivosEtapa] CHECK CONSTRAINT [FK_pv_objetivosEtapa_pv_criteriosExito1]
GO
ALTER TABLE [dbo].[pv_objetivosEtapa]  WITH CHECK ADD  CONSTRAINT [FK_pv_objetivosEtapa_pv_etapasProyecto] FOREIGN KEY([etapaProyectoID])
REFERENCES [dbo].[pv_etapasProyecto] ([etapaProyectoID])
GO
ALTER TABLE [dbo].[pv_objetivosEtapa] CHECK CONSTRAINT [FK_pv_objetivosEtapa_pv_etapasProyecto]
GO
ALTER TABLE [dbo].[pv_organizaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_organizaciones_pv_tipoOrganizacion] FOREIGN KEY([tipoOrganizacionID])
REFERENCES [dbo].[pv_tipoOrganizacion] ([tipoOrganizacionID])
GO
ALTER TABLE [dbo].[pv_organizaciones] CHECK CONSTRAINT [FK_pv_organizaciones_pv_tipoOrganizacion]
GO
ALTER TABLE [dbo].[pv_orgUsuariosRegulares]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuarios_pv_organizaciones] FOREIGN KEY([organizacionid])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_orgUsuariosRegulares] CHECK CONSTRAINT [FK_pv_orgUsuarios_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_orgUsuariosRegulares]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuarios_pv_usuarios] FOREIGN KEY([orgUsuarioid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_orgUsuariosRegulares] CHECK CONSTRAINT [FK_pv_orgUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_documento] FOREIGN KEY([documentoID])
REFERENCES [dbo].[pv_documento] ([documentoID])
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes] CHECK CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_documento]
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes] CHECK CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_orgUsuariosRepresentantes] CHECK CONSTRAINT [FK_pv_orgUsuariosRepresentantes_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_planPagos]  WITH CHECK ADD  CONSTRAINT [FK__pv_planDe__moned__3335971A] FOREIGN KEY([monedaID])
REFERENCES [dbo].[pv_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[pv_planPagos] CHECK CONSTRAINT [FK__pv_planDe__moned__3335971A]
GO
ALTER TABLE [dbo].[pv_planPagos]  WITH CHECK ADD  CONSTRAINT [FK__pv_planDe__proye__351DDF8C] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_planPagos] CHECK CONSTRAINT [FK__pv_planDe__proye__351DDF8C]
GO
ALTER TABLE [dbo].[pv_planPagos]  WITH CHECK ADD  CONSTRAINT [FK_pv_planPagos_pv_horarios] FOREIGN KEY([horarioID])
REFERENCES [dbo].[pv_horarios] ([horarioId])
GO
ALTER TABLE [dbo].[pv_planPagos] CHECK CONSTRAINT [FK_pv_planPagos_pv_horarios]
GO
ALTER TABLE [dbo].[pv_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_pv_preguntas_pv_tipoPregunta] FOREIGN KEY([tipoPreguntaID])
REFERENCES [dbo].[pv_tipoPregunta] ([tipoPreguntaID])
GO
ALTER TABLE [dbo].[pv_preguntas] CHECK CONSTRAINT [FK_pv_preguntas_pv_tipoPregunta]
GO
ALTER TABLE [dbo].[pv_profesiones]  WITH CHECK ADD  CONSTRAINT [FK_pv_profesiones_pv_sectorProfesion] FOREIGN KEY([sectorProfesionID])
REFERENCES [dbo].[pv_sectorProfesion] ([sectorID])
GO
ALTER TABLE [dbo].[pv_profesiones] CHECK CONSTRAINT [FK_pv_profesiones_pv_sectorProfesion]
GO
ALTER TABLE [dbo].[pv_profesionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_profesionesUsuarios_pv_profesiones] FOREIGN KEY([profesionID])
REFERENCES [dbo].[pv_profesiones] ([profesionID])
GO
ALTER TABLE [dbo].[pv_profesionesUsuarios] CHECK CONSTRAINT [FK_pv_profesionesUsuarios_pv_profesiones]
GO
ALTER TABLE [dbo].[pv_profesionesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_profesionesUsuarios_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_profesionesUsuarios] CHECK CONSTRAINT [FK_pv_profesionesUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_proponente]  WITH CHECK ADD  CONSTRAINT [FK_pv_proponente_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_proponente] CHECK CONSTRAINT [FK_pv_proponente_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_proponente]  WITH CHECK ADD  CONSTRAINT [FK_pv_proponente_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_proponente] CHECK CONSTRAINT [FK_pv_proponente_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_proponente]  WITH CHECK ADD  CONSTRAINT [FK_pv_proponente_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_proponente] CHECK CONSTRAINT [FK_pv_proponente_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_estadoPropuesta] FOREIGN KEY([estadoID])
REFERENCES [dbo].[pv_estadoPropuesta] ([estadoID])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_estadoPropuesta]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria] FOREIGN KEY([categoriaid])
REFERENCES [dbo].[pv_propuestaCategoria] ([categoriaid])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_tiposPropuesta] FOREIGN KEY([tipoPropuestaID])
REFERENCES [dbo].[pv_tiposPropuesta] ([tipoPropuestaID])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_tiposPropuesta]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_usuarios_userId] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_usuarios_userId]
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosDirigidos]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaSegmentosDirigidos_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosDirigidos] CHECK CONSTRAINT [FK_pv_propuestaSegmentosDirigidos_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosDirigidos]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaSegmentosDirigidos_pv_segmento] FOREIGN KEY([segementoID])
REFERENCES [dbo].[pv_segmento] ([segmentoID])
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosDirigidos] CHECK CONSTRAINT [FK_pv_propuestaSegmentosDirigidos_pv_segmento]
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosImpacto]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaSegmentosImpacto_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosImpacto] CHECK CONSTRAINT [FK_pv_propuestaSegmentosImpacto_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosImpacto]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaSegmentosImpacto_pv_segmento] FOREIGN KEY([segmentoID])
REFERENCES [dbo].[pv_segmento] ([segmentoID])
GO
ALTER TABLE [dbo].[pv_propuestaSegmentosImpacto] CHECK CONSTRAINT [FK_pv_propuestaSegmentosImpacto_pv_segmento]
GO
ALTER TABLE [dbo].[pv_propuestaVotacion]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaVotacion_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_propuestaVotacion] CHECK CONSTRAINT [FK_pv_propuestaVotacion_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_propuestaVotacion]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestaVotacion_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_propuestaVotacion] CHECK CONSTRAINT [FK_pv_propuestaVotacion_pv_votacion]
GO
ALTER TABLE [dbo].[pv_provincias]  WITH CHECK ADD  CONSTRAINT [FK_pv_provincias_pv_paises] FOREIGN KEY([paisid])
REFERENCES [dbo].[pv_paises] ([paisid])
GO
ALTER TABLE [dbo].[pv_provincias] CHECK CONSTRAINT [FK_pv_provincias_pv_paises]
GO
ALTER TABLE [dbo].[pv_proyecto]  WITH CHECK ADD  CONSTRAINT [FK__pv_proyec__estad__37FA4C37] FOREIGN KEY([estadoID])
REFERENCES [dbo].[pv_estadoProyecto] ([estadoID])
GO
ALTER TABLE [dbo].[pv_proyecto] CHECK CONSTRAINT [FK__pv_proyec__estad__37FA4C37]
GO
ALTER TABLE [dbo].[pv_proyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_proyecto_pv_metodoTrabajo] FOREIGN KEY([metodoTrabajoID])
REFERENCES [dbo].[pv_metodoTrabajo] ([metodoTrabajoID])
GO
ALTER TABLE [dbo].[pv_proyecto] CHECK CONSTRAINT [FK_pv_proyecto_pv_metodoTrabajo]
GO
ALTER TABLE [dbo].[pv_proyecto]  WITH CHECK ADD  CONSTRAINT [FK_pv_proyecto_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_proyecto] CHECK CONSTRAINT [FK_pv_proyecto_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_pruebasVida]  WITH CHECK ADD  CONSTRAINT [FK_pv_pruebasVida_pv_metodoPruebas] FOREIGN KEY([metodoPruebaID])
REFERENCES [dbo].[pv_metodoPruebas] ([metodoPruebaID])
GO
ALTER TABLE [dbo].[pv_pruebasVida] CHECK CONSTRAINT [FK_pv_pruebasVida_pv_metodoPruebas]
GO
ALTER TABLE [dbo].[pv_pruebasVida]  WITH CHECK ADD  CONSTRAINT [FK_pv_pruebasVida_pv_sesiones] FOREIGN KEY([sesionID])
REFERENCES [dbo].[pv_sesiones] ([sesionid])
GO
ALTER TABLE [dbo].[pv_pruebasVida] CHECK CONSTRAINT [FK_pv_pruebasVida_pv_sesiones]
GO
ALTER TABLE [dbo].[pv_pruebasVida]  WITH CHECK ADD  CONSTRAINT [FK_pv_pruebasVida_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_pruebasVida] CHECK CONSTRAINT [FK_pv_pruebasVida_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_relacionesIA]  WITH CHECK ADD  CONSTRAINT [FK_pv_relacionesIA_pv_entidadesIA] FOREIGN KEY([entidadId])
REFERENCES [dbo].[pv_entidadesIA] ([entidadId])
GO
ALTER TABLE [dbo].[pv_relacionesIA] CHECK CONSTRAINT [FK_pv_relacionesIA_pv_entidadesIA]
GO
ALTER TABLE [dbo].[pv_requisitosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_requisitosPropuesta_pv_boletaRequisitosPropuestas] FOREIGN KEY([boletaID])
REFERENCES [dbo].[pv_boletaRequisitosPropuestas] ([boletaID])
GO
ALTER TABLE [dbo].[pv_requisitosPropuesta] CHECK CONSTRAINT [FK_pv_requisitosPropuesta_pv_boletaRequisitosPropuestas]
GO
ALTER TABLE [dbo].[pv_respuestaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestaParticipante_pv_pesoRespuesta] FOREIGN KEY([pesoRespuesta])
REFERENCES [dbo].[pv_pesoRespuesta] ([pesoID])
GO
ALTER TABLE [dbo].[pv_respuestaParticipante] CHECK CONSTRAINT [FK_pv_respuestaParticipante_pv_pesoRespuesta]
GO
ALTER TABLE [dbo].[pv_respuestaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestaParticipante_pv_preguntas] FOREIGN KEY([preguntaID])
REFERENCES [dbo].[pv_preguntas] ([preguntaID])
GO
ALTER TABLE [dbo].[pv_respuestaParticipante] CHECK CONSTRAINT [FK_pv_respuestaParticipante_pv_preguntas]
GO
ALTER TABLE [dbo].[pv_respuestaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestaParticipante_pv_respuestas] FOREIGN KEY([respuestaID])
REFERENCES [dbo].[pv_respuestas] ([respuestaID])
GO
ALTER TABLE [dbo].[pv_respuestaParticipante] CHECK CONSTRAINT [FK_pv_respuestaParticipante_pv_respuestas]
GO
ALTER TABLE [dbo].[pv_respuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestas_pv_preguntas] FOREIGN KEY([preguntaID])
REFERENCES [dbo].[pv_preguntas] ([preguntaID])
GO
ALTER TABLE [dbo].[pv_respuestas] CHECK CONSTRAINT [FK_pv_respuestas_pv_preguntas]
GO
ALTER TABLE [dbo].[pv_resultadosAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_resultadosAnalisis_pv_iaAnalisis] FOREIGN KEY([analisisId])
REFERENCES [dbo].[pv_iaAnalisis] ([analisisId])
GO
ALTER TABLE [dbo].[pv_resultadosAnalisis] CHECK CONSTRAINT [FK_pv_resultadosAnalisis_pv_iaAnalisis]
GO
ALTER TABLE [dbo].[pv_resultadoVotacion]  WITH CHECK ADD  CONSTRAINT [FK__pv_result__votac__3F9B6DFF] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_resultadoVotacion] CHECK CONSTRAINT [FK__pv_result__votac__3F9B6DFF]
GO
ALTER TABLE [dbo].[pv_revisionHumana]  WITH CHECK ADD  CONSTRAINT [FK_pv_revisionHumana_pv_iaAnalisis] FOREIGN KEY([analisisId])
REFERENCES [dbo].[pv_iaAnalisis] ([analisisId])
GO
ALTER TABLE [dbo].[pv_revisionHumana] CHECK CONSTRAINT [FK_pv_revisionHumana_pv_iaAnalisis]
GO
ALTER TABLE [dbo].[pv_revisionHumana]  WITH CHECK ADD  CONSTRAINT [FK_pv_revisionHumana_pv_usuarios] FOREIGN KEY([userId])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_revisionHumana] CHECK CONSTRAINT [FK_pv_revisionHumana_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_rolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_rolesUsuarios_pv_roles] FOREIGN KEY([rolId])
REFERENCES [dbo].[pv_roles] ([rolId])
GO
ALTER TABLE [dbo].[pv_rolesUsuarios] CHECK CONSTRAINT [FK_pv_rolesUsuarios_pv_roles]
GO
ALTER TABLE [dbo].[pv_rolesUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_rolesUsuarios_pv_usuarios] FOREIGN KEY([userId])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_rolesUsuarios] CHECK CONSTRAINT [FK_pv_rolesUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_sesiones]  WITH CHECK ADD  CONSTRAINT [FK_pv_sesiones_pv_plataformaAutenticacion] FOREIGN KEY([plataformaAutId])
REFERENCES [dbo].[pv_plataformaAutenticacion] ([plataformaAutId])
GO
ALTER TABLE [dbo].[pv_sesiones] CHECK CONSTRAINT [FK_pv_sesiones_pv_plataformaAutenticacion]
GO
ALTER TABLE [dbo].[pv_sesiones]  WITH CHECK ADD  CONSTRAINT [FK_pv_sesiones_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_sesiones] CHECK CONSTRAINT [FK_pv_sesiones_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_solicitudCambio]  WITH CHECK ADD  CONSTRAINT [FK_pv_solicitudCambio_pv_propuestas] FOREIGN KEY([propuestaid])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_solicitudCambio] CHECK CONSTRAINT [FK_pv_solicitudCambio_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_statusRegistroOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_statusRegistroOrgs_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_statusRegistroOrgs] CHECK CONSTRAINT [FK_pv_statusRegistroOrgs_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_statusRegistroOrgs]  WITH CHECK ADD  CONSTRAINT [FK_pv_statusRegistroOrgs_pv_statusRegistro] FOREIGN KEY([statusRegistroID])
REFERENCES [dbo].[pv_statusRegistro] ([statusRegistroID])
GO
ALTER TABLE [dbo].[pv_statusRegistroOrgs] CHECK CONSTRAINT [FK_pv_statusRegistroOrgs_pv_statusRegistro]
GO
ALTER TABLE [dbo].[pv_statusRegistroUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_StatusRegistroUsuarios_pv_statusRegistro] FOREIGN KEY([statusRegistroID])
REFERENCES [dbo].[pv_statusRegistro] ([statusRegistroID])
GO
ALTER TABLE [dbo].[pv_statusRegistroUsuarios] CHECK CONSTRAINT [FK_pv_StatusRegistroUsuarios_pv_statusRegistro]
GO
ALTER TABLE [dbo].[pv_statusRegistroUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_StatusRegistroUsuarios_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_statusRegistroUsuarios] CHECK CONSTRAINT [FK_pv_StatusRegistroUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_subTipoTransaccion]  WITH CHECK ADD FOREIGN KEY([tipoTransaccionID])
REFERENCES [dbo].[pv_tipoTransaccion] ([tipoTransaccionID])
GO
ALTER TABLE [dbo].[pv_tareasEtapa]  WITH CHECK ADD  CONSTRAINT [FK_pv_tareasEtapa_pv_etapasProyecto] FOREIGN KEY([etapaProyectoID])
REFERENCES [dbo].[pv_etapasProyecto] ([etapaProyectoID])
GO
ALTER TABLE [dbo].[pv_tareasEtapa] CHECK CONSTRAINT [FK_pv_tareasEtapa_pv_etapasProyecto]
GO
ALTER TABLE [dbo].[pv_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[pv_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[pv_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[pv_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[pv_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[pv_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[pv_tasaCambio]  WITH CHECK ADD FOREIGN KEY([monedaOrigen])
REFERENCES [dbo].[pv_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[pv_tasaCambio]  WITH CHECK ADD  CONSTRAINT [FK_pv_tasaCambio_py_moneda_Destino] FOREIGN KEY([monedaDestino])
REFERENCES [dbo].[pv_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[pv_tasaCambio] CHECK CONSTRAINT [FK_pv_tasaCambio_py_moneda_Destino]
GO
ALTER TABLE [dbo].[pv_tipoIncumplimiento]  WITH CHECK ADD  CONSTRAINT [FK_pv_tipoIncumplimiento_pv_severidadIncumplimiento] FOREIGN KEY([severidadIncumplimientoID])
REFERENCES [dbo].[pv_severidadIncumplimiento] ([severidadIcumplimientoID])
GO
ALTER TABLE [dbo].[pv_tipoIncumplimiento] CHECK CONSTRAINT [FK_pv_tipoIncumplimiento_pv_severidadIncumplimiento]
GO
ALTER TABLE [dbo].[pv_tiposPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_tiposPropuesta_pv_boletaRequisitosPropuestas] FOREIGN KEY([boletaID])
REFERENCES [dbo].[pv_boletaRequisitosPropuestas] ([boletaID])
GO
ALTER TABLE [dbo].[pv_tiposPropuesta] CHECK CONSTRAINT [FK_pv_tiposPropuesta_pv_boletaRequisitosPropuestas]
GO
ALTER TABLE [dbo].[pv_transaccion]  WITH CHECK ADD  CONSTRAINT [FK__pv_transa__proye__473C8FC7] FOREIGN KEY([proyectoID])
REFERENCES [dbo].[pv_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[pv_transaccion] CHECK CONSTRAINT [FK__pv_transa__proye__473C8FC7]
GO
ALTER TABLE [dbo].[pv_transaccion]  WITH CHECK ADD  CONSTRAINT [FK__pv_transa__subTi__4830B400] FOREIGN KEY([subTipoTransaccionID])
REFERENCES [dbo].[pv_subTipoTransaccion] ([subTipoTransaccionID])
GO
ALTER TABLE [dbo].[pv_transaccion] CHECK CONSTRAINT [FK__pv_transa__subTi__4830B400]
GO
ALTER TABLE [dbo].[pv_transaccion]  WITH CHECK ADD  CONSTRAINT [FK__pv_transa__tasaC__4924D839] FOREIGN KEY([tasaCambioID])
REFERENCES [dbo].[pv_tasaCambio] ([tasaCambioID])
GO
ALTER TABLE [dbo].[pv_transaccion] CHECK CONSTRAINT [FK__pv_transa__tasaC__4924D839]
GO
ALTER TABLE [dbo].[pv_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_pv_transaccion_pv_intentoPago] FOREIGN KEY([intentoPagoID])
REFERENCES [dbo].[pv_intentoPago] ([intentoPagoID])
GO
ALTER TABLE [dbo].[pv_transaccion] CHECK CONSTRAINT [FK_pv_transaccion_pv_intentoPago]
GO
ALTER TABLE [dbo].[pv_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_pv_transaccion_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_transaccion] CHECK CONSTRAINT [FK_pv_transaccion_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_ubicaciones_pv_cantones] FOREIGN KEY([cantonID])
REFERENCES [dbo].[pv_cantones] ([cantonID])
GO
ALTER TABLE [dbo].[pv_ubicaciones] CHECK CONSTRAINT [FK_pv_ubicaciones_pv_cantones]
GO
ALTER TABLE [dbo].[pv_ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_ubicaciones_pv_distrito] FOREIGN KEY([distritoID])
REFERENCES [dbo].[pv_distrito] ([distritoID])
GO
ALTER TABLE [dbo].[pv_ubicaciones] CHECK CONSTRAINT [FK_pv_ubicaciones_pv_distrito]
GO
ALTER TABLE [dbo].[pv_ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_ubicaciones_pv_paises] FOREIGN KEY([paisID])
REFERENCES [dbo].[pv_paises] ([paisid])
GO
ALTER TABLE [dbo].[pv_ubicaciones] CHECK CONSTRAINT [FK_pv_ubicaciones_pv_paises]
GO
ALTER TABLE [dbo].[pv_ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_ubicaciones_pv_provincias] FOREIGN KEY([proviniciaID])
REFERENCES [dbo].[pv_provincias] ([provinciaid])
GO
ALTER TABLE [dbo].[pv_ubicaciones] CHECK CONSTRAINT [FK_pv_ubicaciones_pv_provincias]
GO
ALTER TABLE [dbo].[pv_usuarios]  WITH NOCHECK ADD  CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_llavesUsuarios] ([llaveUsuarioID])
GO
ALTER TABLE [dbo].[pv_usuarios] CHECK CONSTRAINT [FK_pv_usuarios_pv_llavesUsuarios]
GO
ALTER TABLE [dbo].[pv_usuariosPermisos]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuariosPermisos_pv_permissions] FOREIGN KEY([permisoId])
REFERENCES [dbo].[pv_permissions] ([permissionId])
GO
ALTER TABLE [dbo].[pv_usuariosPermisos] CHECK CONSTRAINT [FK_pv_usuariosPermisos_pv_permissions]
GO
ALTER TABLE [dbo].[pv_usuariosPermisos]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuariosPermisos_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_usuariosPermisos] CHECK CONSTRAINT [FK_pv_usuariosPermisos_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_respuestaParticipante] FOREIGN KEY([respuestaParticipanteID])
REFERENCES [dbo].[pv_respuestaParticipante] ([respuestaParticipanteID])
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica] CHECK CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_respuestaParticipante]
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica] CHECK CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_usuarioVotacionPublica] CHECK CONSTRAINT [FK_pv_usuarioVotacionPublica_pv_votacion]
GO
ALTER TABLE [dbo].[pv_validacionIA]  WITH CHECK ADD  CONSTRAINT [FK_ValidacionIA_Propuesta] FOREIGN KEY([propuestaId])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pv_validacionIA] CHECK CONSTRAINT [FK_ValidacionIA_Propuesta]
GO
ALTER TABLE [dbo].[pv_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[pv_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[pv_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[pv_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[pv_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[pv_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[pv_versionPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_versionPropuesta_pv_propuestas] FOREIGN KEY([propuestaID])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_versionPropuesta] CHECK CONSTRAINT [FK_pv_versionPropuesta_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_votacion]  WITH CHECK ADD  CONSTRAINT [FK__pv_votaci__tipoV__52AE4273] FOREIGN KEY([tipoVotacionID])
REFERENCES [dbo].[pv_tipoVotacion] ([tipoVotacionID])
GO
ALTER TABLE [dbo].[pv_votacion] CHECK CONSTRAINT [FK__pv_votaci__tipoV__52AE4273]
GO
ALTER TABLE [dbo].[pv_votacion]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacion_pv_estadoVotacion] FOREIGN KEY([estadoVotacionID])
REFERENCES [dbo].[pv_estadoVotacion] ([estadoVotacionID])
GO
ALTER TABLE [dbo].[pv_votacion] CHECK CONSTRAINT [FK_pv_votacion_pv_estadoVotacion]
GO
ALTER TABLE [dbo].[pv_votacionesObjetivos]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionesObjetivos_pv_objetivosEtapa] FOREIGN KEY([objetivoProyectoID])
REFERENCES [dbo].[pv_objetivosEtapa] ([objetivoEtapaID])
GO
ALTER TABLE [dbo].[pv_votacionesObjetivos] CHECK CONSTRAINT [FK_pv_votacionesObjetivos_pv_objetivosEtapa]
GO
ALTER TABLE [dbo].[pv_votacionesObjetivos]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionesObjetivos_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_votacionesObjetivos] CHECK CONSTRAINT [FK_pv_votacionesObjetivos_pv_votacion]
GO
ALTER TABLE [dbo].[pv_votacionPregunta]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionPregunta_pv_preguntas] FOREIGN KEY([preguntaID])
REFERENCES [dbo].[pv_preguntas] ([preguntaID])
GO
ALTER TABLE [dbo].[pv_votacionPregunta] CHECK CONSTRAINT [FK_pv_votacionPregunta_pv_preguntas]
GO
ALTER TABLE [dbo].[pv_votacionPregunta]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionPregunta_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_votacionPregunta] CHECK CONSTRAINT [FK_pv_votacionPregunta_pv_votacion]
GO
ALTER TABLE [dbo].[pv_votacionSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionSegmento_pv_pesoRespuesta] FOREIGN KEY([pesoSegmento])
REFERENCES [dbo].[pv_pesoRespuesta] ([pesoID])
GO
ALTER TABLE [dbo].[pv_votacionSegmento] CHECK CONSTRAINT [FK_pv_votacionSegmento_pv_pesoRespuesta]
GO
ALTER TABLE [dbo].[pv_votacionSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionSegmento_pv_segmento] FOREIGN KEY([segmentoID])
REFERENCES [dbo].[pv_segmento] ([segmentoID])
GO
ALTER TABLE [dbo].[pv_votacionSegmento] CHECK CONSTRAINT [FK_pv_votacionSegmento_pv_segmento]
GO
ALTER TABLE [dbo].[pv_votacionSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_votacionSegmento_pv_votacion] FOREIGN KEY([votacionID])
REFERENCES [dbo].[pv_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[pv_votacionSegmento] CHECK CONSTRAINT [FK_pv_votacionSegmento_pv_votacion]
GO
ALTER TABLE [dbo].[pv_votanteGrupo]  WITH CHECK ADD FOREIGN KEY([grupoVotacionID])
REFERENCES [dbo].[pv_grupoVotacion] ([grupoVotacionID])
GO
ALTER TABLE [dbo].[pv_votanteGrupo]  WITH CHECK ADD  CONSTRAINT [FK_pv_votanteGrupo_pv_organizaciones] FOREIGN KEY([organizacionID])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_votanteGrupo] CHECK CONSTRAINT [FK_pv_votanteGrupo_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_votanteGrupo]  WITH CHECK ADD  CONSTRAINT [FK_pv_votanteGrupo_pv_usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_votanteGrupo] CHECK CONSTRAINT [FK_pv_votanteGrupo_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_wfDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_pv_wfDocumentos_pv_tipoDocumento] FOREIGN KEY([tipoDocumentoID])
REFERENCES [dbo].[pv_tipoDocumento] ([tipoDocumentoID])
GO
ALTER TABLE [dbo].[pv_wfDocumentos] CHECK CONSTRAINT [FK_pv_wfDocumentos_pv_tipoDocumento]
GO
ALTER TABLE [dbo].[pv_wfDocumentos]  WITH CHECK ADD  CONSTRAINT [FK_pv_wfDocumentos_pv_wfProceso] FOREIGN KEY([wfProcesoID])
REFERENCES [dbo].[pv_wfProceso] ([wfProcesoID])
GO
ALTER TABLE [dbo].[pv_wfDocumentos] CHECK CONSTRAINT [FK_pv_wfDocumentos_pv_wfProceso]
GO
ALTER TABLE [dbo].[pv_proponente]  WITH CHECK ADD CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[pv_proponente]  WITH CHECK ADD CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[pv_votanteGrupo]  WITH CHECK ADD  CONSTRAINT [CHK_Votante] CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[pv_votanteGrupo] CHECK CONSTRAINT [CHK_Votante]
GO
USE [master]
GO
ALTER DATABASE [VotoPV01] SET  READ_WRITE 
GO
