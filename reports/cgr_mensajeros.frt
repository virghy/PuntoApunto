   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdMensajero                                                   "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         #"Paquetes Entregados por Mensajero"                           Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,Estado                                               Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total General"                                              Arial                                                         NroGuia                                                       Arial                                                         "Recibido por"                                                Arial                                                         RecibidoPor, '-' + CIRecibido                                 Arial                                                         IdMensajero,Mensajero                                         Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
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
		m.IDCliente = null
ENDIF

IF EMPTY(m.IdMensajero)
		m.IdMensajero = null
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
	and r.Fecha between ?m.dFecha and ?m.hFecha
	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)
	and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) 
	order by r.IdMensajero, r.Fecha, 1,p.NroGuia                      

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                                                                    ����    �  �                        �   %         �      D          �  U  
  �  � U  SETEO� %�C��  ��� � T��  ���� � %�C�� ���@ � T�� ���� �	 M(� �� �  �� �� 	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �x �r 				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, �L �F 	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero�1 �+ 	FROM            cgr_Datos AS st INNER JOIN�j �d 	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa �y �s 	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente�j �d 							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�� �� 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      �' �! 	WHERE        (st.IdTabla = 'ST')� � 	and e.IdEstado = 'ST003'� � 	and r.Operacion='R'�2 �, 	and r.Fecha between ?m.dFecha and ?m.hFecha�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)�F �@ 	and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) �I �C 	order by r.IdMensajero, r.Fecha, 1,p.NroGuia                      � �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE IDMENSAJERO CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � A � a q	������qq��!�a�a A bq 3                       &         A   �      )   �                          %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdMensajero                                                   "Nro Guia Ref"                                               Arial                                                         
"Nro Guia"                                                    Arial                                                         
"Cliente:"                                                    Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         #"Paquetes Entregados por Mensajero"                           Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Nombre                                                        Arial                                                         NroGuia1,Estado                                               Arial                                                         NroGuia                                                       Arial                                                         FechaEnt                                                      "@D"                                                          Arial                                                         	"Nombre"                                                     Arial                                                         "Fecha"                                                      Arial                                                         "Total General"                                              Arial                                                         NroGuia                                                       Arial                                                         "Recibido por"                                                Arial                                                         RecibidoPor, '-' + CIRecibido                                 Arial                                                         IdMensajero,Mensajero                                         Arial                                                         "Total"                                                      Arial                                                         NroGuia                                                       Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              �PROCEDURE Init
IF EMPTY(m.IdCliente)
		m.IDCliente = null
ENDIF

IF EMPTY(m.IdMensajero)
		m.IdMensajero = null
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
	and r.Fecha between ?m.dFecha and ?m.hFecha
	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)
	and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) 
	order by r.IdMensajero, r.Fecha, 1,p.NroGuia                      

ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                                                    ����    �  �                        �   %         �      D          �  U  � %�C��  ��� � T��  ���� � %�C�� ���@ � T�� ���� �	 M(� �� �  �� �� 	SELECT        p.NroGuia1, p.NroGuia, p.Nombre, p.Direccion, p.FechaIng, p.Vence, p.IdPrioridad, p.NroDoc, p.Nombre1, p.NroDoc1, p.NroTarjetaCC, �x �r 				  st.Nombre AS Estado, p.IdCliente, cl.RazSocial, r.Fecha FechaEnt, e.Recibido RecibidoPor,  e.CI CIRecibido, �L �F 	              p.IdMotivo, p.Obs, m.IdMensajero, m.Nombre as Mensajero�1 �+ 	FROM            cgr_Datos AS st INNER JOIN�j �d 	                         cgr_Paquete AS p ON st.Codigo = p.IdEstado AND st.IdEmpresa = p.IdEmpresa �y �s 	                         INNER JOIN vt_clientes AS cl ON p.IdEmpresa = cl.IdEmpresa AND p.IdCliente = cl.IdCliente�j �d 							 INNER JOIN cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�� �� 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero                      �' �! 	WHERE        (st.IdTabla = 'ST')� � 	and e.IdEstado = 'ST003'� � 	and r.Operacion='R'�2 �, 	and r.Fecha between ?m.dFecha and ?m.hFecha�? �9 	and (p.IdCliente = ?m.IdCliente or ?m.IdCliente is null)�F �@ 	and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) �I �C 	order by r.IdMensajero, r.Fecha, 1,p.NroGuia                      � �  � � ��C � � cRuta� �� F� � U 	 IDCLIENTE IDMENSAJERO CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTables    ��1 � A � A � a q	������qq��!�a�a A bq 4 q 2                       �        �  �  %    )   �                    