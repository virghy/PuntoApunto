  F   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
00 J110 series
OUTPUT=USB001
ORIENTATION=0
PAPERSIZE=9
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=300
COLLATE=1
                                                                  G  /  winspool  HP Deskjet 1000 J110 series  USB001                                                                         Arial                                                         NroLote                                                       IdEstado                                                      "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Detalle de Lotes"                                            Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1,Motivo                                               Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Ultimo Evento"                                              Arial                                                         Cliente,Descripcion                                           Arial                                                         NroLote                                                       Arial                                                         Cantidad                                                      Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         s1                                                            Arial                                                         s2                                                            Arial                                                         s3                                                            Arial                                                         s4                                                            Arial                                                         s5                                                            Arial                                                         IdEstado,Estado                                               Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Cantidad"                                                   Arial                                                         "OF"                                                         Arial                                                         "RUTA"                                                       Arial                                                         "ENT"                                                        Arial                                                         "DEV"                                                        Arial                                                         "RET"                                                        Arial                                                         s6                                                            ""                                                            Arial                                                         
"DEV DEF"                                                    Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              qPROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
	

TEXT TO cmdSQL noshow

SELECT  lt.*, p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, 
                         p.CIRecibido, p.IdMotivo, p.Obs
FROM  cgr_Paquete AS p LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
LEFT OUTER JOIN
                         cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         
inner join (
	Select l.NroLote,l.Fecha, c.RazSocial Cliente, l.Descripcion, l.Cantidad,
	sum(case when p.IdEstado='ST001' then 1 else 0 end) as S1,
	sum(case when p.IdEstado='ST002' then 1 else 0 end) as S2,
	sum(case when p.IdEstado='ST003' then 1 else 0 end) as S3,
	sum(case when p.IdEstado='ST004' then 1 else 0 end) as S4,
	sum(case when p.IdEstado='ST005' then 1 else 0 end) as S5,
	sum(case when p.IdEstado='ST006' then 1 else 0 end) as S6	
	from cgr_Paquete p 
	inner join cgr_Lotes l on p.IdEmpresa = l.IdEmpresa
	and p.NroLote = convert(varchar(20),l.NroLote)
	left join vt_Clientes c on l.IdEmpresa = c.IdEmpresa and  l.IdCliente = c.IdCliente
	where l.IdEmpresa=?oApp.Empresa
	and l.Fecha between ?m.dFecha and ?m.hFecha
	group by l.NroLote, l.IdCliente, l.Fecha, c.RazSocial, l.Descripcion, l.Cantidad
	) lt on p.IdEmpresa=?oApp.Empresa and p.NroLote = convert(varchar(20),lt.NroLote)
	where (lt.Nrolote = ?m.NroLote or ?m.NroLote = 0)
	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)
order by lt.Fecha,lt.NroLote,p.IdEstado,p.NroGuia

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
            ����    �  �                        {E   %   �      A  '   �          �  U  
  �  � U  SETEOg %�C��  ��� � T��  ���� �	 M(� �� �  �� �� SELECT  lt.*, p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �X �R st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, �> �8                          p.CIRecibido, p.IdMotivo, p.Obs�, �& FROM  cgr_Paquete AS p LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'� � LEFT OUTER JOIN�� ��                          cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         � � inner join (�P �J 	Select l.NroLote,l.Fecha, c.RazSocial Cliente, l.Descripcion, l.Cantidad,�A �; 	sum(case when p.IdEstado='ST001' then 1 else 0 end) as S1,�A �; 	sum(case when p.IdEstado='ST002' then 1 else 0 end) as S2,�A �; 	sum(case when p.IdEstado='ST003' then 1 else 0 end) as S3,�A �; 	sum(case when p.IdEstado='ST004' then 1 else 0 end) as S4,�A �; 	sum(case when p.IdEstado='ST005' then 1 else 0 end) as S5,�A �; 	sum(case when p.IdEstado='ST006' then 1 else 0 end) as S6	� � 	from cgr_Paquete p �: �4 	inner join cgr_Lotes l on p.IdEmpresa = l.IdEmpresa�5 �/ 	and p.NroLote = convert(varchar(20),l.NroLote)�Z �T 	left join vt_Clientes c on l.IdEmpresa = c.IdEmpresa and  l.IdCliente = c.IdCliente�& �  	where l.IdEmpresa=?oApp.Empresa�2 �, 	and l.Fecha between ?m.dFecha and ?m.hFecha�W �Q 	group by l.NroLote, l.IdCliente, l.Fecha, c.RazSocial, l.Descripcion, l.Cantidad�X �R 	) lt on p.IdEmpresa=?oApp.Empresa and p.NroLote = convert(varchar(20),lt.NroLote)�8 �2 	where (lt.Nrolote = ?m.NroLote or ?m.NroLote = 0)�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)�7 �1 order by lt.Fecha,lt.NroLote,p.IdEstado,p.NroGuia� �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � a !
����Qa	!��Q�a!q���qa A bq 3                       &         A   f      )   �                             �DRIVER=winspool
DEVICE=HP Deskjet 1000 J110 series
OUTPUT=USB001
ORIENTATION=0
PAPERSIZE=9
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=300
COLLATE=1
                                                                  G  /  winspool  HP Deskjet 1000 J110 series  USB001                                                                         Arial                                                         NroLote                                                       IdEstado                                                      "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Detalle de Lotes"                                            Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1,Motivo                                               Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Ultimo Evento"                                              Arial                                                         Cliente,Descripcion                                           Arial                                                         NroLote                                                       Arial                                                         Cantidad                                                      Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         s1                                                            Arial                                                         s2                                                            Arial                                                         s3                                                            Arial                                                         s4                                                            Arial                                                         s5                                                            Arial                                                         IdEstado,Estado                                               Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Cantidad"                                                   Arial                                                         "OF"                                                         Arial                                                         "RUTA"                                                       Arial                                                         "ENT"                                                        Arial                                                         "DEV"                                                        Arial                                                         "RET"                                                        Arial                                                         s6                                                            ""                                                            Arial                                                         
"DEV DEF"                                                    Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              qPROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
	

TEXT TO cmdSQL noshow

SELECT  lt.*, p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, 
                         p.CIRecibido, p.IdMotivo, p.Obs
FROM  cgr_Paquete AS p LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
LEFT OUTER JOIN
                         cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         
inner join (
	Select l.NroLote,l.Fecha, c.RazSocial Cliente, l.Descripcion, l.Cantidad,
	sum(case when p.IdEstado='ST001' then 1 else 0 end) as S1,
	sum(case when p.IdEstado='ST002' then 1 else 0 end) as S2,
	sum(case when p.IdEstado='ST003' then 1 else 0 end) as S3,
	sum(case when p.IdEstado='ST004' then 1 else 0 end) as S4,
	sum(case when p.IdEstado='ST005' then 1 else 0 end) as S5,
	sum(case when p.IdEstado='ST006' then 1 else 0 end) as S6	
	from cgr_Paquete p 
	inner join cgr_Lotes l on p.IdEmpresa = l.IdEmpresa
	and p.NroLote = convert(varchar(20),l.NroLote)
	left join vt_Clientes c on l.IdEmpresa = c.IdEmpresa and  l.IdCliente = c.IdCliente
	where l.IdEmpresa=?oApp.Empresa
	and l.Fecha between ?m.dFecha and ?m.hFecha
	group by l.NroLote, l.IdCliente, l.Fecha, c.RazSocial, l.Descripcion, l.Cantidad
	) lt on p.IdEmpresa=?oApp.Empresa and p.NroLote = convert(varchar(20),lt.NroLote)
	where (lt.Nrolote = ?m.NroLote or ?m.NroLote = 0)
	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)
order by lt.Fecha,lt.NroLote,p.IdEstado,p.NroGuia

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
            ����    �  �                        {E   %   �      A  '   �          �  U  g %�C��  ��� � T��  ���� �	 M(� �� �  �� �� SELECT  lt.*, p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �X �R st.Nombre AS Estado, md.Nombre as Motivo, p.IdCliente, p.FechaEnt, p.RecibidoPor, �> �8                          p.CIRecibido, p.IdMotivo, p.Obs�, �& FROM  cgr_Paquete AS p LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'� � LEFT OUTER JOIN�� ��                          cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'                         � � inner join (�P �J 	Select l.NroLote,l.Fecha, c.RazSocial Cliente, l.Descripcion, l.Cantidad,�A �; 	sum(case when p.IdEstado='ST001' then 1 else 0 end) as S1,�A �; 	sum(case when p.IdEstado='ST002' then 1 else 0 end) as S2,�A �; 	sum(case when p.IdEstado='ST003' then 1 else 0 end) as S3,�A �; 	sum(case when p.IdEstado='ST004' then 1 else 0 end) as S4,�A �; 	sum(case when p.IdEstado='ST005' then 1 else 0 end) as S5,�A �; 	sum(case when p.IdEstado='ST006' then 1 else 0 end) as S6	� � 	from cgr_Paquete p �: �4 	inner join cgr_Lotes l on p.IdEmpresa = l.IdEmpresa�5 �/ 	and p.NroLote = convert(varchar(20),l.NroLote)�Z �T 	left join vt_Clientes c on l.IdEmpresa = c.IdEmpresa and  l.IdCliente = c.IdCliente�& �  	where l.IdEmpresa=?oApp.Empresa�2 �, 	and l.Fecha between ?m.dFecha and ?m.hFecha�W �Q 	group by l.NroLote, l.IdCliente, l.Fecha, c.RazSocial, l.Descripcion, l.Cantidad�X �R 	) lt on p.IdEmpresa=?oApp.Empresa and p.NroLote = convert(varchar(20),lt.NroLote)�8 �2 	where (lt.Nrolote = ?m.NroLote or ?m.NroLote = 0)�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)�7 �1 order by lt.Fecha,lt.NroLote,p.IdEstado,p.NroGuia� �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � A � a !
����Qa	!��Q�a!q���qa A bq 4 q 2                       5     %   \  f  +    )   �                       