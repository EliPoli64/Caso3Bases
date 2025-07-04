USE [master]
GO
/****** Object:  Database [crowdfundingDB]    Script Date: 2/6/2025 02:25:08 ******/
CREATE DATABASE [crowdfundingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'crowdfundingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\crowdfundingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'crowdfundingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\crowdfundingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [crowdfundingDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [crowdfundingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [crowdfundingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [crowdfundingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [crowdfundingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [crowdfundingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [crowdfundingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [crowdfundingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [crowdfundingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [crowdfundingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [crowdfundingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [crowdfundingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [crowdfundingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [crowdfundingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [crowdfundingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [crowdfundingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [crowdfundingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [crowdfundingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [crowdfundingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [crowdfundingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [crowdfundingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [crowdfundingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [crowdfundingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [crowdfundingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [crowdfundingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [crowdfundingDB] SET  MULTI_USER 
GO
ALTER DATABASE [crowdfundingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [crowdfundingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [crowdfundingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [crowdfundingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [crowdfundingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [crowdfundingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'crowdfundingDB', N'ON'
GO
ALTER DATABASE [crowdfundingDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [crowdfundingDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [crowdfundingDB]
GO
/****** Object:  Table [dbo].[cf_avalGubernamental]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_avalGubernamental](
	[avalID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[tipoID] [int] NOT NULL,
	[fechaAval] [datetime] NOT NULL,
	[descripcion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[avalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_condicionAval]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_condicionAval](
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
/****** Object:  Table [dbo].[cf_criterioProyecto]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_criterioProyecto](
	[criterioProyectoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[criterioID] [int] NULL,
	[tipoCriterio] [nvarchar](100) NOT NULL,
	[valor] [nvarchar](255) NOT NULL,
	[esRequisito] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[criterioProyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_criterioTerritorial]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_criterioTerritorial](
	[criterioID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[tipo] [nvarchar](100) NOT NULL,
	[valor] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[criterioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_desembolso]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_desembolso](
	[desembolsoID] [int] IDENTITY(1,1) NOT NULL,
	[planID] [int] NOT NULL,
	[fechaDesembolso] [datetime] NULL,
	[estado] [nvarchar](50) NOT NULL,
	[referenciaTransaccion] [nvarchar](100) NULL,
	[fechaSolicitud] [datetime] NULL,
	[fechaAprobacion] [datetime] NULL,
	[aprobadoPor] [int] NULL,
	[comentarios] [nvarchar](max) NULL,
	[estadoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[desembolsoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_documentoPropuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_documentoPropuesta](
	[documentoID] [int] IDENTITY(1,1) NOT NULL,
	[versionID] [int] NOT NULL,
	[tipoDocumento] [nvarchar](100) NOT NULL,
	[urlDocumento] [nvarchar](max) NOT NULL,
	[fechaSubida] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[documentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_estadoDesembolso]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_estadoDesembolso](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_estadoPropuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_estadoPropuesta](
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
/****** Object:  Table [dbo].[cf_estadoProyecto]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_estadoProyecto](
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
/****** Object:  Table [dbo].[cf_evidenciaDesembolso]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_evidenciaDesembolso](
	[evidenciaID] [int] IDENTITY(1,1) NOT NULL,
	[desembolsoID] [int] NOT NULL,
	[tipoDocumento] [nvarchar](100) NOT NULL,
	[urlDocumento] [nvarchar](max) NOT NULL,
	[fechaSubida] [datetime] NOT NULL,
	[subidoPor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[evidenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_evidenciaIrregularidad]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_evidenciaIrregularidad](
	[evidenciaID] [int] IDENTITY(1,1) NOT NULL,
	[reporteID] [int] NOT NULL,
	[urlEvidencia] [nvarchar](max) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
	[fechaSubida] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[evidenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_fiscalizador]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_fiscalizador](
	[fiscalizadorID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[proyectoID] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[nivelAcceso] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fiscalizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Fiscalizador] UNIQUE NONCLUSTERED 
(
	[usuarioID] ASC,
	[proyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_grupoValidador]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_grupoValidador](
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
/****** Object:  Table [dbo].[cf_grupoVotacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_grupoVotacion](
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
/****** Object:  Table [dbo].[cf_hook]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_hook](
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
/****** Object:  Table [dbo].[cf_incentivoGubernamental]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_incentivoGubernamental](
	[incentivoID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[entidad] [nvarchar](100) NOT NULL,
	[tipoBeneficio] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[incentivoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_incentivoProyecto]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_incentivoProyecto](
	[incentivoProyectoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[incentivoID] [int] NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[fechaResolucion] [datetime] NULL,
	[votacionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[incentivoProyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_incumplimiento]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_incumplimiento](
	[incumplimientoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[reporteID] [int] NULL,
	[tipo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[fechaReporte] [datetime] NOT NULL,
	[reportadoPor] [int] NOT NULL,
	[severidad] [nvarchar](50) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[incumplimientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_inversion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_inversion](
	[inversionID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[inversorID] [int] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[monedaID] [int] NOT NULL,
	[fechaInversion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inversionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_miembroOrganizacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_miembroOrganizacion](
	[miembroID] [int] IDENTITY(1,1) NOT NULL,
	[organizacionID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[rol] [nvarchar](100) NOT NULL,
	[esRepresentanteLegal] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[miembroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_moduloExtension]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_moduloExtension](
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
/****** Object:  Table [dbo].[cf_moduloHook]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_moduloHook](
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
/****** Object:  Table [dbo].[cf_moneda]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_moneda](
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
/****** Object:  Table [dbo].[cf_organizacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_organizacion](
	[organizacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[tipoOrganizacionID] [int] NULL,
	[identificacionTributaria] [nvarchar](50) NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[organizacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[identificacionTributaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_pagoInversor]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_pagoInversor](
	[pagoID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[inversorID] [int] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[monedaID] [int] NOT NULL,
	[fechaProgramada] [datetime] NOT NULL,
	[fechaPago] [datetime] NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_planDesembolso]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_planDesembolso](
	[planID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[numeroCuota] [int] NOT NULL,
	[fechaProgramada] [datetime] NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[monedaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[planID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_procesoLegal]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_procesoLegal](
	[procesoID] [int] IDENTITY(1,1) NOT NULL,
	[incumplimientoID] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[entidadResponsable] [nvarchar](255) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[resultado] [nvarchar](max) NULL,
	[fechaCierre] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[procesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_proponente]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_proponente](
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
/****** Object:  Table [dbo].[cf_propuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_propuesta](
	[propuestaID] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[tipoID] [int] NOT NULL,
	[estadoID] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaActualizacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[propuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_proyecto]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_proyecto](
	[proyectoID] [int] IDENTITY(1,1) NOT NULL,
	[propuestaID] [int] NOT NULL,
	[estadoID] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaEstimadaFin] [datetime] NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[propuestaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_reporteFinanciero]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_reporteFinanciero](
	[reporteID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[tipoID] [int] NOT NULL,
	[periodoInicio] [date] NOT NULL,
	[periodoFin] [date] NOT NULL,
	[urlReporte] [nvarchar](max) NOT NULL,
	[fechaPresentacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reporteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_reporteIrregularidad]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_reporteIrregularidad](
	[reporteID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[reportanteID] [int] NOT NULL,
	[fechaReporte] [datetime] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reporteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_requisitoTipo]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_requisitoTipo](
	[requisitoID] [int] IDENTITY(1,1) NOT NULL,
	[tipoID] [int] NOT NULL,
	[nombreRequisito] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NOT NULL,
	[esObligatorio] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[requisitoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_resultadoVotacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_resultadoVotacion](
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
/****** Object:  Table [dbo].[cf_sancion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_sancion](
	[sancionID] [int] IDENTITY(1,1) NOT NULL,
	[procesoID] [int] NOT NULL,
	[tipo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[monto] [decimal](18, 2) NULL,
	[fechaAplicacion] [datetime] NOT NULL,
	[fechaVencimiento] [datetime] NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sancionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_subTipoTransaccion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_subTipoTransaccion](
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
/****** Object:  Table [dbo].[cf_tarifaGrupo]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tarifaGrupo](
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
/****** Object:  Table [dbo].[cf_tasaCambio]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tasaCambio](
	[tasaCambioID] [int] IDENTITY(1,1) NOT NULL,
	[monedaID] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[tasa] [float] NOT NULL,
	[activa] [bit] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tasaCambioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_tipoAval]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoAval](
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
/****** Object:  Table [dbo].[cf_tipoGrupoValidador]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoGrupoValidador](
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
/****** Object:  Table [dbo].[cf_tipoIrregularidad]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoIrregularidad](
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
/****** Object:  Table [dbo].[cf_tipoOrganizacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoOrganizacion](
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
/****** Object:  Table [dbo].[cf_tipoPropuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoPropuesta](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[cf_tipoReporteFinanciero]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoReporteFinanciero](
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
/****** Object:  Table [dbo].[cf_tipoTransaccion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoTransaccion](
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
/****** Object:  Table [dbo].[cf_tipoVotacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_tipoVotacion](
	[tipoVotacionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoVotacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_transaccion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_transaccion](
	[transaccionID] [bigint] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[proyectoID] [int] NULL,
	[monto] [float] NOT NULL,
	[montoConvertido] [float] NULL,
	[descripcion] [nvarchar](200) NULL,
	[fechaTransaccion] [datetime] NOT NULL,
	[horaRegistro] [time](7) NOT NULL,
	[referencia] [nvarchar](50) NULL,
	[checksum] [varbinary](64) NULL,
	[tipoTransaccionID] [int] NOT NULL,
	[subTipoTransaccionID] [int] NULL,
	[tasaCambioID] [int] NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[transaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_usuario]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_usuario](
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellido] [nvarchar](100) NOT NULL,
	[correoElectronico] [nvarchar](255) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_validacionPropuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_validacionPropuesta](
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
/****** Object:  Table [dbo].[cf_versionPropuesta]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_versionPropuesta](
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
/****** Object:  Table [dbo].[cf_visitaFiscalizacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_visitaFiscalizacion](
	[visitaID] [int] IDENTITY(1,1) NOT NULL,
	[proyectoID] [int] NOT NULL,
	[fiscalizadorID] [int] NOT NULL,
	[fechaVisita] [datetime] NOT NULL,
	[observaciones] [nvarchar](max) NULL,
	[recomendaciones] [nvarchar](max) NULL,
	[fechaInforme] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[visitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_votacion]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_votacion](
	[votacionID] [int] IDENTITY(1,1) NOT NULL,
	[tipoVotacionID] [int] NOT NULL,
	[proyectoID] [int] NULL,
	[propuestaID] [int] NULL,
	[reporteID] [int] NULL,
	[titulo] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[umbralAprobacion] [decimal](5, 2) NULL,
	[estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[votacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cf_votanteGrupo]    Script Date: 2/6/2025 02:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cf_votanteGrupo](
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
/****** Object:  Index [idx_cf_subTipoTransaccion_tipo]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_subTipoTransaccion_tipo] ON [dbo].[cf_subTipoTransaccion]
(
	[tipoTransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_tasaCambio_fechas]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_tasaCambio_fechas] ON [dbo].[cf_tasaCambio]
(
	[fechaInicio] ASC,
	[fechaFin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_tasaCambio_moneda]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_tasaCambio_moneda] ON [dbo].[cf_tasaCambio]
(
	[monedaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_transaccion_fecha]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_transaccion_fecha] ON [dbo].[cf_transaccion]
(
	[fechaTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_transaccion_proyecto]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_transaccion_proyecto] ON [dbo].[cf_transaccion]
(
	[proyectoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_transaccion_tipo]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_transaccion_tipo] ON [dbo].[cf_transaccion]
(
	[tipoTransaccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_cf_transaccion_usuario]    Script Date: 2/6/2025 02:25:08 ******/
CREATE NONCLUSTERED INDEX [idx_cf_transaccion_usuario] ON [dbo].[cf_transaccion]
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cf_criterioProyecto] ADD  DEFAULT ((1)) FOR [esRequisito]
GO
ALTER TABLE [dbo].[cf_desembolso] ADD  DEFAULT ((1)) FOR [estadoID]
GO
ALTER TABLE [dbo].[cf_documentoPropuesta] ADD  DEFAULT (getdate()) FOR [fechaSubida]
GO
ALTER TABLE [dbo].[cf_evidenciaDesembolso] ADD  DEFAULT (getdate()) FOR [fechaSubida]
GO
ALTER TABLE [dbo].[cf_evidenciaIrregularidad] ADD  DEFAULT (getdate()) FOR [fechaSubida]
GO
ALTER TABLE [dbo].[cf_fiscalizador] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[cf_fiscalizador] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[cf_grupoValidador] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_grupoVotacion] ADD  DEFAULT ((0)) FOR [esSegmentado]
GO
ALTER TABLE [dbo].[cf_hook] ADD  DEFAULT ((0)) FOR [prioridad]
GO
ALTER TABLE [dbo].[cf_incumplimiento] ADD  DEFAULT (getdate()) FOR [fechaReporte]
GO
ALTER TABLE [dbo].[cf_inversion] ADD  DEFAULT (getdate()) FOR [fechaInversion]
GO
ALTER TABLE [dbo].[cf_miembroOrganizacion] ADD  DEFAULT ((0)) FOR [esRepresentanteLegal]
GO
ALTER TABLE [dbo].[cf_moduloExtension] ADD  DEFAULT (getdate()) FOR [fechaInstalacion]
GO
ALTER TABLE [dbo].[cf_moduloExtension] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[cf_moduloHook] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[cf_moneda] ADD  DEFAULT ((0)) FOR [esPredeterminada]
GO
ALTER TABLE [dbo].[cf_organizacion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_proponente] ADD  DEFAULT ((1)) FOR [esPrincipal]
GO
ALTER TABLE [dbo].[cf_propuesta] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_propuesta] ADD  DEFAULT (getdate()) FOR [fechaActualizacion]
GO
ALTER TABLE [dbo].[cf_proyecto] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_reporteFinanciero] ADD  DEFAULT (getdate()) FOR [fechaPresentacion]
GO
ALTER TABLE [dbo].[cf_reporteIrregularidad] ADD  DEFAULT (getdate()) FOR [fechaReporte]
GO
ALTER TABLE [dbo].[cf_requisitoTipo] ADD  DEFAULT ((1)) FOR [esObligatorio]
GO
ALTER TABLE [dbo].[cf_subTipoTransaccion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_tasaCambio] ADD  DEFAULT ((1)) FOR [activa]
GO
ALTER TABLE [dbo].[cf_tasaCambio] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_tipoTransaccion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_transaccion] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_usuario] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_validacionPropuesta] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_versionPropuesta] ADD  DEFAULT (getdate()) FOR [fechaCreacion]
GO
ALTER TABLE [dbo].[cf_visitaFiscalizacion] ADD  DEFAULT (getdate()) FOR [fechaInforme]
GO
ALTER TABLE [dbo].[cf_votanteGrupo] ADD  DEFAULT (getdate()) FOR [fechaIncorporacion]
GO
ALTER TABLE [dbo].[cf_avalGubernamental]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_avalGubernamental]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_avalGubernamental]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoAval] ([tipoID])
GO
ALTER TABLE [dbo].[cf_avalGubernamental]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoAval] ([tipoID])
GO
ALTER TABLE [dbo].[cf_condicionAval]  WITH CHECK ADD FOREIGN KEY([avalID])
REFERENCES [dbo].[cf_avalGubernamental] ([avalID])
GO
ALTER TABLE [dbo].[cf_condicionAval]  WITH CHECK ADD FOREIGN KEY([avalID])
REFERENCES [dbo].[cf_avalGubernamental] ([avalID])
GO
ALTER TABLE [dbo].[cf_criterioProyecto]  WITH CHECK ADD FOREIGN KEY([criterioID])
REFERENCES [dbo].[cf_criterioTerritorial] ([criterioID])
GO
ALTER TABLE [dbo].[cf_criterioProyecto]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_desembolso]  WITH CHECK ADD FOREIGN KEY([aprobadoPor])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_desembolso]  WITH CHECK ADD FOREIGN KEY([estadoID])
REFERENCES [dbo].[cf_estadoDesembolso] ([estadoID])
GO
ALTER TABLE [dbo].[cf_desembolso]  WITH CHECK ADD FOREIGN KEY([planID])
REFERENCES [dbo].[cf_planDesembolso] ([planID])
GO
ALTER TABLE [dbo].[cf_desembolso]  WITH CHECK ADD FOREIGN KEY([planID])
REFERENCES [dbo].[cf_planDesembolso] ([planID])
GO
ALTER TABLE [dbo].[cf_documentoPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[cf_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[cf_documentoPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[cf_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[cf_evidenciaDesembolso]  WITH CHECK ADD FOREIGN KEY([desembolsoID])
REFERENCES [dbo].[cf_desembolso] ([desembolsoID])
GO
ALTER TABLE [dbo].[cf_evidenciaDesembolso]  WITH CHECK ADD FOREIGN KEY([subidoPor])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_evidenciaIrregularidad]  WITH CHECK ADD FOREIGN KEY([reporteID])
REFERENCES [dbo].[cf_reporteIrregularidad] ([reporteID])
GO
ALTER TABLE [dbo].[cf_evidenciaIrregularidad]  WITH CHECK ADD FOREIGN KEY([reporteID])
REFERENCES [dbo].[cf_reporteIrregularidad] ([reporteID])
GO
ALTER TABLE [dbo].[cf_fiscalizador]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_fiscalizador]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_grupoValidador]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoGrupoValidador] ([tipoID])
GO
ALTER TABLE [dbo].[cf_grupoValidador]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoGrupoValidador] ([tipoID])
GO
ALTER TABLE [dbo].[cf_incentivoProyecto]  WITH CHECK ADD FOREIGN KEY([incentivoID])
REFERENCES [dbo].[cf_incentivoGubernamental] ([incentivoID])
GO
ALTER TABLE [dbo].[cf_incentivoProyecto]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_incentivoProyecto]  WITH CHECK ADD FOREIGN KEY([votacionID])
REFERENCES [dbo].[cf_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[cf_incumplimiento]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_incumplimiento]  WITH CHECK ADD FOREIGN KEY([reporteID])
REFERENCES [dbo].[cf_reporteIrregularidad] ([reporteID])
GO
ALTER TABLE [dbo].[cf_incumplimiento]  WITH CHECK ADD FOREIGN KEY([reportadoPor])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([inversorID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([inversorID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_inversion]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_miembroOrganizacion]  WITH CHECK ADD FOREIGN KEY([organizacionID])
REFERENCES [dbo].[cf_organizacion] ([organizacionID])
GO
ALTER TABLE [dbo].[cf_miembroOrganizacion]  WITH CHECK ADD FOREIGN KEY([organizacionID])
REFERENCES [dbo].[cf_organizacion] ([organizacionID])
GO
ALTER TABLE [dbo].[cf_miembroOrganizacion]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_miembroOrganizacion]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_moduloHook]  WITH CHECK ADD FOREIGN KEY([hookID])
REFERENCES [dbo].[cf_hook] ([hookID])
GO
ALTER TABLE [dbo].[cf_moduloHook]  WITH CHECK ADD FOREIGN KEY([moduloID])
REFERENCES [dbo].[cf_moduloExtension] ([moduloID])
GO
ALTER TABLE [dbo].[cf_organizacion]  WITH CHECK ADD FOREIGN KEY([tipoOrganizacionID])
REFERENCES [dbo].[cf_tipoOrganizacion] ([tipoOrganizacionID])
GO
ALTER TABLE [dbo].[cf_organizacion]  WITH CHECK ADD FOREIGN KEY([tipoOrganizacionID])
REFERENCES [dbo].[cf_tipoOrganizacion] ([tipoOrganizacionID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([inversorID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([inversorID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_pagoInversor]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_planDesembolso]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_planDesembolso]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_planDesembolso]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_planDesembolso]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_procesoLegal]  WITH CHECK ADD FOREIGN KEY([incumplimientoID])
REFERENCES [dbo].[cf_incumplimiento] ([incumplimientoID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([organizacionID])
REFERENCES [dbo].[cf_organizacion] ([organizacionID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([organizacionID])
REFERENCES [dbo].[cf_organizacion] ([organizacionID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_propuesta]  WITH CHECK ADD FOREIGN KEY([estadoID])
REFERENCES [dbo].[cf_estadoPropuesta] ([estadoID])
GO
ALTER TABLE [dbo].[cf_propuesta]  WITH CHECK ADD FOREIGN KEY([estadoID])
REFERENCES [dbo].[cf_estadoPropuesta] ([estadoID])
GO
ALTER TABLE [dbo].[cf_propuesta]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoPropuesta] ([tipoID])
GO
ALTER TABLE [dbo].[cf_propuesta]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoPropuesta] ([tipoID])
GO
ALTER TABLE [dbo].[cf_proyecto]  WITH CHECK ADD FOREIGN KEY([estadoID])
REFERENCES [dbo].[cf_estadoProyecto] ([estadoID])
GO
ALTER TABLE [dbo].[cf_proyecto]  WITH CHECK ADD FOREIGN KEY([estadoID])
REFERENCES [dbo].[cf_estadoProyecto] ([estadoID])
GO
ALTER TABLE [dbo].[cf_proyecto]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_proyecto]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_reporteFinanciero]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_reporteFinanciero]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_reporteFinanciero]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoReporteFinanciero] ([tipoID])
GO
ALTER TABLE [dbo].[cf_reporteFinanciero]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoReporteFinanciero] ([tipoID])
GO
ALTER TABLE [dbo].[cf_reporteIrregularidad]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_reporteIrregularidad]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_reporteIrregularidad]  WITH CHECK ADD FOREIGN KEY([reportanteID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_reporteIrregularidad]  WITH CHECK ADD FOREIGN KEY([reportanteID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_requisitoTipo]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoPropuesta] ([tipoID])
GO
ALTER TABLE [dbo].[cf_requisitoTipo]  WITH CHECK ADD FOREIGN KEY([tipoID])
REFERENCES [dbo].[cf_tipoPropuesta] ([tipoID])
GO
ALTER TABLE [dbo].[cf_resultadoVotacion]  WITH CHECK ADD FOREIGN KEY([votacionID])
REFERENCES [dbo].[cf_votacion] ([votacionID])
GO
ALTER TABLE [dbo].[cf_sancion]  WITH CHECK ADD FOREIGN KEY([procesoID])
REFERENCES [dbo].[cf_procesoLegal] ([procesoID])
GO
ALTER TABLE [dbo].[cf_subTipoTransaccion]  WITH CHECK ADD FOREIGN KEY([tipoTransaccionID])
REFERENCES [dbo].[cf_tipoTransaccion] ([tipoTransaccionID])
GO
ALTER TABLE [dbo].[cf_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[cf_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[cf_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[cf_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[cf_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_tarifaGrupo]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_tasaCambio]  WITH CHECK ADD FOREIGN KEY([monedaID])
REFERENCES [dbo].[cf_moneda] ([monedaID])
GO
ALTER TABLE [dbo].[cf_transaccion]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_transaccion]  WITH CHECK ADD FOREIGN KEY([subTipoTransaccionID])
REFERENCES [dbo].[cf_subTipoTransaccion] ([subTipoTransaccionID])
GO
ALTER TABLE [dbo].[cf_transaccion]  WITH CHECK ADD FOREIGN KEY([tasaCambioID])
REFERENCES [dbo].[cf_tasaCambio] ([tasaCambioID])
GO
ALTER TABLE [dbo].[cf_transaccion]  WITH CHECK ADD FOREIGN KEY([tipoTransaccionID])
REFERENCES [dbo].[cf_tipoTransaccion] ([tipoTransaccionID])
GO
ALTER TABLE [dbo].[cf_transaccion]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[cf_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[cf_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([grupoID])
REFERENCES [dbo].[cf_grupoValidador] ([grupoID])
GO
ALTER TABLE [dbo].[cf_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[cf_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[cf_validacionPropuesta]  WITH CHECK ADD FOREIGN KEY([versionID])
REFERENCES [dbo].[cf_versionPropuesta] ([versionID])
GO
ALTER TABLE [dbo].[cf_versionPropuesta]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_versionPropuesta]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_visitaFiscalizacion]  WITH CHECK ADD FOREIGN KEY([fiscalizadorID])
REFERENCES [dbo].[cf_fiscalizador] ([fiscalizadorID])
GO
ALTER TABLE [dbo].[cf_visitaFiscalizacion]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_votacion]  WITH CHECK ADD FOREIGN KEY([propuestaID])
REFERENCES [dbo].[cf_propuesta] ([propuestaID])
GO
ALTER TABLE [dbo].[cf_votacion]  WITH CHECK ADD FOREIGN KEY([proyectoID])
REFERENCES [dbo].[cf_proyecto] ([proyectoID])
GO
ALTER TABLE [dbo].[cf_votacion]  WITH CHECK ADD FOREIGN KEY([reporteID])
REFERENCES [dbo].[cf_reporteIrregularidad] ([reporteID])
GO
ALTER TABLE [dbo].[cf_votacion]  WITH CHECK ADD FOREIGN KEY([tipoVotacionID])
REFERENCES [dbo].[cf_tipoVotacion] ([tipoVotacionID])
GO
ALTER TABLE [dbo].[cf_votanteGrupo]  WITH CHECK ADD FOREIGN KEY([grupoVotacionID])
REFERENCES [dbo].[cf_grupoVotacion] ([grupoVotacionID])
GO
ALTER TABLE [dbo].[cf_votanteGrupo]  WITH CHECK ADD FOREIGN KEY([organizacionID])
REFERENCES [dbo].[cf_organizacion] ([organizacionID])
GO
ALTER TABLE [dbo].[cf_votanteGrupo]  WITH CHECK ADD FOREIGN KEY([usuarioID])
REFERENCES [dbo].[cf_usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[cf_proponente]  WITH CHECK ADD CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[cf_votanteGrupo]  WITH CHECK ADD  CONSTRAINT [CHK_Votante] CHECK  (([usuarioID] IS NOT NULL OR [organizacionID] IS NOT NULL))
GO
ALTER TABLE [dbo].[cf_votanteGrupo] CHECK CONSTRAINT [CHK_Votante]
GO
USE [master]
GO
ALTER DATABASE [crowdfundingDB] SET  READ_WRITE 
GO
