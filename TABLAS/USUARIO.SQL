IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('USUARIO') AND type IN ('U'))
	DROP TABLE USUARIO
GO

CREATE TABLE USUARIO(
	UsuarioID            INT				NOT NULL,
	Nombre               VARCHAR(30)		NULL,
	Apellido             VARCHAR(30)		NULL,
	CorreoElectronico    VARCHAR(50)		NULL,
	Usuario              VARCHAR(20)		NULL,
	Contrasena           VARBINARY(8000)	NULL,
	NumeroCelular        VARCHAR(15)		NULL,
	NumeroFijo           VARCHAR(15)		NULL,
	FechaNacimiento      DATE				NULL,
	Status               VARCHAR(15)		NOT NULL,
	DocumentoOficial     VARCHAR(MAX)		NULL,
	Descripcion          VARCHAR(MAX)		NULL,
	CONSTRAINT PK_USUARIO_1 PRIMARY KEY NONCLUSTERED (UsuarioID)
)
GO
	CREATE INDEX INDEX_USUARIO_1 ON USUARIO(UsuarioID ASC)
GO