   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Paquetes Entregados"                                         Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,Estado                                               Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         "Recibido por"                                                Arial                                                         RecibidoPor, '-' + CIRecibido                                 Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              zPROCEDURE Init
IF EMPTY(m.IdCliente)
	m.Idcliente = null
ENDIF
	

TEXT TO cmdSQL noshow
	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, 
	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero
	FROM            cgr_Datos AS st INNER JOIN
	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa 
	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente
							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN
	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN
	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      
	WHERE        (st.IdTabla = 'ST')
	and e.IdEstado = 'ST003'
	and r.Operacion='R'
	and p.IdEmpresa = ?oApp.Empresa
	and r.Fecha between ?m.dFecha and ?m.hFecha
	and (p.IdCliente = ?m.IdCliente or ?m.Idcliente is null)
	order by p.IdCliente, 1,p.NroGuia  
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                                                   r���    Y  Y                        k   %   �            �          �  U  > %�C��  ��� � T��  ���� �	 M(� ��� �� 	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �x �r 				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, �L �F 	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero�1 �+ 	FROM            cgr_Datos AS st INNER JOIN�j �d 	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa �y �s 	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente�j �d 							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�� �� 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      �' �! 	WHERE        (st.IdTabla = 'ST')� � 	and e.IdEstado = 'ST003'� � 	and r.Operacion='R'�& �  	and p.IdEmpresa = ?oApp.Empresa�2 �, 	and r.Fecha between ?m.dFecha and ?m.hFecha�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.Idcliente is null)�* �$ 	order by p.IdCliente, 1,p.NroGuia  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � A � q	������qq��a!��A bq 4 q 2                       >        e  o      )   Y                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Paquetes Entregados"                                         Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,Estado                                               Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         "Recibido por"                                                Arial                                                         RecibidoPor, '-' + CIRecibido                                 Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              zPROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.IdCliente)
	m.Idcliente = null
ENDIF
	

TEXT TO cmdSQL noshow
	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, 
				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, 
	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero
	FROM            cgr_Datos AS st INNER JOIN
	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa 
	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente
							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN
	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN
	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      
	WHERE        (st.IdTabla = 'ST')
	and e.IdEstado = 'ST003'
	and r.Operacion='R'
	and p.IdEmpresa = ?oApp.Empresa
	and r.Fecha between ?m.dFecha and ?m.hFecha
	and (p.IdCliente = ?m.IdCliente or ?m.Idcliente is null)
	order by p.IdCliente, 1,p.NroGuia  
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                                                                   r���    Y  Y                        k   %   �            �          �  U  
  �  � U  SETEO> %�C��  ��� � T��  ���� �	 M(� ��� �� 	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �x �r 				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, �L �F 	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero�1 �+ 	FROM            cgr_Datos AS st INNER JOIN�j �d 	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa �y �s 	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente�j �d 							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�� �� 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      �' �! 	WHERE        (st.IdTabla = 'ST')� � 	and e.IdEstado = 'ST003'� � 	and r.Operacion='R'�& �  	and p.IdEmpresa = ?oApp.Empresa�2 �, 	and r.Fecha between ?m.dFecha and ?m.hFecha�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.Idcliente is null)�* �$ 	order by p.IdCliente, 1,p.NroGuia  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � q	������qq��a!��A bq 3                       &         A   o      )   Y                        