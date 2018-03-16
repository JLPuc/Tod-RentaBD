IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[USUARIOALT]') AND type IN ('P'))
	DROP PROCEDURE USUARIOALT
GO

CREATE PROCEDURE USUARIOALT(
	@Par_Nombre						VARCHAR(30),			-- Nombre del USUARIO
	@Par_Apellido					VARCHAR(30),			-- Apellidos del USUARIO
	@Par_CorreoElectronico			VARCHAR(50),			-- Correo del USUARIO
	@Par_Usuario					VARCHAR(20),			-- Usuario del USUARIO
	@Par_Contrasena					VARCHAR(20),			-- Contraseña del USUARIO
	@Par_Status						VARCHAR(15),			-- Estatus de la cuenta del USUARIO

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
			@Var_UsuarioID			INT						-- Identificador del USUARIO

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

	-- Validacion de parametros
	IF  @Par_Nombre					= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000001'
		SET @Par_ErrMen				= 'El nombre se encuentra vacío'
		SET @Var_Control			= 'Nombre'
		GOTO ManejoErrores
	END

	IF  @Par_Apellido				= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000002'
		SET @Par_ErrMen				= 'Los apellidos se encuentran vacíos'
		SET @Var_Contro				= 'Apellido'
		GOTO ManejoErrores
	END

	IF  @Par_CorreoElectronico		= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000003'
		SET @Par_ErrMen				= 'El correo electrónico se encuentra vacío'
		SET @Var_Control			= 'Correo Electrónico'
		GOTO ManejoErrores
	END

	IF  @Par_Usuario				= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000004'
		SET @Par_ErrMen				= 'El usuario se encuentra vacío'
		SET @Var_Contro				= 'Usuario'
		GOTO ManejoErrores
	END

	IF  @Par_Contrasena				= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000005'
		SET @Par_ErrMen				= 'La contraseña se encuentra vacía'
		SET @Var_Control			= 'Contraseña'
		GOTO ManejoErrores
	END

	IF  @Par_Status					= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000006'
		SET @Par_ErrMen				= 'El estatus se encuentra vacío'
		SET @Var_Contro				= 'Estatus'
		GOTO ManejoErrores
	END


	EXEC FOLISAPLICAACT	@Par_NombreTabla	= 'USUARIO',
						@Par_Folio			= @Var_UsuarioID OUT

	INSERT INTO USUARIO	(	
									UsuarioID,				Nombre,						Apellido,			CorreoElectronico,		Usuario,
									Contrasena,				Status
	)VALUES						(	
									@Var_UsuarioID,			@Par_Nombre,				@Par_Apellido,		@CorreoElectronico,		@Par_Usuario,
									ENCRYPTBYPASSPHRASE('password',@Par_Contrasena),	@Par_Status
								)

	SET @Par_NumErr 			= '000000'
	SET @Par_ErrMen				= 'Registro de usuario agrego correctamente'
	SET @Var_Contro				= 'USUARIOALT'

	ManejoErrores:
	IF @Par_Salida	= @SalidaSI
	BEGIN
		SELECT	@Par_NumErr 			AS NumErro
				@Par_ErrMen				AS ErrMen
				@Var_Control			AS control
				@Var_UsuarioID	AS consecutivo
	END
END

GO