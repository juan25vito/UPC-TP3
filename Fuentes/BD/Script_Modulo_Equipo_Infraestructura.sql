
create table TB_Solicitud_Mantenimiento(
GM_NroSolicitud Int Identity(1,1) Primary Key, -- Codigo autogenerado
GM_Fecha_Creacion Char(8), -- Fecha de Creación
GM_CodigoSolicitante Char(8), -- Solicitado por
GM_CodigoBeneficiario Char(8), -- Beneficiario
Codigo_CC Char(8), -- Centro de Costo
GM_Tipo_Servicio Varchar(50), -- TipodeServicio
GM_Numero_Equipo Char(8), -- Equipo elegido por el Responsable de Area
GM_FechaIncidencia Char(8), -- Fecha de Incidencia
GM_Detalle_Servicio Varchar(100), -- Detalle Servicio
GM_Observación Varchar(100), -- Observaciones
GM_Estado int)

go

--======================================================================================

CREATE TABLE TB_FICHA_EQUIPO(
GM_Codigo_Fecha_Equipo int Identity(1,1) Primary Key,
GM_Ubicación Varchar(100),
GM_Fecha_Último_Mantenimiento Char(8),
GM_Fecha_Ultima_Reparación Char(8),
GM_NroPeriodo_Mantenimiento Int,
GM_Fecha_Proximo_Mantenimiento Char(8),
GM_Observaciones Varchar(100),
GM_Numero_Equipo Varchar(100))

go
--======================================================================================

CREATE TABLE TB_ACTIVO(
Codigo_Activo int Identity(1,1) Primary Key,
Tipo_Activo Varchar(100),
Descripción Varchar(100),
Cantidad Int,
Estado Int)

go
--======================================================================================

CREATE TABLE TB_EMPLEADO(
Codigo_Empleado int Identity(1,1) Primary Key,
Apellidos_Empleado  Varchar(100),
Nombres_Empleado  Varchar(100),
Cargo_Empleado  Varchar(100),
Correo_Empleado  Varchar(100),
Estado Int)

go
--======================================================================================

CREATE TABLE TB_CENTRO_COSTO(
Codigo_CC int Identity(1,1) Primary Key,
Descripción_CC Varchar(100),
Estado Int)

go
--======================================================================================

CREATE TABLE TB_ORDEN_TRABAJO(
GM_NroOrden int Identity(1,1) Primary Key,
GM_Fecha_Creación Char(8),
GM_Fecha_Asignación Char(8),
GM_Fecha_Inicio Char(8),
GM_Prioridad Varchar(100),
GM_Fecha_Fin Char(8),
GM_TiempoAprox Int,
GM_Indicaciones Varchar(100),
GM_Tipo_Atención Varchar(100),
GM_Estado Int,
GM_Moti_Recha_Acepta Varchar(100), 
GM_Origen Varchar(100),
GM_Fecha_Recha_Acepta Char(8))

go
--======================================================================================

CREATE TABLE TB_ORDEN_TRABAJO_DET(
GM_NroOrden_Det int Identity(1,1) Primary Key,
GM_NroOrden int references TB_ORDEN_TRABAJO,
GM_Tiempo_Atención int,
GM_Fecha_Rechazo Char(8),
GM_Motivo_Rechazo Varchar(100))

go
--======================================================================================

CREATE TABLE TB_INFORME_EQUIPO(
GM_NroInforme int Identity(1,1) Primary Key,
GM_Fecha_Informe Char(8),
GM_Descripción_Actividades Varchar(100),
GM_Observaciones Varchar(100),
GM_Estado int,
GM_Descripción_Repuestos Varchar(100)
)

go
--======================================================================================

CREATE TABLE TB_INFORME_EQUIPO_DET(
GM_NroInforme_Det int Identity(1,1) Primary Key,
GM_NroInforme int references TB_INFORME_EQUIPO, 
GM_Fecha_Ejecución Char(8),
GM_Tiempo_Ejecución int,
GM_Motivo_Rechazo  Varchar(100),
GM_Documento_adjunto  Varchar(100))

go
--======================================================================================

CREATE TABLE TB_ACTIVIDADES_PLANIFICADAS(
GM_Codigo_Actividad int Identity(1,1) Primary Key, 
GM_Fecha_Planificada Char(8),
GM_Hora_Inicio int,
GM_Hora_Final int,
GM_Estado int
)

go
--======================================================================================

CREATE TABLE TB_PLAN_MANTENIMIENTO(
GM_Codigo_PlanMantenimiento int Identity(1,1) Primary Key, 
GM_Fecha_Creación Char(8),
GM_Periodo_Inicio Char(8),
GM_Periodo_Final Char(8),
GM_Estado int,
GM_Codigo_Plan int)

go

--=============================================================================================================
--================================================ STORES PROCEDURES ==========================================
--=============================================================================================================

--================================== INSERTAR SOLICITUD DE MANTENIMIENTO ======================================


CREATE PROCEDURE SP_Insertar_Solicitud_de_Mantenimiento(
@GM_Fecha_Creacion Char(8), 
@GM_CodigoSolicitante Char(8),
@GM_CodigoBeneficiario Char(8), 
@Codigo_CC Char(8), 
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
INSERT INTO TB_Solicitud_Mantenimiento

  VALUES
  ( @GM_Fecha_Creacion, 
@GM_CodigoSolicitante,
@GM_CodigoBeneficiario, 
@Codigo_CC, 
@GM_Tipo_Servicio,
@GM_Numero_Equipo, 
@GM_FechaIncidencia, 
@GM_Detalle_Servicio, 
@GM_Observación,
@GM_Estado)

  SELECT '0'

END TRY

BEGIN CATCH
	SELECT '1'
END CATCH

END

--======================================================================================

--SP_Insertar_Solicitud_de_Mantenimiento '20140305','EMP00001','EMP00002','CECO0001','TISE0001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION',1

--======================================================================================

--select*from TB_Solicitud_Mantenimiento
 
--======================================================================================





--================================== MODIFICAR SOLICITUD DE MANTENIMIENTO ======================================


CREATE PROCEDURE SP_Modificar_Solicitud_de_Mantenimiento(
@GM_NroSolicitud Int,
@GM_Fecha_Creacion Char(8), 
@GM_CodigoSolicitante Char(8),
@GM_CodigoBeneficiario Char(8), 
@Codigo_CC Char(8), 
@GM_Tipo_Servicio Varchar(50),
@GM_Numero_Equipo Char(8), 
@GM_FechaIncidencia Char(8), 
@GM_Detalle_Servicio Varchar(100), 
@GM_Observación Varchar(100),
@GM_Estado int)
AS
BEGIN

BEGIN TRY
  UPDATE TB_Solicitud_Mantenimiento 
  SET  
GM_Fecha_Creacion = @GM_Fecha_Creacion, 
GM_CodigoSolicitante = @GM_CodigoSolicitante,
GM_CodigoBeneficiario = @GM_CodigoBeneficiario,
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



--SP_Modificar_Solicitud_de_Mantenimiento '2','20140304','EMP00001','EMP00002','CECO0001','TISE0001','EQUI0001','20140305','DETALLESERVICIO','OBSERVACION',1
 

--================================== ELIMINAR SOLICITUD DE MANTENIMIENTO ======================================

CREATE PROCEDURE SP_Eliminar_Solicitud_de_Mantenimiento(
@GM_NroSolicitud int)
AS
BEGIN

BEGIN TRY

  UPDATE TB_Solicitud_Mantenimiento 
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



-- SP_Eliminar_Solicitud_de_Mantenimiento '2'


-----Procedures Faltantes  Luis Muñoz


create procedure SP_Buscar_Solicitud_de_Mantenimiento(
 @GM_NroSolicitud char(8))
as
begin
	select
	GM_NroSolicitud
	,GM_Fecha_Creacion
	,GM_CodigoSolicitante
	,GM_CodigoBeneficiario
	,Codigo_CC
	,GM_Tipo_Servicio
	,GM_Numero_Equipo
	,GM_FechaIncidencia
	,GM_Detalle_Servicio
	,GM_Observación
	,GM_Estado
	from  dbo.TB_Solicitud_Mantenimiento
	where GM_NroSolicitud = @GM_NroSolicitud

end


go



create procedure SP_Listar_Solicitud_de_Mantenimiento(
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

