/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      None
 * Project :      Modelo ER.DM1
 * Author :       André Salazar Figueroa
 *
 * Date Created : Wednesday, January 10, 2018 22:46:10
 * Target DBMS : Microsoft SQL Server 2008
 */

USE master
go
CREATE DATABASE ToditoRentas
go
USE ToditoRentas
go
/* 
 * TABLE: Administrador 
 */

CREATE TABLE Administrador(
    IdAdministrador      int            NOT NULL,
    Nombre               varchar(30)    NOT NULL,
    Apellido             varchar(30)    NOT NULL,
    CorreoElectronico    varchar(50)    NOT NULL,
    Usuario              varchar(20)    NOT NULL,
    Contrasena           varchar(20)    NOT NULL,
    NumeroCelular        varchar(15)    NOT NULL,
    NumeroFijo           varchar(15)    NOT NULL,
    Rol                  varchar(20)    NOT NULL,
    Status               varchar(15)    NOT NULL,
    CONSTRAINT PK1_1 PRIMARY KEY NONCLUSTERED (IdAdministrador)
)
go



IF OBJECT_ID('Administrador') IS NOT NULL
    PRINT '<<< CREATED TABLE Administrador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Administrador >>>'
go

/* 
 * TABLE: AutorizarPagos 
 */

CREATE TABLE AutorizarPagos(
    IdAutorizar      int             NOT NULL,
    De               varchar(max)    NULL,
    Para             varchar(max)    NULL,
    TotalPago        float           NULL,
    StatusPago       varchar(15)     NULL,
    FechaGenerado    date            NULL,
    CONSTRAINT PK20 PRIMARY KEY NONCLUSTERED (IdAutorizar)
)
go



IF OBJECT_ID('AutorizarPagos') IS NOT NULL
    PRINT '<<< CREATED TABLE AutorizarPagos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AutorizarPagos >>>'
go

/* 
 * TABLE: CalificacionProductos 
 */

CREATE TABLE CalificacionProductos(
    IdCalificacionProducto    char(10)    NOT NULL,
    CalificacionProducto      int         NULL,
    IdUsuario                 int         NOT NULL,
    IdProducto                int         NOT NULL,
    CONSTRAINT PK8_1 PRIMARY KEY NONCLUSTERED (IdCalificacionProducto)
)
go



IF OBJECT_ID('CalificacionProductos') IS NOT NULL
    PRINT '<<< CREATED TABLE CalificacionProductos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CalificacionProductos >>>'
go

/* 
 * TABLE: CalificacionUsuarios 
 */

CREATE TABLE CalificacionUsuarios(
    IdCalificacionUsuario    char(10)    NOT NULL,
    CalificacionUsuario      int         NULL,
    IdCalificador            int         NOT NULL,
    IdUsuario                int         NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (IdCalificacionUsuario)
)
go



IF OBJECT_ID('CalificacionUsuarios') IS NOT NULL
    PRINT '<<< CREATED TABLE CalificacionUsuarios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CalificacionUsuarios >>>'
go

/* 
 * TABLE: Cancelacion 
 */

CREATE TABLE Cancelacion(
    IdCancelacion        int             NOT NULL,
    Motivo               varchar(max)    NULL,
    StatusCancelacion    varchar(15)     NULL,
    IdUsuario            int             NOT NULL,
    IdContrato           int             NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (IdCancelacion)
)
go



IF OBJECT_ID('Cancelacion') IS NOT NULL
    PRINT '<<< CREATED TABLE Cancelacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cancelacion >>>'
go

/* 
 * TABLE: Categoria 
 */

CREATE TABLE Categoria(
    IdCategoria    int            NOT NULL,
    Nombre         varchar(20)    NULL,
    Descripcion    varchar(50)    NULL,
    IdTipo         int            NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (IdCategoria)
)
go



IF OBJECT_ID('Categoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Categoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Categoria >>>'
go

/* 
 * TABLE: ComentarioProductos 
 */

CREATE TABLE ComentarioProductos(
    IdComentarioProducto    int             NOT NULL,
    ComentarioProducto      varchar(max)    NULL,
    IdProducto              int             NOT NULL,
    IdUsuario               int             NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY NONCLUSTERED (IdComentarioProducto)
)
go



IF OBJECT_ID('ComentarioProductos') IS NOT NULL
    PRINT '<<< CREATED TABLE ComentarioProductos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ComentarioProductos >>>'
go

/* 
 * TABLE: ComentarioUsuarios 
 */

CREATE TABLE ComentarioUsuarios(
    IdComentarioUsuarios    int             NOT NULL,
    ComentarioUsuario       varchar(max)    NULL,
    IdComentador            int             NOT NULL,
    IdUsuario               int             NOT NULL,
    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED (IdComentarioUsuarios)
)
go



IF OBJECT_ID('ComentarioUsuarios') IS NOT NULL
    PRINT '<<< CREATED TABLE ComentarioUsuarios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ComentarioUsuarios >>>'
go

/* 
 * TABLE: Contrato 
 */

CREATE TABLE Contrato(
    IdContrato      int             NOT NULL,
    Arrendatario    varchar(max)    NULL,
    Arrendador      varchar(max)    NULL,
    Dias            int             NULL,
    FechaEmision    date            NULL,
    Status          bit             NULL,
    IdRenta         int             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (IdContrato)
)
go



IF OBJECT_ID('Contrato') IS NOT NULL
    PRINT '<<< CREATED TABLE Contrato >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Contrato >>>'
go

/* 
 * TABLE: CuentaBancaria 
 */

CREATE TABLE CuentaBancaria(
    Token        varchar(100)    NOT NULL,
    IdUsuario    int             NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY NONCLUSTERED (Token)
)
go



IF OBJECT_ID('CuentaBancaria') IS NOT NULL
    PRINT '<<< CREATED TABLE CuentaBancaria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CuentaBancaria >>>'
go

/* 
 * TABLE: Direccion 
 */

CREATE TABLE Direccion(
    IdDireccion     int               NOT NULL,
    Descripcion     varchar(max)      NULL,
    Latitud         decimal(10, 7)    NULL,
    Longitud        decimal(10, 7)    NULL,
    Calle           varchar(10)       NULL,
    Numero          varchar(10)       NULL,
    Cruzamientos    varchar(15)       NULL,
    Colonia         varchar(30)       NULL,
    Status          char(10)          NULL,
    IdUsuario       int               NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (IdDireccion)
)
go



IF OBJECT_ID('Direccion') IS NOT NULL
    PRINT '<<< CREATED TABLE Direccion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Direccion >>>'
go

/* 
 * TABLE: Filtro 
 */

CREATE TABLE Filtro(
    IdFiltro    int            NOT NULL,
    Palabra     varchar(20)    NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (IdFiltro)
)
go



IF OBJECT_ID('Filtro') IS NOT NULL
    PRINT '<<< CREATED TABLE Filtro >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Filtro >>>'
go

/* 
 * TABLE: FoliosAplica 
 */

CREATE TABLE FoliosAplica(
    Tabla    varchar(100)    NOT NULL,
    Folio    int             NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED (Tabla)
)
go



IF OBJECT_ID('FoliosAplica') IS NOT NULL
    PRINT '<<< CREATED TABLE FoliosAplica >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FoliosAplica >>>'
go

/* 
 * TABLE: FotoProducto 
 */

CREATE TABLE FotoProducto(
    IdFotoProducto    int      NOT NULL,
    FotoProducto      image    NULL,
    IdProducto        int      NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (IdFotoProducto)
)
go



IF OBJECT_ID('FotoProducto') IS NOT NULL
    PRINT '<<< CREATED TABLE FotoProducto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FotoProducto >>>'
go

/* 
 * TABLE: FotoUsuarios 
 */

CREATE TABLE FotoUsuarios(
    IdFotoUsuario    int      NOT NULL,
    FotoUsuario      image    NULL,
    IdUsuario        int      NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (IdFotoUsuario)
)
go



IF OBJECT_ID('FotoUsuarios') IS NOT NULL
    PRINT '<<< CREATED TABLE FotoUsuarios >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FotoUsuarios >>>'
go

/* 
 * TABLE: Mensaje 
 */

CREATE TABLE Mensaje(
    IdMensaje      int             IDENTITY(1,1),
    Asunto         varchar(50)     NOT NULL,
    Descripcion    varchar(max)    NOT NULL,
    Status         char(10)        NOT NULL,
    IdUsuario      int             NOT NULL,
    CONSTRAINT PK28 PRIMARY KEY NONCLUSTERED (IdMensaje)
)
go



IF OBJECT_ID('Mensaje') IS NOT NULL
    PRINT '<<< CREATED TABLE Mensaje >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Mensaje >>>'
go

/* 
 * TABLE: Noticia 
 */

CREATE TABLE Noticia(
    IdNoticia          int             IDENTITY(1,1),
    Asunto             varchar(50)     NOT NULL,
    Descripcion        varchar(max)    NOT NULL,
    IdAdministrador    int             NOT NULL,
    CONSTRAINT PK31 PRIMARY KEY NONCLUSTERED (IdNoticia)
)
go



IF OBJECT_ID('Noticia') IS NOT NULL
    PRINT '<<< CREATED TABLE Noticia >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Noticia >>>'
go

/* 
 * TABLE: ParametrosSis 
 */

CREATE TABLE ParametrosSis(
    IdParametro    int     NOT NULL,
    FechaActual    date    NULL,
    CONSTRAINT PK21 PRIMARY KEY NONCLUSTERED (IdParametro)
)
go



IF OBJECT_ID('ParametrosSis') IS NOT NULL
    PRINT '<<< CREATED TABLE ParametrosSis >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ParametrosSis >>>'
go

/* 
 * TABLE: Producto 
 */

CREATE TABLE Producto(
    IdProducto        int            NOT NULL,
    Nombre            varchar(50)    NULL,
    Marca             varchar(20)    NULL,
    Modelo            varchar(25)    NULL,
    Status            bit            NULL,
    Anio              int            NULL,
    PrecioDia         float          NULL,
    PrecioTresDias    float          NULL,
    PrecioSemana      float          NULL,
    IdDireccion       int            NOT NULL,
    IdCategoria       int            NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (IdProducto)
)
go



IF OBJECT_ID('Producto') IS NOT NULL
    PRINT '<<< CREATED TABLE Producto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Producto >>>'
go

/* 
 * TABLE: Publicacion 
 */

CREATE TABLE Publicacion(
    IdPublicacion    int             NOT NULL,
    Titulo           varchar(50)     NOT NULL,
    Descripcion      varchar(max)    NULL,
    Fecha            date            NOT NULL,
    Cantidad         int             NOT NULL,
    Status           varchar(15)     NOT NULL,
    IdProducto       int             NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (IdPublicacion)
)
go



IF OBJECT_ID('Publicacion') IS NOT NULL
    PRINT '<<< CREATED TABLE Publicacion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Publicacion >>>'
go

/* 
 * TABLE: PublicacionRenta 
 */

CREATE TABLE PublicacionRenta(
    IdPublicacionRenta    int     NOT NULL,
    FechaRenta            date    NULL,
    IdPublicacion         int     NOT NULL,
    IdRenta               int     NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (IdPublicacionRenta)
)
go



IF OBJECT_ID('PublicacionRenta') IS NOT NULL
    PRINT '<<< CREATED TABLE PublicacionRenta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PublicacionRenta >>>'
go

/* 
 * TABLE: Renta 
 */

CREATE TABLE Renta(
    IdRenta                int             NOT NULL,
    NombreProducto         varchar(50)     NULL,
    CantidadProducto       int             NULL,
    PrecioProducto         float           NULL,
    DescripcionProducto    varchar(max)    NOT NULL,
    FechaInicial           date            NULL,
    FechaFinal             date            NULL,
    TotalRenta             float           NULL,
    IdUsuario              int             NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (IdRenta)
)
go



IF OBJECT_ID('Renta') IS NOT NULL
    PRINT '<<< CREATED TABLE Renta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Renta >>>'
go

/* 
 * TABLE: RespuestaMensaje 
 */

CREATE TABLE RespuestaMensaje(
    IdRespuesta        int             IDENTITY(1,1),
    Descripcion        varchar(max)    NOT NULL,
    IdMensaje          int             NOT NULL,
    IdAdministrador    int             NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY NONCLUSTERED (IdRespuesta)
)
go



IF OBJECT_ID('RespuestaMensaje') IS NOT NULL
    PRINT '<<< CREATED TABLE RespuestaMensaje >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RespuestaMensaje >>>'
go

/* 
 * TABLE: Sancion 
 */

CREATE TABLE Sancion(
    IdSancion          int             IDENTITY(1,1),
    Motivo             varchar(max)    NOT NULL,
    Periodo            int             NOT NULL,
    FechaSancion       date            NOT NULL,
    IdUsuario          int             NOT NULL,
    IdAdministrador    int             NOT NULL,
    CONSTRAINT PK29 PRIMARY KEY NONCLUSTERED (IdSancion)
)
go



IF OBJECT_ID('Sancion') IS NOT NULL
    PRINT '<<< CREATED TABLE Sancion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sancion >>>'
go

/* 
 * TABLE: Sugerencia 
 */

CREATE TABLE Sugerencia(
    IdSugerencia    int             IDENTITY(1,1),
    Descripcion     varchar(max)    NOT NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED (IdSugerencia)
)
go



IF OBJECT_ID('Sugerencia') IS NOT NULL
    PRINT '<<< CREATED TABLE Sugerencia >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Sugerencia >>>'
go

/* 
 * TABLE: SugerenciaUsuario 
 */

CREATE TABLE SugerenciaUsuario(
    IdSugerenciaUsuario    int    IDENTITY(1,1),
    Status                 bit    NOT NULL,
    IdSugerencia           int    NOT NULL,
    IdUsuario              int    NOT NULL,
    CONSTRAINT PK27 PRIMARY KEY NONCLUSTERED (IdSugerenciaUsuario)
)
go



IF OBJECT_ID('SugerenciaUsuario') IS NOT NULL
    PRINT '<<< CREATED TABLE SugerenciaUsuario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SugerenciaUsuario >>>'
go

/* 
 * TABLE: Tipo 
 */

CREATE TABLE Tipo(
    IdTipo         int            NOT NULL,
    Nombre         varchar(20)    NOT NULL,
    Descripcion    varchar(50)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (IdTipo)
)
go



IF OBJECT_ID('Tipo') IS NOT NULL
    PRINT '<<< CREATED TABLE Tipo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Tipo >>>'
go

/* 
 * TABLE: Usuario 
 */

CREATE TABLE Usuario(
    IdUsuario            int             NOT NULL,
    Nombre               varchar(30)     NULL,
    Apellido             varchar(30)     NULL,
    CorreoElectronico    varchar(50)     NULL,
    Usuario              varchar(20)     NULL,
    Contrasena           varchar(20)     NULL,
    NumeroCelular        varchar(15)     NULL,
    NumeroFijo           varchar(15)     NULL,
    FechaNacimiento      date            NULL,
    Status               varchar(15)     NOT NULL,
    DocumentoOficial     varchar(max)    NULL,
    Descripcion          varchar(max)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (IdUsuario)
)
go



IF OBJECT_ID('Usuario') IS NOT NULL
    PRINT '<<< CREATED TABLE Usuario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Usuario >>>'
go

/* 
 * TABLE: CalificacionProductos 
 */

ALTER TABLE CalificacionProductos ADD CONSTRAINT RefUsuario11 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE CalificacionProductos ADD CONSTRAINT RefProducto12 
    FOREIGN KEY (IdProducto)
    REFERENCES Producto(IdProducto)
go


/* 
 * TABLE: CalificacionUsuarios 
 */

ALTER TABLE CalificacionUsuarios ADD CONSTRAINT RefUsuario8 
    FOREIGN KEY (IdCalificador)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE CalificacionUsuarios ADD CONSTRAINT RefUsuario10 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: Cancelacion 
 */

ALTER TABLE Cancelacion ADD CONSTRAINT RefUsuario21 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE Cancelacion ADD CONSTRAINT RefContrato23 
    FOREIGN KEY (IdContrato)
    REFERENCES Contrato(IdContrato)
go


/* 
 * TABLE: Categoria 
 */

ALTER TABLE Categoria ADD CONSTRAINT RefTipo41 
    FOREIGN KEY (IdTipo)
    REFERENCES Tipo(IdTipo)
go


/* 
 * TABLE: ComentarioProductos 
 */

ALTER TABLE ComentarioProductos ADD CONSTRAINT RefProducto24 
    FOREIGN KEY (IdProducto)
    REFERENCES Producto(IdProducto)
go

ALTER TABLE ComentarioProductos ADD CONSTRAINT RefUsuario25 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: ComentarioUsuarios 
 */

ALTER TABLE ComentarioUsuarios ADD CONSTRAINT RefUsuario26 
    FOREIGN KEY (IdComentador)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE ComentarioUsuarios ADD CONSTRAINT RefUsuario27 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: Contrato 
 */

ALTER TABLE Contrato ADD CONSTRAINT RefRenta20 
    FOREIGN KEY (IdRenta)
    REFERENCES Renta(IdRenta)
go


/* 
 * TABLE: CuentaBancaria 
 */

ALTER TABLE CuentaBancaria ADD CONSTRAINT RefUsuario22 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: Direccion 
 */

ALTER TABLE Direccion ADD CONSTRAINT RefUsuario38 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: FotoProducto 
 */

ALTER TABLE FotoProducto ADD CONSTRAINT RefProducto16 
    FOREIGN KEY (IdProducto)
    REFERENCES Producto(IdProducto)
go


/* 
 * TABLE: FotoUsuarios 
 */

ALTER TABLE FotoUsuarios ADD CONSTRAINT RefUsuario14 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: Mensaje 
 */

ALTER TABLE Mensaje ADD CONSTRAINT RefUsuario32 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: Noticia 
 */

ALTER TABLE Noticia ADD CONSTRAINT RefAdministrador42 
    FOREIGN KEY (IdAdministrador)
    REFERENCES Administrador(IdAdministrador)
go


/* 
 * TABLE: Producto 
 */

ALTER TABLE Producto ADD CONSTRAINT RefDireccion2 
    FOREIGN KEY (IdDireccion)
    REFERENCES Direccion(IdDireccion)
go

ALTER TABLE Producto ADD CONSTRAINT RefCategoria13 
    FOREIGN KEY (IdCategoria)
    REFERENCES Categoria(IdCategoria)
go


/* 
 * TABLE: Publicacion 
 */

ALTER TABLE Publicacion ADD CONSTRAINT RefProducto15 
    FOREIGN KEY (IdProducto)
    REFERENCES Producto(IdProducto)
go


/* 
 * TABLE: PublicacionRenta 
 */

ALTER TABLE PublicacionRenta ADD CONSTRAINT RefPublicacion17 
    FOREIGN KEY (IdPublicacion)
    REFERENCES Publicacion(IdPublicacion)
go

ALTER TABLE PublicacionRenta ADD CONSTRAINT RefRenta18 
    FOREIGN KEY (IdRenta)
    REFERENCES Renta(IdRenta)
go


/* 
 * TABLE: Renta 
 */

ALTER TABLE Renta ADD CONSTRAINT RefUsuario19 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


/* 
 * TABLE: RespuestaMensaje 
 */

ALTER TABLE RespuestaMensaje ADD CONSTRAINT RefMensaje39 
    FOREIGN KEY (IdMensaje)
    REFERENCES Mensaje(IdMensaje)
go

ALTER TABLE RespuestaMensaje ADD CONSTRAINT RefAdministrador40 
    FOREIGN KEY (IdAdministrador)
    REFERENCES Administrador(IdAdministrador)
go


/* 
 * TABLE: Sancion 
 */

ALTER TABLE Sancion ADD CONSTRAINT RefUsuario33 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go

ALTER TABLE Sancion ADD CONSTRAINT RefAdministrador37 
    FOREIGN KEY (IdAdministrador)
    REFERENCES Administrador(IdAdministrador)
go


/* 
 * TABLE: SugerenciaUsuario 
 */

ALTER TABLE SugerenciaUsuario ADD CONSTRAINT RefSugerencia29 
    FOREIGN KEY (IdSugerencia)
    REFERENCES Sugerencia(IdSugerencia)
go

ALTER TABLE SugerenciaUsuario ADD CONSTRAINT RefUsuario30 
    FOREIGN KEY (IdUsuario)
    REFERENCES Usuario(IdUsuario)
go


