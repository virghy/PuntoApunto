   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdMensajero                                                   "Fecha"                                                      Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Resumen de Productividad"                                    Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         "Recibido"                                                   Arial                                                         "Total General"                                              Arial                                                         Cantidad                                                      Arial                                                         IdMensajero,Mensajero                                         Arial                                                         "Total Mensajero"                                            Arial                                                         Cantidad                                                      Arial                                                         Cantidad                                                      Arial                                                         "Entregado"                                                  Arial                                                         	Entregado                                                     Arial                                                         	Entregado                                                     Arial                                                         	Entregado                                                     Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              OPROCEDURE Init

IF EMPTY(m.IdMensajero)
		m.IdMensajero = null
ENDIF
		

TEXT TO cmdSQL noshow

	SELECT        m.IdMensajero, m.Nombre as Mensajero, r.Fecha, COUNT(*) Cantidad,
	SUM(case when e.IdMotivo='MD50' then 1 else 0 end) as Entregado
	FROM            cgr_Paquete AS p INNER JOIN
	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN
	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN
	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero INNER JOIN
	                         cgr_Datos AS mt ON e.IdEmpresa = mt.IdEmpresa AND e.IdMotivo = mt.Codigo
							 where r.IdEmpresa=?oApp.Empresa 
							 and r.Fecha between ?m.dFecha and ?m.hFecha
							and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) 
	group by m.IdMensajero, m.Nombre, r.Fecha											 
	order by m.IdMensajero,r.Fecha					
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                              /���                              ��   %   e      �     �          �  U  � %�C��  ��� � T��  ���� �	 M(� �� �  �V �P 	SELECT        m.IdMensajero, m.Nombre as Mensajero, r.Fecha, COUNT(*) Cantidad,�F �@ 	SUM(case when e.IdMotivo='MD50' then 1 else 0 end) as Entregado�2 �, 	FROM            cgr_Paquete AS p INNER JOIN�q �k 	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�| �v 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero INNER JOIN�h �b 	                         cgr_Datos AS mt ON e.IdEmpresa = mt.IdEmpresa AND e.IdMotivo = mt.Codigo�. �( 							 where r.IdEmpresa=?oApp.Empresa �9 �3 							 and r.Fecha between ?m.dFecha and ?m.hFecha�L �F 							and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) �< �6 	group by m.IdMensajero, m.Nombre, r.Fecha											 �* �$ 	order by m.IdMensajero,r.Fecha					� � ��C � � cRuta� �� F� � U  IDMENSAJERO CMDSQL SQL CRUTA
  �  � U  SETEO Init,     �� BeforeOpenTablesP    ��1 � A � a aa!��������A bq 4 q 2                               :  D      )                                    %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         IdMensajero                                                   "Fecha"                                                      Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,' - ', m.hfecha                                      "@D"                                                          Arial                                                         "Resumen de Productividad"                                    Arial                                                         oApp.Nombreempresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         "Recibido"                                                   Arial                                                         "Total General"                                              Arial                                                         Cantidad                                                      Arial                                                         IdMensajero,Mensajero                                         Arial                                                         "Total Mensajero"                                            Arial                                                         Cantidad                                                      Arial                                                         Cantidad                                                      Arial                                                         "Entregado"                                                  Arial                                                         	Entregado                                                     Arial                                                         	Entregado                                                     Arial                                                         	Entregado                                                     Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              OPROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init

IF EMPTY(m.IdMensajero)
		m.IdMensajero = null
ENDIF
		

TEXT TO cmdSQL noshow

	SELECT        m.IdMensajero, m.Nombre as Mensajero, r.Fecha, COUNT(*) Cantidad,
	SUM(case when e.IdMotivo='MD50' then 1 else 0 end) as Entregado
	FROM            cgr_Paquete AS p INNER JOIN
	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN
	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN
	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero INNER JOIN
	                         cgr_Datos AS mt ON e.IdEmpresa = mt.IdEmpresa AND e.IdMotivo = mt.Codigo
							 where r.IdEmpresa=?oApp.Empresa 
							 and r.Fecha between ?m.dFecha and ?m.hFecha
							and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) 
	group by m.IdMensajero, m.Nombre, r.Fecha											 
	order by m.IdMensajero,r.Fecha					
ENDTEXT

sql(cmdSQL,'cRuta')
SELECT cRuta


ENDPROC
                                              /���                              ��   %   e      �     �          �  U  
  �  � U  SETEO� %�C��  ��� � T��  ���� �	 M(� �� �  �V �P 	SELECT        m.IdMensajero, m.Nombre as Mensajero, r.Fecha, COUNT(*) Cantidad,�F �@ 	SUM(case when e.IdMotivo='MD50' then 1 else 0 end) as Entregado�2 �, 	FROM            cgr_Paquete AS p INNER JOIN�q �k 	                         cgr_Evento AS e ON p.IdEmpresa = e.IdEmpresa AND p.NroGuia = e.NroGuia INNER JOIN�n �h 	                         cgr_Rutas AS r ON e.IdEmpresa = r.IdEmpresa AND e.IdRuta = r.IdRuta INNER JOIN�| �v 	                         cgr_Mensajero AS m ON r.IdEmpresa = m.IdEmpresa AND r.IdMensajero = m.IdMensajero INNER JOIN�h �b 	                         cgr_Datos AS mt ON e.IdEmpresa = mt.IdEmpresa AND e.IdMotivo = mt.Codigo�. �( 							 where r.IdEmpresa=?oApp.Empresa �9 �3 							 and r.Fecha between ?m.dFecha and ?m.hFecha�L �F 							and (r.IdMensajero = ?m.IdMensajero or ?m.IdMensajero is null) �< �6 	group by m.IdMensajero, m.Nombre, r.Fecha											 �* �$ 	order by m.IdMensajero,r.Fecha					� � ��C � � cRuta� �� F� � U  IDMENSAJERO CMDSQL SQL CRUTA BeforeOpenTables,     �� InitA     ��1 q 3 � A � a aa!��������A bq 3                       &         A   D      )                              