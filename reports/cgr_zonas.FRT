   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
PUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=3
COLLATE=1
                                                          8    winspool  PrimoPDF  PrimoPort:                        Arial                                                         IdZona                                                        	"Estado"                                                     Arial                                                         
"Cantidad"                                                    Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Resumen de Paquetes por Zona"                                Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         IdEstado,Estado                                               Arial                                                         Cantidad                                                      Arial                                                         IdZona,Zona                                                   Arial                                                         "Zona"                                                       Arial                                                         "Cantidad"                                                   Arial                                                         Cantidad                                                      ""                                                            Arial                                                         "Total"                                                      Arial                                                         Cantidad                                                      Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              �PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
IF EMPTY(m.EstadoGuia)
	m.EstadoGuia=null
ENDIF	

IF EMPTY(m.Zona)
	m.Zona=null
ENDIF

TEXT TO cmdSQL noshow

	Declare @Empresa char(3),@dFecha datetime,
			@hFecha datetime, @NroGuia varchar(20), @NroLote varchar(20), @IdCliente varchar(10),@IdZona char(5), @Estado char(5)

	Select @Empresa=?oApp.Empresa, @dFecha=?m.dFecha, @hFecha =?m.hFecha, @NroLote=?nroLote, @IdZona=?m.Zona, @Estado = ?m.EstadoGuia   

SELECT  count(*) Cantidad, p.IdEstado,  
	st.Nombre AS Estado, p.IdZona, zn.Nombre Zona
	FROM  cgr_Paquete AS p 
	LEFT OUTER JOIN cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
	LEFT OUTER JOIN cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'  
	LEFT OUTER JOIN cgr_Datos AS zn ON p.IdZona = zn.Codigo AND p.IdEmpresa = zn.IdEmpresa and zn.IdTabla = 'ZN'                       
	where (p.IdCliente = @IdCliente or @IdCliente is null)
	--and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha
	--and (p.NroLote = @NroLote or @NroLote=0)
	and (p.IdZona = @IdZona or @IdZona is null)
	and (p.IdEstado = @Estado or @Estado is null)
	and p.IdEmpresa = @Empresa
	and p.FechaIng between @dFecha and @hFecha 
		group by p.IdEstado,  
	st.Nombre , p.IdZona, zn.Nombre 
	order by p.IdZona,p.IdEstado


ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                    ���                              X   %   /      �  )   W          �  U  � %�C��  ��� � T��  ���� � %�C�� ���@ � T�� ���� � %�C�� ���b � T�� ���� �	 M(� �� �  �1 �+ 	Declare @Empresa char(3),@dFecha datetime,�~ �x 			@hFecha datetime, @NroGuia varchar(20), @NroLote varchar(20), @IdCliente varchar(10),@IdZona char(5), @Estado char(5)� �  �� �� 	Select @Empresa=?oApp.Empresa, @dFecha=?m.dFecha, @hFecha =?m.hFecha, @NroLote=?nroLote, @IdZona=?m.Zona, @Estado = ?m.EstadoGuia   � �  �. �( SELECT  count(*) Cantidad, p.IdEstado,  �4 �. 	st.Nombre AS Estado, p.IdZona, zn.Nombre Zona� � 	FROM  cgr_Paquete AS p �u �o 	LEFT OUTER JOIN cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'�w �q 	LEFT OUTER JOIN cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'  �� �� 	LEFT OUTER JOIN cgr_Datos AS zn ON p.IdZona = zn.Codigo AND p.IdEmpresa = zn.IdEmpresa and zn.IdTabla = 'ZN'                       �= �7 	where (p.IdCliente = @IdCliente or @IdCliente is null)�I �C 	--and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha�1 �+ 	--and (p.NroLote = @NroLote or @NroLote=0)�2 �, 	and (p.IdZona = @IdZona or @IdZona is null)�4 �. 	and (p.IdEstado = @Estado or @Estado is null)�! � 	and p.IdEmpresa = @Empresa�2 �, 	and p.FechaIng between @dFecha and @hFecha � � 		group by p.IdEstado,  �' �! 	st.Nombre , p.IdZona, zn.Nombre �# � 	order by p.IdZona,p.IdEstado� �  � �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE
 ESTADOGUIA ZONA CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables    ��1 � A � A � A � a �a �a �A�Qq���!A!�q1a a A bq 4 q 2                       �     '   �  �  -    )                                                        �DRIVER=winspool
DEVICE=PrimoPDF
OUTPUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=3
COLLATE=1
                                                          8    winspool  PrimoPDF  PrimoPort:                        Arial                                                         IdZona                                                        	"Estado"                                                     Arial                                                         
"Cantidad"                                                    Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Resumen de Paquetes por Zona"                                Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         IdEstado,Estado                                               Arial                                                         Cantidad                                                      Arial                                                         IdZona,Zona                                                   Arial                                                         "Zona"                                                       Arial                                                         "Cantidad"                                                   Arial                                                         Cantidad                                                      ""                                                            Arial                                                         "Total"                                                      Arial                                                         Cantidad                                                      Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              �PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.IdCliente=null
ENDIF
IF EMPTY(m.EstadoGuia)
	m.EstadoGuia=null
ENDIF	

IF EMPTY(m.Zona)
	m.Zona=null
ENDIF

TEXT TO cmdSQL noshow

	Declare @Empresa char(3),@dFecha datetime,
			@hFecha datetime, @NroGuia varchar(20), @NroLote varchar(20), @IdCliente varchar(10),@IdZona char(5), @Estado char(5)

	Select @Empresa=?oApp.Empresa, @dFecha=?m.dFecha, @hFecha =?m.hFecha, @NroLote=?nroLote, @IdZona=?m.Zona, @Estado = ?m.EstadoGuia   

SELECT  count(*) Cantidad, p.IdEstado,  
	st.Nombre AS Estado, p.IdZona, zn.Nombre Zona
	FROM  cgr_Paquete AS p 
	LEFT OUTER JOIN cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'
	LEFT OUTER JOIN cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'  
	LEFT OUTER JOIN cgr_Datos AS zn ON p.IdZona = zn.Codigo AND p.IdEmpresa = zn.IdEmpresa and zn.IdTabla = 'ZN'                       
	where (p.IdCliente = @IdCliente or @IdCliente is null)
	--and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha
	--and (p.NroLote = @NroLote or @NroLote=0)
	and (p.IdZona = @IdZona or @IdZona is null)
	and (p.IdEstado = @Estado or @Estado is null)
	and p.IdEmpresa = @Empresa
	and p.FechaIng between @dFecha and @hFecha 
		group by p.IdEstado,  
	st.Nombre , p.IdZona, zn.Nombre 
	order by p.IdZona,p.IdEstado


ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                    ���                              X   %   /      �  )   W          �  U  
  �  � U  SETEO� %�C��  ��� � T��  ���� � %�C�� ���@ � T�� ���� � %�C�� ���b � T�� ���� �	 M(� �� �  �1 �+ 	Declare @Empresa char(3),@dFecha datetime,�~ �x 			@hFecha datetime, @NroGuia varchar(20), @NroLote varchar(20), @IdCliente varchar(10),@IdZona char(5), @Estado char(5)� �  �� �� 	Select @Empresa=?oApp.Empresa, @dFecha=?m.dFecha, @hFecha =?m.hFecha, @NroLote=?nroLote, @IdZona=?m.Zona, @Estado = ?m.EstadoGuia   � �  �. �( SELECT  count(*) Cantidad, p.IdEstado,  �4 �. 	st.Nombre AS Estado, p.IdZona, zn.Nombre Zona� � 	FROM  cgr_Paquete AS p �u �o 	LEFT OUTER JOIN cgr_Datos AS st ON p.IdEstado = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'ST'�w �q 	LEFT OUTER JOIN cgr_Datos AS md ON p.IdMotivo = md.Codigo AND p.IdEmpresa = md.IdEmpresa and md.IdTabla = 'MD'  �� �� 	LEFT OUTER JOIN cgr_Datos AS zn ON p.IdZona = zn.Codigo AND p.IdEmpresa = zn.IdEmpresa and zn.IdTabla = 'ZN'                       �= �7 	where (p.IdCliente = @IdCliente or @IdCliente is null)�I �C 	--and e.IdEmpresa=@Empresa and e.Fecha between @dFecha and @hFecha�1 �+ 	--and (p.NroLote = @NroLote or @NroLote=0)�2 �, 	and (p.IdZona = @IdZona or @IdZona is null)�4 �. 	and (p.IdEstado = @Estado or @Estado is null)�! � 	and p.IdEmpresa = @Empresa�2 �, 	and p.FechaIng between @dFecha and @hFecha � � 		group by p.IdEstado,  �' �! 	st.Nombre , p.IdZona, zn.Nombre �# � 	order by p.IdZona,p.IdEstado� �  � �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE
 ESTADOGUIA ZONA CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � A � A � a �a �a �A�Qq���!A!�q1a a A bq 3                       &         A   �      )                                                  