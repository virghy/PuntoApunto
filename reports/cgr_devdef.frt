   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
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
                                                                  G  /  winspool  HP Deskjet 1000 J110 series  USB001                                                                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Devoluci�n Definitiva"                                       Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,' ',Motivo                                           ""                                                            Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
TEXT TO cmdSQL noshow
SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt,
                         p.CIRecibido, p.IdMotivo, p.Obs, r.MemoPara RecibidoPor 						
FROM            vt_clientes AS cl INNER JOIN
                         cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'
						 left join cgr_Rutas r on p.IdRuta = r.IdRuta
WHERE        p.IdEstado='ST006'
and p.IdEmpresa = ?oApp.Empresa
and p.FechaEnt between ?m.dFecha and ?m.hFecha
and p.IdCliente = ?m.IdCliente 
and (p.NroLote =convert(varchar(20),?m.NroLote) or ?m.NroLote=0)
 
order by 1,p.NroGuia                      
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                              ���    �  �                        p   %   J      �     r          �  U  
  �  � U  SETEO�	 M(�  ��� �� SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �A �; st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt,�] �W                          p.CIRecibido, p.IdMotivo, p.Obs, r.MemoPara RecibidoPor 						�2 �, FROM            vt_clientes AS cl INNER JOIN�| �v                          cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'�9 �3 						 left join cgr_Rutas r on p.IdRuta = r.IdRuta�% � WHERE        p.IdEstado='ST006'�% � and p.IdEmpresa = ?oApp.Empresa�4 �. and p.FechaEnt between ?m.dFecha and ?m.hFecha�% � and p.IdCliente = ?m.IdCliente �F �@ and (p.NroLote =convert(varchar(20),?m.NroLote) or ?m.NroLote=0)� �  �0 �* order by 1,p.NroGuia                      � � ��C �  � cRuta� �� F� � U  CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � !
�!���QQAQaq A bq 3                       &         A         )   �                                                                �DRIVER=winspool
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
                                                                  G  /  winspool  HP Deskjet 1000 J110 series  USB001                                                                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Devoluci�n Definitiva"                                       Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,' ',Motivo                                           ""                                                            Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              PROCEDURE Init
TEXT TO cmdSQL noshow
SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt,
                         p.CIRecibido, p.IdMotivo, p.Obs, r.MemoPara RecibidoPor 						
FROM            vt_clientes AS cl INNER JOIN
                         cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'
						 left join cgr_Rutas r on p.IdRuta = r.IdRuta
WHERE        p.IdEstado='ST006'
and p.IdEmpresa = ?oApp.Empresa
and p.FechaEnt between ?m.dFecha and ?m.hFecha
and p.IdCliente = ?m.IdCliente 
and (p.NroLote =convert(varchar(20),?m.NroLote) or ?m.NroLote=0)
 
order by 1,p.NroGuia                      
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                              ���    �  �                        p   %   J      �     r          �  U  �	 M(�  ��� �� SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �A �; st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt,�] �W                          p.CIRecibido, p.IdMotivo, p.Obs, r.MemoPara RecibidoPor 						�2 �, FROM            vt_clientes AS cl INNER JOIN�| �v                          cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'�9 �3 						 left join cgr_Rutas r on p.IdRuta = r.IdRuta�% � WHERE        p.IdEstado='ST006'�% � and p.IdEmpresa = ?oApp.Empresa�4 �. and p.FechaEnt between ?m.dFecha and ?m.hFecha�% � and p.IdCliente = ?m.IdCliente �F �@ and (p.NroLote =convert(varchar(20),?m.NroLote) or ?m.NroLote=0)� �  �0 �* order by 1,p.NroGuia                      � � ��C �  � cRuta� �� F� � U  CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables5    ��1 � !
�!���QQAQaq A bq 4 q 2                       �        
        )   �                                                          