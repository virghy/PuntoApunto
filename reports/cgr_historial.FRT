   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         NroGuia                                                       "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         "Historial del paquete"                                       Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1                                                      Arial                                                         	"Nombre"                                                     Arial                                                         	IdCliente                                                     Arial                                                         cRuta.NroLote                                                 Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         "Estado: ",IdEstado,Estado                                    Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         5"Fecha Ing - Vence : ",dtoc(FechaIng),'-',dtoc(Vence)         Arial                                                         "Fecha Entrg : ",dtoc(FechaEnt)                               Arial                                                         IdMotivo,Motivo                                               Arial                                                         IdMensajero                                                   Arial                                                         "Fecha"                                                      Arial                                                         "Mensajero"                                                   Arial                                                         	"Evento"                                                     Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              �PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.NroGuia )
	m.NroGuia =null
ENDIF
	

TEXT TO cmdSQL noshow
	Declare @Empresa char(3), @NroGuia varchar(20)
	Select @Empresa=?oApp.Empresa,@Nroguia =?m.NroGuia
	
	
	SELECT        e.Fecha, p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, st.Nombre AS Estado, md.Nombre AS Motivo, p.IdCliente, 
	                         p.FechaEnt, p.RecibidoPor, p.CIRecibido, e.IdMotivo, p.Obs, p.NroLote, e.IdMensajero,e.IdRuta
	FROM            cgr_Paquete AS p INNER JOIN
	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia LEFT OUTER JOIN
	                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa AND st.IdTabla = 'ST' LEFT OUTER JOIN
	                         cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa AND md.IdTabla = 'MD'
	WHERE        (p.NroGuia = @NroGuia) AND (p.IdEmpresa = @Empresa)
	ORDER BY p.NroGuia, e.Fecha, e.IdEvento

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                               ����    m  m                        s�   %   �           �          �  U  
  �  � U  SETEOZ %�C��  ��� � T��  ���� �	 M(� ��5 �/ 	Declare @Empresa char(3), @NroGuia varchar(20)�9 �3 	Select @Empresa=?oApp.Empresa,@Nroguia =?m.NroGuia� � 	� � 	�� �� 	SELECT        e.Fecha, p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, st.Nombre AS Estado, md.Nombre AS Motivo, p.IdCliente, �} �w 	                         p.FechaEnt, p.RecibidoPor, p.CIRecibido, e.IdMotivo, p.Obs, p.NroLote, e.IdMensajero,e.IdRuta�2 �, 	FROM            cgr_Paquete AS p INNER JOIN�v �p 	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia LEFT OUTER JOIN�� �� 	                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa AND st.IdTabla = 'ST' LEFT OUTER JOIN�~ �x 	                         cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa AND md.IdTabla = 'MD'�G �A 	WHERE        (p.NroGuia = @NroGuia) AND (p.IdEmpresa = @Empresa)�. �( 	ORDER BY p.NroGuia, e.Fecha, e.IdEvento� �  � � ��C � � cRuta� �� F� � U  NROGUIA CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � Q�q q 1�!a��q�a A bq 3                       &         A   �      )   m                                                                          %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         NroGuia                                                       "Nro Guia"                                                   Arial                                                         "Nro Guia Ref"                                                Arial                                                         "Historial del paquete"                                       Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia                                                       Arial                                                         NroGuia1                                                      Arial                                                         	"Nombre"                                                     Arial                                                         	IdCliente                                                     Arial                                                         cRuta.NroLote                                                 Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         "Estado: ",IdEstado,Estado                                    Arial                                                         "Nro Lote"                                                   Arial                                                         	"Cliente"                                                     Arial                                                         5"Fecha Ing - Vence : ",dtoc(FechaIng),'-',dtoc(Vence)         Arial                                                         "Fecha Entrg : ",dtoc(FechaEnt)                               Arial                                                         IdMotivo,Motivo                                               Arial                                                         IdMensajero                                                   Arial                                                         "Fecha"                                                      Arial                                                         "Mensajero"                                                   Arial                                                         	"Evento"                                                     Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              �PROCEDURE Init
IF EMPTY(m.NroGuia )
	m.NroGuia =null
ENDIF
	

TEXT TO cmdSQL noshow
	Declare @Empresa char(3), @NroGuia varchar(20)
	Select @Empresa=?oApp.Empresa,@Nroguia =?m.NroGuia
	SELECT        e.Fecha, p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, st.Nombre AS Estado, md.Nombre AS Motivo, p.IdCliente, 
	                         p.FechaEnt, p.RecibidoPor, p.CIRecibido, e.IdMotivo, p.Obs, p.NroLote, e.IdMensajero,e.IdRuta
	FROM            cgr_Paquete AS p INNER JOIN
	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia LEFT OUTER JOIN
	                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa AND st.IdTabla = 'ST' LEFT OUTER JOIN
	                         cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa AND md.IdTabla = 'MD'
	WHERE        (p.NroGuia = @NroGuia) AND (p.IdEmpresa = @Empresa)
	ORDER BY p.NroGuia, e.Fecha, e.IdEvento

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                     t���    [  [                        �   %   �           �          �  U  L %�C��  ��� � T��  ���� �	 M(� ��5 �/ 	Declare @Empresa char(3), @NroGuia varchar(20)�9 �3 	Select @Empresa=?oApp.Empresa,@Nroguia =?m.NroGuia�� �� 	SELECT        e.Fecha, p.NroGuia1, p.NroGuia, e.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, st.Nombre AS Estado, md.Nombre AS Motivo, p.IdCliente, �} �w 	                         p.FechaEnt, p.RecibidoPor, p.CIRecibido, e.IdMotivo, p.Obs, p.NroLote, e.IdMensajero,e.IdRuta�2 �, 	FROM            cgr_Paquete AS p INNER JOIN�v �p 	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia LEFT OUTER JOIN�� �� 	                         cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa AND st.IdTabla = 'ST' LEFT OUTER JOIN�~ �x 	                         cgr_Datos AS md ON e.IdMotivo = md.Codigo AND e.IdEmpresa = md.IdEmpresa AND md.IdTabla = 'MD'�G �A 	WHERE        (p.NroGuia = @NroGuia) AND (p.IdEmpresa = @Empresa)�. �( 	ORDER BY p.NroGuia, e.Fecha, e.IdEvento� �  � � ��C � � cRuta� �� F� � U  NROGUIA CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � A � Q�1�!a��q�a A bq 4 q 2                       \        �  �      )   [                      