IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[USUARIOLIS]') AND type IN ('P'))
	DROP PROCEDURE USUARIOLIS
GO

CREATE PROCEDURE USUARIOLIS(
	 @Par_Nombre						VARCHAR(30),		-- Nombre del USUARIO

	 @Par_NumLis						TINYINT				-- Numero de lista
)
AS
BEGIN

-- Declaracion de constantes
	DECLARE @Entero_Cero			INT,					-- Entero vacio
			@Cadena_Vacia			CHAR(1),				-- Cadena vacia
			@Fecha_Vacia			DATE,					-- Fecha vacia
			@Lis_Principal			TINYINT					-- Lista principal

	-- Asignacion de constantes
	SELECT	@Entero_Cero			= 0,					-- Asignacion de entero vacio	
			@Cadena_Vacia			= '',					-- Asignacion de cadena vacia
			@Fecha_Vacia			= '1900-01-01',			-- Asignacion de fecha vacia
			@Lis_Principal			= 1						-- Asignacion de la lista principal

	-- Lista de todos los USUARIOes
	IF @Par_NumLis	= @Lis_Principal
	BEGIN
		SELECT		UsuarioID,		Nombre,			Apellido,		CorreoElectronico,		Usuario,          
					NumeroCelular,	NumeroFijo,		Descripcion,	Status,					FechaNacimiento
		FROM USUARIO
	END

END