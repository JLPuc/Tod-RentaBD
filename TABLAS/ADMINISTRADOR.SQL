IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('ADMINISTRADOR') AND type IN ('U'))
	DROP TABLE ADMINISTRADOR
GO

CREATE TABLE ADMINISTRADOR(
	AdministradorID      INT 				NOT NULL,
	Nombre               VARCHAR(30)    	NOT NULL,
	Apellido             VARCHAR(30)    	NOT NULL,
	CorreoElectronico    VARCHAR(50)    	NOT NULL,
	Usuario              VARCHAR(20)    	NOT NULL,
	Contrasena           VARBINARY(8000)	NOT NULL,
	NumeroCelular        VARCHAR(15)   		NOT NULL,
	NumeroFijo           VARCHAR(15)    	NOT NULL,
	Rol                  VARCHAR(20)   		NOT NULL,
	Status               VARCHAR(15)    	NOT NULL,
    CONSTRAINT PK_ADMINISTRADOR_1 PRIMARY KEY (AdministradorID)
)
GO
	CREATE INDEX INDEX_ADMINISTRADOR_1 ON ADMINISTRADOR(AdministradorID ASC)
GO


