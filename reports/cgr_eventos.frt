   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdEstado                                                      IdMotivo                                                      "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Detalle de Eventos"                                          Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1                                                      Arial                                                         	"Nombre"                                                     Arial                                                         IdMotivo,Motivo                                               Arial                                                         	IdCliente                                                     Arial                                                         cRuta.NroLote                                                 Arial                                                         NroGuia                                                       Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         IdEstado,Estado                                               Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Cantidad"                                                   Arial                                                         NroGuia                                                       Arial                                                         "Cantidad"                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              ^PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
	

TEXT TO cmdSQL noshow

	Declare @Empresa char(3),@dFecha datetime,
			@hFecha datetime, @NroLote int,@IdCliente varchar(10)

	Select @Empresa=?oApp.Empresa,@dFecha=?m.dFecha,@hFecha =?m.hFecha, @NroLote=?m.NroLote,@IdCliente=?m.Idcliente

	SELECT e.Fecha,  p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
	st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, 
	                         p.CIRecibido, e.IdMotivo, p.Obs,p.NroLote
	FROM  cgr_Paquete AS p 
	inner join cgr_Evento e on p.IdEmpresa= e.IdEmpresa and p.NroGuia = e.NroGuia
	LEFT OUTER JOIN cgr_Datos AS st ON e.IdEstado = st.Codigo AND e.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
	LEFT OUTER JOIN cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         
	where (p.IdCliente = @IdCliente or @IdCliente is null)
	and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha
	and (p.IDCliente =@IdCliente or @IdCliente is null)
	and (p.NroLote = @NroLote or @NroLote=0)
	order by e.IdEstado, e.IDMotivo, e.Fecha, p.NroGuia

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                               j���    Q  Q                        Ӑ   %   �      �     �          �  U  
  �  � U  SETEO0 %�C��  ��� � T��  ���� �	 M(� �� �  �1 �+ 	Declare @Empresa char(3),@dFecha datetime,�> �8 			@hFecha datetime, @NroLote int,@IdCliente varchar(10)� �  �v �p 	Select @Empresa=?oApp.Empresa,@dFecha=?m.dFecha,@hFecha =?m.hFecha, @NroLote=?m.NroLote,@IdCliente=?m.Idcliente� �  �� �� 	SELECT e.Fecha,  p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �Y �S 	st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, �I �C 	                         p.CIRecibido, e.IdMotivo, p.Obs,p.NroLote� � 	FROM  cgr_Paquete AS p �T �N 	inner join cgr_Evento e on p.IdEmpresa= e.IdEmpresa and p.NroGuia = e.NroGuia�u �o 	LEFT OUTER JOIN cgr_Datos AS st ON e.IdEstado = st.Codigo AND e.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'�� �� 	LEFT OUTER JOIN cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         �= �7 	where (p.IdCliente = @IdCliente or @IdCliente is null)�G �A 	and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha�: �4 	and (p.IDCliente =@IdCliente or @IdCliente is null)�/ �) 	and (p.NroLote = @NroLote or @NroLote=0)�: �4 	order by e.IdEstado, e.IDMotivo, e.Fecha, p.NroGuia� �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � a �a aa a
���AQ��q���a A bq 3                       &         A   S      )   Q                                      %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdEstado                                                      IdMotivo                                                      "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Detalle de Eventos"                                          Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1                                                      Arial                                                         	"Nombre"                                                     Arial                                                         IdMotivo,Motivo                                               Arial                                                         	IdCliente                                                     Arial                                                         cRuta.NroLote                                                 Arial                                                         NroGuia                                                       Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         IdEstado,Estado                                               Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Cantidad"                                                   Arial                                                         NroGuia                                                       Arial                                                         "Cantidad"                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              ^PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
	

TEXT TO cmdSQL noshow

	Declare @Empresa char(3),@dFecha datetime,
			@hFecha datetime, @NroLote int,@IdCliente varchar(10)

	Select @Empresa=?oApp.Empresa,@dFecha=?m.dFecha,@hFecha =?m.hFecha, @NroLote=?m.NroLote,@IdCliente=?m.Idcliente

	SELECT e.Fecha,  p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
	st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, 
	                         p.CIRecibido, e.IdMotivo, p.Obs,p.NroLote
	FROM  cgr_Paquete AS p 
	inner join cgr_Evento e on p.IdEmpresa= e.IdEmpresa and p.NroGuia = e.NroGuia
	LEFT OUTER JOIN cgr_Datos AS st ON e.IdEstado = st.Codigo AND e.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
	LEFT OUTER JOIN cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         
	where (p.IdCliente = @IdCliente or @IdCliente is null)
	and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha
	and (p.IDCliente =@IdCliente or @IdCliente is null)
	and (p.NroLote = @NroLote or @NroLote=0)
	order by e.IdEstado, e.IDMotivo, e.Fecha, p.NroGuia

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                               j���    Q  Q                        Ӑ   %   �      �     �          �  U  0 %�C��  ��� � T��  ���� �	 M(� �� �  �1 �+ 	Declare @Empresa char(3),@dFecha datetime,�> �8 			@hFecha datetime, @NroLote int,@IdCliente varchar(10)� �  �v �p 	Select @Empresa=?oApp.Empresa,@dFecha=?m.dFecha,@hFecha =?m.hFecha, @NroLote=?m.NroLote,@IdCliente=?m.Idcliente� �  �� �� 	SELECT e.Fecha,  p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �Y �S 	st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, �I �C 	                         p.CIRecibido, e.IdMotivo, p.Obs,p.NroLote� � 	FROM  cgr_Paquete AS p �T �N 	inner join cgr_Evento e on p.IdEmpresa= e.IdEmpresa and p.NroGuia = e.NroGuia�u �o 	LEFT OUTER JOIN cgr_Datos AS st ON e.IdEstado = st.Codigo AND e.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'�� �� 	LEFT OUTER JOIN cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         �= �7 	where (p.IdCliente = @IdCliente or @IdCliente is null)�G �A 	and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha�: �4 	and (p.IDCliente =@IdCliente or @IdCliente is null)�/ �) 	and (p.NroLote = @NroLote or @NroLote=0)�: �4 	order by e.IdEstado, e.IDMotivo, e.Fecha, p.NroGuia� �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables    ��1 � A � a �a aa a
���AQ��q���a A bq 4 q 2                       "        I  S  "    )   Q                                