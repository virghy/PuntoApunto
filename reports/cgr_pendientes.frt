   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         "Periodo Ingreso:"                                            Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Paquetes Pendientes"                                         Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1, ' ' + Motivo                                        Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         "Periodo Evento:"                                             Arial                                                         m.dfechaev,' - ', m.hfechaev                                  "@D"                                                          Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
TEXT TO cmdSQL noshow
SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt, p.RecibidoPor, 
                         p.CIRecibido, p.IdMotivo, p.Obs
FROM            vt_clientes AS cl INNER JOIN
                         cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'
WHERE        p.IdEstado='ST001'
and p.IdEmpresa = ?oApp.Empresa
and p.FechaIng between ?m.dFecha and ?m.hFecha
and (p.FechaEnt between ?m.dFechaev and ?m.hFechaev or p.FechaEnt is null)
and p.IdCliente = ?m.IdCliente
and (p.NroLote = ?m.NroLote or ?m.NroLote = 0)  
order by 1,p.NroGuia                      
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                                          ����    �  �                           %   :      �     b          �  U  
  �  � U  SETEO�	 M(�  ��� �� SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �Q �K st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt, p.RecibidoPor, �> �8                          p.CIRecibido, p.IdMotivo, p.Obs�2 �, FROM            vt_clientes AS cl INNER JOIN�| �v                          cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'�% � WHERE        p.IdEstado='ST001'�% � and p.IdEmpresa = ?oApp.Empresa�4 �. and p.FechaIng between ?m.dFecha and ?m.hFecha�P �J and (p.FechaEnt between ?m.dFechaev and ?m.hFechaev or p.FechaEnt is null)�$ � and p.IdCliente = ?m.IdCliente�6 �0 and (p.NroLote = ?m.NroLote or ?m.NroLote = 0)  �0 �* order by 1,p.NroGuia                      � � ��C �  � cRuta� �� F� � U  CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � !
�!��QQAAaA bq 3                       &         A         )   �                                                                                  %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         "Periodo Ingreso:"                                            Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Paquetes Pendientes"                                         Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1, ' ' + Motivo                                        Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         "Periodo Evento:"                                             Arial                                                         m.dfechaev,' - ', m.hfechaev                                  "@D"                                                          Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              PROCEDURE Init
TEXT TO cmdSQL noshow
SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt, p.RecibidoPor, 
                         p.CIRecibido, p.IdMotivo, p.Obs
FROM            vt_clientes AS cl INNER JOIN
                         cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN
                         cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'
WHERE        p.IdEstado='ST001'
and p.IdEmpresa = ?oApp.Empresa
and p.FechaIng between ?m.dFecha and ?m.hFecha
and (p.FechaEnt between ?m.dFechaev and ?m.hFechaev or p.FechaEnt is null)
and p.IdCliente = ?m.IdCliente
and (p.NroLote = ?m.NroLote or ?m.NroLote = 0)  
order by 1,p.NroGuia                      
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                          ����    �  �                           %   :      �     b          �  U  �	 M(�  ��� �� SELECT        p.NroGuia1, p.NroGuia, p.IdEstado, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �Q �K st.Nombre AS Motivo, p.IdCliente, cl.RazSocial, p.FechaEnt, p.RecibidoPor, �> �8                          p.CIRecibido, p.IdMotivo, p.Obs�2 �, FROM            vt_clientes AS cl INNER JOIN�| �v                          cgr_Paquete AS p ON cl.IdEmpresa = p.IdEmpresa AND cl.IdCliente = p.IdCliente LEFT OUTER JOIN�} �w                          cgr_Datos AS st ON p.IdMotivo = st.Codigo AND p.IdEmpresa = st.IdEmpresa and st.IdTabla = 'MD'�% � WHERE        p.IdEstado='ST001'�% � and p.IdEmpresa = ?oApp.Empresa�4 �. and p.FechaIng between ?m.dFecha and ?m.hFecha�P �J and (p.FechaEnt between ?m.dFechaev and ?m.hFechaev or p.FechaEnt is null)�$ � and p.IdCliente = ?m.IdCliente�6 �0 and (p.NroLote = ?m.NroLote or ?m.NroLote = 0)  �0 �* order by 1,p.NroGuia                      � � ��C �  � cRuta� �� F� � U  CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables%    ��1 � !
�!��QQAAaA bq 4 q 2                       �        �        )   �                                                                            