USE ToditoRentas;
GO

CREATE PROCEDURE insertarUsuario(
	@Nombre varchar(30),
	@Apellido varchar(30),
	@CorreoElectronico varchar(50),
	@Usuario varchar(20),
	@Contrasena varchar(20),
	@Status varchar(15),
	@NumeroCelular varchar(30),
	@NumeroFijo varchar(30),
	@FechaNacimiento date,
	@Descripcion varchar(max)
)
as 
Insert into Usuario (Nombre, Apellido, CorreoElectronico, Usuario, Contrasena, Status, 
NumeroCelular, NumeroFijo, FechaNacimiento, Descripcion) 
values(@Nombre, @Apellido, @CorreoElectronico, @Usuario, @Contrasena, @Status, @NumeroCelular,
@NumeroFijo, @FechaNacimiento, @Descripcion)
GO

CREATE PROCEDURE insertarUsuarioFaseUno(
	@Nombre varchar(30),
	@Apellido varchar(30),
	@CorreoElectronico varchar(50),
	@Usuario varchar(20),
	@Contrasena varchar(20),
	@Status varchar(15)
)
as 
Insert into Usuario (Nombre, Apellido, CorreoElectronico, Usuario, Contrasena, Status) 
values(@Nombre, @Apellido, @CorreoElectronico, @Usuario, @Contrasena, @Status)
GO

CREATE PROCEDURE actualizarUsuario(
	@IdUsuario integer,
	@Nombre varchar(30),
	@Apellido varchar(30),
	@CorreoElectronico varchar(50),
	@Usuario varchar(20),
	@Contrasena varchar(20),
	@Status varchar(15),
	@NumeroCelular varchar(30),
	@NumeroFijo varchar(30),
	@FechaNacimiento date,
	@Descripcion varchar(max)
)
as 
Update Usuario set Nombre = @Nombre, Apellido = @Apellido, CorreoElectronico = @CorreoElectronico, 
Usuario = @Usuario, Contrasena = @Contrasena, Status = @Status, NumeroCelular = @NumeroCelular, 
NumeroFijo = @NumeroFijo, FechaNacimiento = @FechaNacimiento, Descripcion = @Descripcion 
where IdUsuario = @IdUsuario
GO

CREATE PROCEDURE eliminarUsuario(
	@IdUsuario integer,
	@Status varchar(15)
)
as 
Update Usuario set Status = @Status
where IdUsuario = @IdUsuario
GO

CREATE PROCEDURE agregarAdministrador(
	@Nombre varchar(30),
	@Apellido varchar(30),
	@CorreoElectronico varchar(50),
	@Usuario varchar(20),
	@Contrasena varchar(20),
	@Status varchar(15),
	@NumeroCelular varchar(30),
	@NumeroFijo varchar(30),
	@Rol varchar(20)
)
as
Insert into Administrador(Nombre, Apellido, CorreoElectronico, Usuario, Contrasena, 
NumeroCelular, NumeroFijo, Rol) 
values(@Nombre, @Apellido, @CorreoElectronico, @Usuario, @Contrasena, @NumeroCelular,
@NumeroFijo, @Rol)
GO

CREATE PROCEDURE actualizarAdministrador(
	@IdAdministrador integer,
	@Nombre varchar(30),
	@Apellido varchar(30),
	@CorreoElectronico varchar(50),
	@Usuario varchar(20),
	@Contrasena varchar(20),
	@Status varchar(15),
	@NumeroCelular varchar(30),
	@NumeroFijo varchar(30),
	@Rol varchar(20)
)
as
Update Administrador set Nombre = @Nombre, Apellido = @Apellido, CorreoElectronico = @CorreoElectronico, 
Usuario = @Usuario, Contrasena = @Contrasena, NumeroCelular = @NumeroCelular, 
NumeroFijo = @NumeroFijo, Rol = @Rol 
where IdAdministrador = @IdAdministrador
GO

CREATE PROCEDURE eliminarAdministrador(
	@IdAdministrador integer,
	@Status varchar(15)
)
as
Update Administrador set 