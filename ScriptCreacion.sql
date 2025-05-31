USE [master]
GO
/****** Object:  Database [VotoPV]    Script Date: 31/5/2025 09:56:10 ******/
CREATE DATABASE [VotoPV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VotoPV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VotoPV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VotoPV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VotoPV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VotoPV] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VotoPV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VotoPV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VotoPV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VotoPV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VotoPV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VotoPV] SET ARITHABORT OFF 
GO
ALTER DATABASE [VotoPV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VotoPV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VotoPV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VotoPV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VotoPV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VotoPV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VotoPV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VotoPV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VotoPV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VotoPV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VotoPV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VotoPV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VotoPV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VotoPV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VotoPV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VotoPV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VotoPV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VotoPV] SET RECOVERY FULL 
GO
ALTER DATABASE [VotoPV] SET  MULTI_USER 
GO
ALTER DATABASE [VotoPV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VotoPV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VotoPV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VotoPV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VotoPV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VotoPV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VotoPV', N'ON'
GO
ALTER DATABASE [VotoPV] SET QUERY_STORE = ON
GO
ALTER DATABASE [VotoPV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VotoPV]
GO
/****** Object:  Table [dbo].[pv_cantones]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_comentariosPropuesta]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_comentariosPropuesta](
	[comentarioid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[fechaPublicación] [datetime] NOT NULL,
	[comentDetalleid] [varchar](400) NOT NULL,
	[estadoComentid] [int] NOT NULL,
	[propuestaid] [int] NOT NULL,
 CONSTRAINT [PK_pv_comentariosPropuesta] PRIMARY KEY CLUSTERED 
(
	[comentarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_contact]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_contactType]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_criterio]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_criterio](
	[criterioID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[comparador] [varchar](1) NOT NULL,
	[valor] [int] NOT NULL,
 CONSTRAINT [PK_pv_criterio] PRIMARY KEY CLUSTERED 
(
	[criterioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_detalleSegmento]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_detalleSegmento](
	[detalleID] [int] IDENTITY(1,1) NOT NULL,
	[segmentoID] [int] NULL,
	[criterioID] [int] NULL,
	[tipoDetalleID] [int] NULL,
 CONSTRAINT [PK_pv_detalleSegmento] PRIMARY KEY CLUSTERED 
(
	[detalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_detallesHorarios]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_direcciones]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_direccionesUsuarios]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_distrito]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_educacionUsuario]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_encuesta]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_encuesta](
	[encuestaID] [int] IDENTITY(1,1) NOT NULL,
	[eventoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_encuesta] PRIMARY KEY CLUSTERED 
(
	[encuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoComentarios]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoComentarios](
	[estadoComentid] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_estadoComentarios] PRIMARY KEY CLUSTERED 
(
	[estadoComentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_estadoSolicitud]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_estadoSolicitud](
	[estadoid] [int] NOT NULL,
	[faseSolicitudid] [int] NOT NULL,
	[inicioFase] [datetime] NOT NULL,
	[solicitudCambioid] [int] NOT NULL,
 CONSTRAINT [PK_pv_estadoSolicitud] PRIMARY KEY CLUSTERED 
(
	[estadoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_evento]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_evento](
	[eventoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](250) NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[segmentoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_evento] PRIMARY KEY CLUSTERED 
(
	[eventoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_faseComentario]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_faseComentario](
	[faseComentid] [int] NOT NULL,
	[comentarioid] [int] NOT NULL,
	[estadoComentid] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
 CONSTRAINT [PK_pv_faseComentario] PRIMARY KEY CLUSTERED 
(
	[faseComentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_faseSolicitudes]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_faseSolicitudes](
	[faseSolicitudid] [int] NOT NULL,
	[nombre] [varchar](10) NOT NULL,
 CONSTRAINT [PK_pv_faseSolicitudes] PRIMARY KEY CLUSTERED 
(
	[faseSolicitudid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_faseValidacion]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_faseValidacion](
	[faseValidacionid] [int] IDENTITY(1,1) NOT NULL,
	[tipoValidacionId] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[documentoPlantilla] [int] NOT NULL,
	[ultimaActualizacion] [datetime] NULL,
 CONSTRAINT [PK_pv_faseValidacion] PRIMARY KEY CLUSTERED 
(
	[faseValidacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_horarios]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_iaAnalisis]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_iaAnalisis](
	[analisisId] [int] IDENTITY(1,1) NOT NULL,
	[mediaFileid] [int] NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[fechaComienzo] [datetime] NOT NULL,
	[fechaFinalizacion] [datetime] NOT NULL,
	[infoid] [int] NOT NULL,
	[tipoDocumento] [varchar](40) NOT NULL,
 CONSTRAINT [PK_pv_iaAnalisis] PRIMARY KEY CLUSTERED 
(
	[analisisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_infoIA]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_infoIA](
	[infoId] [int] NOT NULL,
	[modeloIA] [varchar](40) NOT NULL,
	[apiKey] [varchar](256) NOT NULL,
	[token] [varchar](256) NOT NULL,
	[maxTokens] [int] NOT NULL,
 CONSTRAINT [PK_pv_infoIA] PRIMARY KEY CLUSTERED 
(
	[infoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_listaBlancaIPs]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_listaBlancaIPs](
	[ipPermitido] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_logOrigen]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_logs]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_logTipos]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_mediaFiles]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_mediaTypes]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_nivelEducacion]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_organizaciones]    Script Date: 31/5/2025 09:56:11 ******/
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
 CONSTRAINT [PK_pv_organizaciones] PRIMARY KEY CLUSTERED 
(
	[organizacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_orgUsuarios]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_orgUsuarios](
	[orgUsuarioid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[organizacionid] [int] NOT NULL,
	[esActivo] [bit] NOT NULL,
 CONSTRAINT [PK_pv_orgUsuarios] PRIMARY KEY CLUSTERED 
(
	[orgUsuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_paises]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_permissions]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_plataformaAutenticacion]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_preguntas]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_preguntas](
	[preguntaID] [int] IDENTITY(1,1) NOT NULL,
	[encuestaID] [int] NOT NULL,
	[enunciado] [varchar](500) NULL,
	[tipoPreguntaID] [int] NULL,
 CONSTRAINT [PK_pv_preguntas] PRIMARY KEY CLUSTERED 
(
	[preguntaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_profesiones]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_profesiones](
	[profesionID] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_profesiones] PRIMARY KEY CLUSTERED 
(
	[profesionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestaCategoria]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestaCategoria](
	[categoriaid] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_propuestaCategoria] PRIMARY KEY CLUSTERED 
(
	[categoriaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_propuestas]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_propuestas](
	[propuestaid] [int] NOT NULL,
	[categoriaid] [int] NOT NULL,
	[descripcion] [varchar](200) NULL,
	[imgURL] [varchar](300) NULL,
	[version] [varchar](8) NOT NULL,
	[publicada] [bit] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[fechaFin] [datetime] NULL,
	[checksum] [varbinary](300) NOT NULL,
	[comentarios] [bit] NOT NULL,
	[eventoID] [int] NOT NULL,
 CONSTRAINT [PK_pv_propuestas] PRIMARY KEY CLUSTERED 
(
	[propuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_provincias]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_respuestaParticipante]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_respuestaParticipante](
	[respuestaParticipanteID] [int] IDENTITY(1,1) NOT NULL,
	[preguntaID] [int] NOT NULL,
	[respuestaID] [int] NOT NULL,
	[valorRespuesta] [varchar](50) NOT NULL,
	[esMancomunada] [bit] NOT NULL,
	[userid] [int] NOT NULL,
	[checksum] [varbinary](500) NOT NULL,
 CONSTRAINT [PK_pv_respuestaParticipante] PRIMARY KEY CLUSTERED 
(
	[respuestaParticipanteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_respuestas]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_respuestas](
	[respuestaID] [int] IDENTITY(1,1) NOT NULL,
	[preguntaID] [int] NOT NULL,
	[respuesta] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_respuestas] PRIMARY KEY CLUSTERED 
(
	[respuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_resultadosAnalisis]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_resultadosAnalisis](
	[resultadoId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[pv_revisionHumana]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_revisionHumana](
	[revisionHumanaId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[pv_roles]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_rolesUsuarios]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_segmento]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_segmento](
	[segmentoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_segmento] PRIMARY KEY CLUSTERED 
(
	[segmentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_sesiones]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_severidadLogs]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_solicitudCambio]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_solicitudCambio](
	[solicitudCambioid] [int] NOT NULL,
	[propuestaid] [int] NOT NULL,
	[cambioPlanteado] [varchar](200) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
 CONSTRAINT [PK_pv_solicitudCambio] PRIMARY KEY CLUSTERED 
(
	[solicitudCambioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_tipoDetalle]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_tipoPregunta]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_ubicaciones]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_ubicaciones](
	[ubicacionID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[pv_usuarios]    Script Date: 31/5/2025 09:56:11 ******/
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
	[salt] [varbinary](250) NULL,
	[profesionID] [int] NULL,
 CONSTRAINT [PK_pv_usuarios] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_usuariosPermisos]    Script Date: 31/5/2025 09:56:11 ******/
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
/****** Object:  Table [dbo].[pv_validaciones]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validaciones](
	[validacionId] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFinal] [datetime] NOT NULL,
	[faseValidacionid] [int] NOT NULL,
	[validadorId] [nchar](10) NOT NULL,
	[mediaFileId] [int] NOT NULL,
	[aprobado] [bit] NOT NULL,
 CONSTRAINT [PK_pv_validaciones] PRIMARY KEY CLUSTERED 
(
	[validacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionesCategoria]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionesCategoria](
	[validacionCatid] [int] NOT NULL,
	[categoriaid] [int] NOT NULL,
 CONSTRAINT [PK_pv_validacionesCategoria] PRIMARY KEY CLUSTERED 
(
	[validacionCatid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionesTipos]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionesTipos](
	[tipoValidacionId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pv_validacionesTipos] PRIMARY KEY CLUSTERED 
(
	[tipoValidacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionPropuestas]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionPropuestas](
	[validacionPropuestaid] [int] NOT NULL,
	[validacionId] [int] NOT NULL,
	[propuestaId] [int] NOT NULL,
 CONSTRAINT [PK_pv_validacionPropuestas] PRIMARY KEY CLUSTERED 
(
	[validacionPropuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validacionUsuarios]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validacionUsuarios](
	[validacionUsuarioid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[validacionId] [int] NOT NULL,
 CONSTRAINT [PK_pv_validacionUsuarios] PRIMARY KEY CLUSTERED 
(
	[validacionUsuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_validadores]    Script Date: 31/5/2025 09:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pv_validadores](
	[validadoresId] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[validacionId] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[aprobado] [bit] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_pv_validadores] PRIMARY KEY CLUSTERED 
(
	[validadoresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pv_cantones]  WITH CHECK ADD  CONSTRAINT [FK_pv_cantones_pv_provincias] FOREIGN KEY([provinciaID])
REFERENCES [dbo].[pv_provincias] ([provinciaid])
GO
ALTER TABLE [dbo].[pv_cantones] CHECK CONSTRAINT [FK_pv_cantones_pv_provincias]
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas] FOREIGN KEY([propuestaid])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta] CHECK CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas]
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
ALTER TABLE [dbo].[pv_detalleSegmento]  WITH CHECK ADD  CONSTRAINT [FK_pv_detalleSegmento_pv_criterio] FOREIGN KEY([criterioID])
REFERENCES [dbo].[pv_criterio] ([criterioID])
GO
ALTER TABLE [dbo].[pv_detalleSegmento] CHECK CONSTRAINT [FK_pv_detalleSegmento_pv_criterio]
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
ALTER TABLE [dbo].[pv_encuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_encuesta_pv_evento] FOREIGN KEY([eventoID])
REFERENCES [dbo].[pv_evento] ([eventoID])
GO
ALTER TABLE [dbo].[pv_encuesta] CHECK CONSTRAINT [FK_pv_encuesta_pv_evento]
GO
ALTER TABLE [dbo].[pv_estadoSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_pv_estadoSolicitud_pv_faseSolicitudes] FOREIGN KEY([faseSolicitudid])
REFERENCES [dbo].[pv_faseSolicitudes] ([faseSolicitudid])
GO
ALTER TABLE [dbo].[pv_estadoSolicitud] CHECK CONSTRAINT [FK_pv_estadoSolicitud_pv_faseSolicitudes]
GO
ALTER TABLE [dbo].[pv_estadoSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_pv_estadoSolicitud_pv_solicitudCambio] FOREIGN KEY([solicitudCambioid])
REFERENCES [dbo].[pv_solicitudCambio] ([solicitudCambioid])
GO
ALTER TABLE [dbo].[pv_estadoSolicitud] CHECK CONSTRAINT [FK_pv_estadoSolicitud_pv_solicitudCambio]
GO
ALTER TABLE [dbo].[pv_evento]  WITH CHECK ADD  CONSTRAINT [FK_pv_evento_pv_segmento] FOREIGN KEY([segmentoID])
REFERENCES [dbo].[pv_segmento] ([segmentoID])
GO
ALTER TABLE [dbo].[pv_evento] CHECK CONSTRAINT [FK_pv_evento_pv_segmento]
GO
ALTER TABLE [dbo].[pv_faseComentario]  WITH CHECK ADD  CONSTRAINT [FK_pv_faseComentario_pv_comentariosPropuesta] FOREIGN KEY([comentarioid])
REFERENCES [dbo].[pv_comentariosPropuesta] ([comentarioid])
GO
ALTER TABLE [dbo].[pv_faseComentario] CHECK CONSTRAINT [FK_pv_faseComentario_pv_comentariosPropuesta]
GO
ALTER TABLE [dbo].[pv_faseComentario]  WITH CHECK ADD  CONSTRAINT [FK_pv_faseComentario_pv_estadoComentarios] FOREIGN KEY([estadoComentid])
REFERENCES [dbo].[pv_estadoComentarios] ([estadoComentid])
GO
ALTER TABLE [dbo].[pv_faseComentario] CHECK CONSTRAINT [FK_pv_faseComentario_pv_estadoComentarios]
GO
ALTER TABLE [dbo].[pv_faseValidacion]  WITH CHECK ADD  CONSTRAINT [FK_pv_faseValidacion_pv_mediaFiles] FOREIGN KEY([documentoPlantilla])
REFERENCES [dbo].[pv_mediaFiles] ([mediaFileId])
GO
ALTER TABLE [dbo].[pv_faseValidacion] CHECK CONSTRAINT [FK_pv_faseValidacion_pv_mediaFiles]
GO
ALTER TABLE [dbo].[pv_faseValidacion]  WITH CHECK ADD  CONSTRAINT [FK_pv_faseValidacion_pv_validacionesTipos] FOREIGN KEY([tipoValidacionId])
REFERENCES [dbo].[pv_validacionesTipos] ([tipoValidacionId])
GO
ALTER TABLE [dbo].[pv_faseValidacion] CHECK CONSTRAINT [FK_pv_faseValidacion_pv_validacionesTipos]
GO
ALTER TABLE [dbo].[pv_iaAnalisis]  WITH CHECK ADD  CONSTRAINT [FK_pv_iaAnalisis_pv_infoIA] FOREIGN KEY([infoid])
REFERENCES [dbo].[pv_infoIA] ([infoId])
GO
ALTER TABLE [dbo].[pv_iaAnalisis] CHECK CONSTRAINT [FK_pv_iaAnalisis_pv_infoIA]
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
ALTER TABLE [dbo].[pv_orgUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuarios_pv_organizaciones] FOREIGN KEY([organizacionid])
REFERENCES [dbo].[pv_organizaciones] ([organizacionid])
GO
ALTER TABLE [dbo].[pv_orgUsuarios] CHECK CONSTRAINT [FK_pv_orgUsuarios_pv_organizaciones]
GO
ALTER TABLE [dbo].[pv_orgUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_orgUsuarios_pv_usuarios] FOREIGN KEY([orgUsuarioid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_orgUsuarios] CHECK CONSTRAINT [FK_pv_orgUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_pv_preguntas_pv_encuesta] FOREIGN KEY([encuestaID])
REFERENCES [dbo].[pv_encuesta] ([encuestaID])
GO
ALTER TABLE [dbo].[pv_preguntas] CHECK CONSTRAINT [FK_pv_preguntas_pv_encuesta]
GO
ALTER TABLE [dbo].[pv_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_pv_preguntas_pv_tipoPregunta] FOREIGN KEY([tipoPreguntaID])
REFERENCES [dbo].[pv_tipoPregunta] ([tipoPreguntaID])
GO
ALTER TABLE [dbo].[pv_preguntas] CHECK CONSTRAINT [FK_pv_preguntas_pv_tipoPregunta]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_evento] FOREIGN KEY([eventoID])
REFERENCES [dbo].[pv_evento] ([eventoID])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_evento]
GO
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria] FOREIGN KEY([categoriaid])
REFERENCES [dbo].[pv_propuestaCategoria] ([categoriaid])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria]
GO
ALTER TABLE [dbo].[pv_provincias]  WITH CHECK ADD  CONSTRAINT [FK_pv_provincias_pv_paises] FOREIGN KEY([paisid])
REFERENCES [dbo].[pv_paises] ([paisid])
GO
ALTER TABLE [dbo].[pv_provincias] CHECK CONSTRAINT [FK_pv_provincias_pv_paises]
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
ALTER TABLE [dbo].[pv_respuestaParticipante]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestaParticipante_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_respuestaParticipante] CHECK CONSTRAINT [FK_pv_respuestaParticipante_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_respuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_respuestas_pv_preguntas] FOREIGN KEY([preguntaID])
REFERENCES [dbo].[pv_preguntas] ([preguntaID])
GO
ALTER TABLE [dbo].[pv_respuestas] CHECK CONSTRAINT [FK_pv_respuestas_pv_preguntas]
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
ALTER TABLE [dbo].[pv_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_usuarios_pv_profesiones] FOREIGN KEY([profesionID])
REFERENCES [dbo].[pv_profesiones] ([profesionID])
GO
ALTER TABLE [dbo].[pv_usuarios] CHECK CONSTRAINT [FK_pv_usuarios_pv_profesiones]
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
ALTER TABLE [dbo].[pv_validaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_validaciones_pv_faseValidacion] FOREIGN KEY([faseValidacionid])
REFERENCES [dbo].[pv_faseValidacion] ([faseValidacionid])
GO
ALTER TABLE [dbo].[pv_validaciones] CHECK CONSTRAINT [FK_pv_validaciones_pv_faseValidacion]
GO
ALTER TABLE [dbo].[pv_validaciones]  WITH CHECK ADD  CONSTRAINT [FK_pv_validaciones_pv_mediaFiles1] FOREIGN KEY([mediaFileId])
REFERENCES [dbo].[pv_mediaFiles] ([mediaFileId])
GO
ALTER TABLE [dbo].[pv_validaciones] CHECK CONSTRAINT [FK_pv_validaciones_pv_mediaFiles1]
GO
ALTER TABLE [dbo].[pv_validacionesCategoria]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionesCategoria_pv_propuestaCategoria] FOREIGN KEY([categoriaid])
REFERENCES [dbo].[pv_propuestaCategoria] ([categoriaid])
GO
ALTER TABLE [dbo].[pv_validacionesCategoria] CHECK CONSTRAINT [FK_pv_validacionesCategoria_pv_propuestaCategoria]
GO
ALTER TABLE [dbo].[pv_validacionPropuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionPropuestas_pv_propuestas] FOREIGN KEY([propuestaId])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_validacionPropuestas] CHECK CONSTRAINT [FK_pv_validacionPropuestas_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_validacionPropuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionPropuestas_pv_validaciones] FOREIGN KEY([validacionId])
REFERENCES [dbo].[pv_validaciones] ([validacionId])
GO
ALTER TABLE [dbo].[pv_validacionPropuestas] CHECK CONSTRAINT [FK_pv_validacionPropuestas_pv_validaciones]
GO
ALTER TABLE [dbo].[pv_validacionUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionUsuarios_pv_usuarios] FOREIGN KEY([userid])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_validacionUsuarios] CHECK CONSTRAINT [FK_pv_validacionUsuarios_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_validacionUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionUsuarios_pv_validaciones] FOREIGN KEY([validacionId])
REFERENCES [dbo].[pv_validaciones] ([validacionId])
GO
ALTER TABLE [dbo].[pv_validacionUsuarios] CHECK CONSTRAINT [FK_pv_validacionUsuarios_pv_validaciones]
GO
ALTER TABLE [dbo].[pv_validadores]  WITH CHECK ADD  CONSTRAINT [FK_pv_validadores_pv_usuarios] FOREIGN KEY([validacionId])
REFERENCES [dbo].[pv_usuarios] ([userid])
GO
ALTER TABLE [dbo].[pv_validadores] CHECK CONSTRAINT [FK_pv_validadores_pv_usuarios]
GO
ALTER TABLE [dbo].[pv_validadores]  WITH CHECK ADD  CONSTRAINT [FK_pv_validadores_pv_validaciones] FOREIGN KEY([validacionId])
REFERENCES [dbo].[pv_validaciones] ([validacionId])
GO
ALTER TABLE [dbo].[pv_validadores] CHECK CONSTRAINT [FK_pv_validadores_pv_validaciones]
GO
USE [master]
GO
ALTER DATABASE [VotoPV] SET  READ_WRITE 
GO
