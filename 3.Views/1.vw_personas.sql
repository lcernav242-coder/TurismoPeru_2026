CREATE OR ALTER VIEW lfcv.vw_personas
as
SELECT
	p.apaterno,
	p.amaterno,
	p.nombres,
	case	
		when p.tipo_persona = 'N' then 'Natural'
		when p.tipo_persona = 'J' then 'Jurídica'
	end as [tipo_persona],
	estado,
	getdate() as Fecha_Consulta,
	lfcv.fn_NombreCompletoPersona(105) as Estudiante
	FROM lfcv.persona p

	select* 
	from lfcv.vw_personas;