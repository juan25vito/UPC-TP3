create database DB_ClinicaInternacional1

go

use DB_ClinicaInternacional1

go

create table GM_Solicitud_Mantenimiento(
GM_NroSolicitud Char(8) primary key, -- Codigo autogenerado
GM_Fecha_Creacion Char(8), -- Fecha de Creación
GM_CodigoEmpleadoSol Char(8), -- Solicitado por
GM_CodigoEmpleadoBen Char(8), -- Beneficiario
Codigo_CC Int, -- Centro de Costo
GM_Tipo_Servicio Varchar(50), -- TipodeServicio
GM_Numero_Equipo Char(8), -- Equipo elegido por el Responsable de Area
GM_FechaIncidencia Char(8), -- Fecha de Incidencia
GM_Detalle_Servicio Varchar(100), -- Detalle Servicio
GM_Observación Varchar(100), -- Observaciones
GM_Estado int
)

go

create table CL_EX_Empleado(
GM_CodigoEmpleado Char(8) primary key,
GM_NombreEmpleado Char(8),
)

create table CL_EX_CentroCosto(
Codigo_CC Int,
Descripccion Varchar(50),
Estado Int 
)

create table CL_ES_GM_FichaEquipo(
GM_Numero_Equipo Char(8),
GM_Ubicacion varchar(80),
GM_Fecha_Ultima_Mantenimiento Char(8),
GM_Fecha_Ultima_Reparacion Char(8),
GM_NroPeriodo_Mantenimiento Int,
GM_Fecha_Proximo_Mantenimiento Char(8),
GM_Observaciones Varchar(80)
)


--================================== INSERTAR SOLICITUD DE MANTENIMIENTO ======================================


CREATE PROCEDURE SP_Insertar_Solicitud_de_Mantenimiento(
@GM_NroSolicitud Char(8), 
@GM_Fecha_Creacion Char(8), 
@GM_CodigoEmpleadoSol Char(8),
@GM_CodigoEmpleadoBen Char(8), 
@Codigo_CC Int, 
@GM_Tipo_Servicio Varchar(50),
@GM_Numero_Equipo Char(8), 
@GM_FechaIncidencia Char(8), 
@GM_Detalle_Servicio Varchar(100), 
@GM_Observación Varchar(100),
@GM_Estado int

)
AS

BEGIN

BEGIN TRY
INSERT
  INTO GM_Solicitud_Mantenimiento

(
@GM_NroSolicitud, 
@GM_Fecha_Creacion, 
@GM_CodigoEmpleadoSol,
@GM_CodigoEmpleadoBen, 
@Codigo_CC, 
@GM_Tipo_Servicio,
@GM_Numero_Equipo, 
@GM_FechaIncidencia, 
@GM_Detalle_Servicio, 
@GM_Observación,
@GM_Estado
)


  VALUES
  (
@GM_NroSolicitud, 
@GM_Fecha_Creacion, 
@GM_CodigoEmpleadoSol,
@GM_CodigoEmpleadoBen, 
@Codigo_CC, 
@GM_Tipo_Servicio,
@GM_Numero_Equipo, 
@GM_FechaIncidencia, 
@GM_Detalle_Servicio, 
@GM_Observación,
@GM_Estado


)

  SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END


GO

--================================== MODIFICAR SOLICITUD DE MANTENIMIENTO ======================================

create procedure SP_Buscar_Solicitud_de_Mantenimiento(
 @GM_NroSolicitud char(8))
as
begin
	select
	GM_NroSolicitud
	,GM_Fecha_Creacion
	,GM_CodigoEmpleadoSol
	,GM_CodigoEmpleadoBen
	,Codigo_CC
	,GM_Tipo_Servicio
	,GM_Numero_Equipo
	,GM_FechaIncidencia
	,GM_Detalle_Servicio
	,GM_Observación
	,GM_Estado
	from  dbo.GM_Solicitud_Mantenimiento
	where GM_NroSolicitud = @GM_NroSolicitud

end

CREATE PROCEDURE SP_Modificar_Solicitud_de_Mantenimiento(
 @GM_NroSolicitud Char(8), 
@GM_Fecha_Creacion Char(8), 
@GM_CodigoEmpleadoSol Char(8),
@GM_CodigoEmpleadoBen Char(8), 
@Codigo_CC Int, 
@GM_Tipo_Servicio Varchar(50),
@GM_Numero_Equipo Char(8), 
@GM_FechaIncidencia Char(8), 
@GM_Detalle_Servicio Varchar(100), 
@GM_Observación Varchar(100),
@GM_Estado int)
AS
BEGIN

BEGIN TRY
  UPDATE GM_Solicitud_Mantenimiento 
  SET  
GM_NroSolicitud = @GM_Fecha_Creacion, 
GM_CodigoEmpleadoSol = @GM_CodigoEmpleadoSol,
GM_CodigoEmpleadoBen = @GM_CodigoEmpleadoBen,
Codigo_CC = @Codigo_CC, 
GM_Tipo_Servicio = @GM_Tipo_Servicio,
GM_Numero_Equipo = @GM_Numero_Equipo, 
GM_FechaIncidencia = @GM_FechaIncidencia, 
GM_Detalle_Servicio = @GM_Detalle_Servicio, 
GM_Observación = @GM_Observación,
GM_Estado = @GM_Estado
  WHERE 
  GM_NroSolicitud = @GM_NroSolicitud

IF @@ROWCOUNT = 0
  SELECT '1'
ELSE
  SELECT '0'

  
END TRY

BEGIN CATCH
	SELECT '1'
END CATCH
  
END

GO

--================================== ELIMINAR SOLICITUD DE MANTENIMIENTO ======================================

--SOLICITUD DE MANTENIMIENTO

CREATE PROCEDURE SP_Eliminar_Solicitud_de_Mantenimiento(
 @GM_NroSolicitud char(8))
AS
BEGIN

BEGIN TRY

  UPDATE GM_Solicitud_Mantenimiento 
  SET 
  GM_Estado = '1'
  WHERE 
  GM_NroSolicitud = @GM_NroSolicitud

  IF @@ROWCOUNT = 0
	SELECT '1'
  ELSE
	SELECT '0'


END TRY
BEGIN CATCH
	SELECT '1'
END CATCH

END

alter procedure sp_Listar_Solicitud_de_Mantenimiento(
@GM_FechaInicio Char(8),
@GM_FechaFin Char(8)
)
as
begin

select GM_NroSolicitud 
,GM_Fecha_Creacion
,GM_Tipo_Servicio
,'' GM_Tipo_Mantenimiento
,GM_Estado
from tb_solicitud_mantenimiento a
where a.GM_Fecha_Creacion between @GM_FechaInicio and @GM_FechaFin
end
