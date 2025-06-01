/****** Object:  Table [dbo].[pv_comentariosPropuesta]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_estadoComentarios]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_estadoSolicitud]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_faseComentario]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_faseSolicitudes]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_propuestaCategoria]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_propuestas]    Script Date: 27/5/2025 18:27:35 ******/
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
 CONSTRAINT [PK_pv_propuestas] PRIMARY KEY CLUSTERED 
(
	[propuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pv_solicitudCambio]    Script Date: 27/5/2025 18:27:35 ******/
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
/****** Object:  Table [dbo].[pv_validacionesCategoria]    Script Date: 27/5/2025 18:27:35 ******/
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
ALTER TABLE [dbo].[pv_comentariosPropuesta]  WITH CHECK ADD  CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas] FOREIGN KEY([propuestaid])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_comentariosPropuesta] CHECK CONSTRAINT [FK_pv_comentariosPropuesta_pv_propuestas]
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
ALTER TABLE [dbo].[pv_propuestas]  WITH CHECK ADD  CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria] FOREIGN KEY([categoriaid])
REFERENCES [dbo].[pv_propuestaCategoria] ([categoriaid])
GO
ALTER TABLE [dbo].[pv_propuestas] CHECK CONSTRAINT [FK_pv_propuestas_pv_propuestaCategoria]
GO
ALTER TABLE [dbo].[pv_solicitudCambio]  WITH CHECK ADD  CONSTRAINT [FK_pv_solicitudCambio_pv_propuestas] FOREIGN KEY([propuestaid])
REFERENCES [dbo].[pv_propuestas] ([propuestaid])
GO
ALTER TABLE [dbo].[pv_solicitudCambio] CHECK CONSTRAINT [FK_pv_solicitudCambio_pv_propuestas]
GO
ALTER TABLE [dbo].[pv_validacionesCategoria]  WITH CHECK ADD  CONSTRAINT [FK_pv_validacionesCategoria_pv_propuestaCategoria] FOREIGN KEY([categoriaid])
REFERENCES [dbo].[pv_propuestaCategoria] ([categoriaid])
GO
ALTER TABLE [dbo].[pv_validacionesCategoria] CHECK CONSTRAINT [FK_pv_validacionesCategoria_pv_propuestaCategoria]
GO
USE [master]
GO
ALTER DATABASE [Temp] SET  READ_WRITE 
GO
