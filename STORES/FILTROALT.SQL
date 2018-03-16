IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[FILTROALT]') AND type IN ('P'))
	DROP PROCEDURE FILTROALT
GO

CREATE PROCEDURE FILTROALT(
	@Par_Palabra					VARCHAR(20),			-- Palabra del filtro

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
			@Var_FiltroID			INT						-- Identificador del filtro

	-- Asignacion de constantes
	SELECT	@Entero_Cero			= 0,					-- Asignacion de entero vacio	
			@Cadena_Vacia			= '',					-- Asignacion de cadena vacia
			@Fecha_Vacia			= '1900-01-01',			-- Asignacion de fecha vacia
			@SalidaSI				= 'S'					-- Asignacion de salida si

	-- Asignacion de Vacios
	SET @Par_Palabra				= ISNULL(@Par_Palabra,@Cadena_Vacia)

	-- Validacion de parametros
	IF  @Par_Palabra				= @Cadena_Vacia
	BEGIN
		SET @Par_NumErr 			= '000001'
		SET @Par_ErrMen				= 'La palabra se encuentra vacía'
		SET @Var_Control			= 'Palabra'
		GOTO ManejoErrores
	END


	EXEC FOLIOSAPLICAACT	@Par_NombreTabla	= 'FILTRO',
							@Par_Folio			= @Var_FiltroID OUT

	INSERT INTO FILTRO	(	
									FiltroID,		Palabra
	)VALUES						(	
									@Var_FiltroID,	@Par_Palabra
								)

	SET @Par_NumErr 			= '000000'
	SET @Par_ErrMen				= 'Registro de filtro agrego correctamente'
	SET @Var_Contro				= 'FILTROALT'

	ManejoErrores:
	IF @Par_Salida	= @SalidaSI
	BEGIN
		SELECT	@Par_NumErr 			AS NumErro
				@Par_ErrMen				AS ErrMen
				@Var_Control			AS control
				@Var_FiltroID			AS consecutivo
	END
END

GO