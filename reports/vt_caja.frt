   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=9
COLOR=2
ice Document Image       `Top = 75
Left = 208
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                              dataenvironment                                               Arial                                                         Arial                                                         Arial                                                         Usuario                                                       "Reporte de Caja"                                             Arial                                                         Fecha                                                         Arial                                                         ""                                                           Arial                                                         	"Cierre"                                                     Arial                                                         Ingreso                                                       "99,999,999"                                                  Arial                                                         "Fecha"                                                       Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha, ' al ' ,m.hfecha                                                                                                  Arial                                                         	"Ventas"                                                     Arial                                                         "Diferencia"                                                 "@I"                                                          Arial                                                         "Totales:"                                                   Arial                                                         "Hora Inicio"                                                 Arial                                                         
"Hora Fin"                                                    Arial                                                         
"Entrada"                                                    Arial                                                         	"Salida"                                                     Arial                                                         Egresos                                                       "99,999,999"                                                  Arial                                                         Cierre                                                        "99,999,999"                                                  Arial                                                         Contado                                                       "99,999,999"                                                  Arial                                                         8(Egresos + Cierre) - (Contado + Ingreso + nvl(Cobros,0))      "99,999,999"                                                  Arial                                                         IdUsuario,Usuario                                             Arial                                                         Inicio                                                        Arial                                                         Fin                                                           Arial                                                         
"Contado"                                                    Arial                                                         	"Credito"                                                     Arial                                                         Credito                                                       "99,999,999"                                                  Arial                                                         "Total"                                                       Arial                                                         Credito + Contado                                             "99,999,999"                                                  Arial                                                         "Cobros"                                                      Arial                                                         Cobros                                                        "99,999,999"                                                  Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                        �PROCEDURE Init


IF EMPTY(m.Usuario)
	m.Usuario= null
ENDIF


TEXT TO cmdSQL NOSHOW 

SELECT     c.IdCaja, c.IdUsuario, c.Fecha, c.Inicio, c.Fin, c.Estado, c.Obs, 
						SUM(CASE WHEN Operacion = 'I' THEN d .Importe ELSE 0 END) AS Ingreso, 
                      SUM(CASE WHEN Operacion = 'E' THEN d .Importe ELSE 0 END) AS Egresos, 
                      SUM(CASE WHEN Operacion = 'C' THEN d .Importe ELSE 0 END) AS Cierre, 
                          (SELECT     ISNULL(SUM(ISNULL(Exenta, 0) + ISNULL(Gravada, 0) + ISNULL(Iva, 0)),0) AS Expr1
                            FROM          vt_factura v inner join vt_condicion vc on v.IdEmpresa = vc.IdEmpresa and v.IdCondicion = vc.IdCondicion 
                            WHERE      (IdHabilitacion = c.IdCaja) and Plazo = 0 ) AS Contado, 
							(SELECT     ISNULL(SUM(ISNULL(Exenta, 0) + ISNULL(Gravada, 0) + ISNULL(Iva, 0)),0) AS Expr1
                            FROM          vt_factura v inner join vt_condicion vc on v.IdEmpresa = vc.IdEmpresa and v.IdCondicion = vc.IdCondicion 
                            WHERE      (IdHabilitacion = c.IdCaja) and Plazo > 0 ) AS Credito,
							(Select SUM(TotalValores) from vt_pagos where IdOrdenPago=c.IdCaja) as Cobros,                                                        
                            Usuario = RTRIM(u.last_name) + ' ' + u.first_name
FROM         vt_caja AS c INNER JOIN
                      vt_CajaDet AS d ON c.IdCaja = d.IdCaja INNER JOIN
                      usuarios AS u ON c.IdUsuario COLLATE SQL_Latin1_General_CP1_CI_AS = u.employee_id
where c.Fecha between ?m.Dfecha  and ?m.hFecha
and c.IdEmpresa=?oApp.Empresa
and (c.IdUsuario = ?m.Usuario or ?m.Usuario is null) 
and c.Estado='C'
GROUP BY c.IdUsuario, c.Fecha, c.Inicio, c.Fin, c.Estado, c.Obs,  c.IdCaja, u.last_name, u.first_name
order by c.IdUsuario, c.Inicio

ENDTEXT

sql(cmdSQL,'rlnegocio')

SELECT rlnegocio

ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                                    ����    �  �                        >H   %         x  "   4          �  U  � %�C��  ��� � T��  ���� �	 M(� �� �  �S �M SELECT     c.IdCaja, c.IdUsuario, c.Fecha, c.Inicio, c.Fin, c.Estado, c.Obs, �R �L 						SUM(CASE WHEN Operacion = 'I' THEN d .Importe ELSE 0 END) AS Ingreso, �b �\                       SUM(CASE WHEN Operacion = 'E' THEN d .Importe ELSE 0 END) AS Egresos, �a �[                       SUM(CASE WHEN Operacion = 'C' THEN d .Importe ELSE 0 END) AS Cierre, �{ �u                           (SELECT     ISNULL(SUM(ISNULL(Exenta, 0) + ISNULL(Gravada, 0) + ISNULL(Iva, 0)),0) AS Expr1�� ��                             FROM          vt_factura v inner join vt_condicion vc on v.IdEmpresa = vc.IdEmpresa and v.IdCondicion = vc.IdCondicion �e �_                             WHERE      (IdHabilitacion = c.IdCaja) and Plazo = 0 ) AS Contado, �h �b 							(SELECT     ISNULL(SUM(ISNULL(Exenta, 0) + ISNULL(Gravada, 0) + ISNULL(Iva, 0)),0) AS Expr1�� ��                             FROM          vt_factura v inner join vt_condicion vc on v.IdEmpresa = vc.IdEmpresa and v.IdCondicion = vc.IdCondicion �d �^                             WHERE      (IdHabilitacion = c.IdCaja) and Plazo > 0 ) AS Credito,�� �� 							(Select SUM(TotalValores) from vt_pagos where IdOrdenPago=c.IdCaja) as Cobros,                                                        �S �M                             Usuario = RTRIM(u.last_name) + ' ' + u.first_name�* �$ FROM         vt_caja AS c INNER JOIN�M �G                       vt_CajaDet AS d ON c.IdCaja = d.IdCaja INNER JOIN�m �g                       usuarios AS u ON c.IdUsuario COLLATE SQL_Latin1_General_CP1_CI_AS = u.employee_id�4 �. where c.Fecha between ?m.Dfecha  and ?m.hFecha�# � and c.IdEmpresa=?oApp.Empresa�; �5 and (c.IdUsuario = ?m.Usuario or ?m.Usuario is null) � � and c.Estado='C'�k �e GROUP BY c.IdUsuario, c.Fecha, c.Inicio, c.Fin, c.Estado, c.Obs,  c.IdCaja, u.last_name, u.first_name�$ � order by c.IdUsuario, c.Inicio� �  � � ��C � �	 rlnegocio� �� F� � U  USUARIO CMDSQL SQL	 RLNEGOCIO
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � A � a 1!!��	Q��	A1	1���A1�a�Aa A �r 3 q 2                       �         �  �  (    )   �                                