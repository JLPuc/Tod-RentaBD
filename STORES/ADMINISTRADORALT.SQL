IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[ADMINISTRADORALT]') AND type IN ('P'))
	DROP PROCEDURE ADMINISTRADORALT
GO

CREATE PROCEDURE ADMINISTRADORALT(
	@Par_Nombre						VARCHAR(30),			-- Nombre del administrador
	@Par_Apellido					VARCHAR(30),			-- Apellidos del administrador
	@Par_CorreoElectronico			VARCHAR(50),			-- Correo del Administrador
	@Par_Usuario					VARCHAR(20),			-- Usuario del administrador
	@Par_Contrasena					VARCHAR(20),			-- Contraseña del Administrador
	@Par_Status						VARCHAR(15),			-- Estatus de la cuenta del Administrador
	@Par_NumeroCelular				VARCHAR(30),			-- Numero del celular del administrador
	@Par_NumeroFijo					VARCHAR(30),			-- Numero de telefono del administrador
	@Par_Rol						VARCHAR(20),			-- Rol sobre el sistema

	@Par_Salida						CHAR(1),				-- Parametro de salida de datos
	@Par_NumErr 					CHAR(6) OUT,			-- Parametro de salida de numero de error
	@Par_ErrMen 					VARCHAR(400) OUT		-- Parametro de salida mensaje de error
)
AS
BEGIN
	
	-- Declaracion de constantes
	DECLARE @Entero_Cero			INT,					-- Entero vacio
			@Cadena_Vacia			CHAR(1),				-- Cadena vacia
			@Fecha_Vacia			DATE,					-- Fecha vacia
			@SalidaSI				CHAR(1)					-- Salida si

	-- Declaraciones de variables
	DECLARE @Var_Control			VARCHAR(50),			-- Variable de control
			@Var_AdministradorID	INT						-- Identificador del Administrador

	-- Asignacion de constantes
	SELECT	@Entero_Cero			= 0,					-- Asignacion de entero vacio	
			@Cadena_Vacia			= '',					-- Asignacion de cadena vacia
			@Fecha_Vacia			= '1900-01-01',			-- Asignacion de fecha vacia
			@SalidaSI				= 'S'					-- Asignacion de salida si

	-- Asignacion de Vacios
	SET @Par_Nombre					= ISNULL(@Par_Nombre,@Cadena_Vacia)
	SET @Par_Apellido				= ISNULL(@Par_Apellido,@Cadena_Vacia)
	SET @Par_CorreoElectronico		= ISNULL(@Par_CorreoElectronico,@Cadena_Vacia)
	SET @Par_Usuario				= ISNULL(@Par_Usuario,@Cadena_Vacia)
	SET @Par_Contrasena				= ISNULL(@Par_Contrasena,@Cadena_Vacia)
	SET @Par_Status					= ISNULL(@Par_Status,@Cadena_Vacia)
	SET @Par_NumeroCelular			= ISNULL(@Par_NumeroCelular,@Cadena_Vacia)
	SET @Par_NumeroFijo				= ISNULL(@Par_NumeroFijo,@Cadena_Vacia)
	SET @Par_Rol					= ISNULL(@Par_Rol,@Cadena_Vacia)

	-- Validacion de parametros
	IF  @Par_Nombre					= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000001'
		SET @Par_ErrMen				= 'El nombre se encuentra vacio'
		SET @Var_Control			= 'Nombre'
		GOTO ManejoErrores
	END

	IF  @Par_Apellido				= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000002'
		SET @Par_ErrMen				= 'Los apellidos se encuentran vacios'
		SET @Var_Contro				= 'Apellido'
		GOTO ManejoErrores
	END

	EXEC FOLISAPLICAACT	@Par_NombreTabla	= 'ADMINISTRADOR',
						@Par_Folio			= @Var_AdministradorID OUT

	INSERT INTO ADMINISTRADOR	(	
									AdministradorID,		Nombre,						Apellido,			CorreoElectronico,		Usuario,
									Contrasena,				NumeroCelular,				NumeroFijo,			Rol
	)VALUES						(	
									@Var_AdministradorID,	@Par_Nombre,				@Par_Apellido,		@CorreoElectronico,		@Par_Usuario,
									ENCRYPTBYPASSPHRASE('password',@Par_Contrasena),	@Par_NumeroCelular,	@Par_NumeroFijo,	@Par_Rol
								)

	SET @Par_NumErr 			= '000000'
	SET @Par_ErrMen				= 'Registro de Administrador agrego correctamente'
	SET @Var_Contro				= 'ADMINISTRADORALT'

	ManejoErrores:
	IF @Par_Salida	= @SalidaSI
	BEGIN
		SELECT	@Par_NumErr 			AS NumErro
				@Par_ErrMen				AS ErrMen
				@Var_Control			AS control
				@Var_AdministradorID	AS consecutivo
	END
END

GO


