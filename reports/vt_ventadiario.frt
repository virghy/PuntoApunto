   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
PUT=PrimoPort:
ORI      `Top = 75
Left = 208
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                              dataenvironment                                               Arial                                                         Arial                                                         "Ventas Promedio Diario"                                                                                                    Arial                                                         
day(fecha)                                                                                                                  Arial                                                         ""                                                           Arial                                                         "Cantidad"                                                   Arial                                                         rlnegocio.cant                                                "999,999.99"                                                  Arial                                                         "Dia"                                                         Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha, ' al ' ,m.hfecha                                                                                                  Arial                                                         "Costo"                                                      Arial                                                         " Total Venta"                                               "@I"                                                          Arial                                                         "Ratio"                                                      "@I"                                                          Arial                                                         rlnegocio.costo                                               "999,999,999"                                                 Arial                                                         rlnegocio.total                                               "999,999,999"                                                 Arial                                                         (round(rlnegocio.costo/rlnegocio.total,2)                      "99,999.99"                                                                                                                 Arial                                                         "Totales:"                                                   Arial                                                         rlnegocio.cant                                                "99,999,999.99"                                               Arial                                                         rlnegocio.costo                                               "999,999,999"                                                                                                               Arial                                                         rlnegocio.total                                               "999,999,999"                                                                                                               Arial                                                         round(vcosto/vtotal,2)                                        "99,999.99"                                                                                                                 Arial                                                         "Vendedor:"                                                   Arial                                                         .iif(isnull(m.idVendedor),'Todos',m.IdVendedor)                                                                              Arial                                                         
"Negocio:"                                                    Arial                                                         ,iif(isnull(m.IdNegocio),'Todos',m.IdNegocio)                                                                                Arial                                                         "Utilidad"                                                   "@I"                                                          Arial                                                         rlnegocio.total - costo                                       "999,999,999"                                                 Arial                                                         rlnegocio.total - costo                                       "999,999,999"                                                                                                               Arial                                                         "Fecha"                                                       Arial                                                         left(cdow(fecha),3)                                           "@!"                                                                                                                        Arial                                                         fecha                                                         "@D"                                                                                                                        Arial                                                         "Precio Prom."                                               Arial                                                         
total/cant                                                    "999,999,999"                                                 Arial                                                         
total/cant                                                    "999,999,999"                                                 Arial                                                         "Costo Prom."                                                Arial                                                         
costo/cant                                                    "9,999,999.99"                                                                                                              Arial                                                         
costo/cant                                                    "9,999,999.99"                                                                                                              Arial                                                         "Promedio:"                                                  Arial                                                         rlnegocio.cant                                                "99,999,999.99"                                                                                                             Arial                                                         rlnegocio.costo                                               "999,999,999"                                                                                                               Arial                                                         rlnegocio.total                                               "999,999,999"                                                                                                               Arial                                                         rlnegocio.total - costo                                       "999,999,999"                                                                                                               Arial                                                         acum                                                          cant                                                          0                                                             vtCosto                                                       rlnegocio.costo                                               0                                                             vtVenta                                                       rlnegocio.total                                               0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                        �PROCEDURE Destroy
RELEASE vtotal,vcosto
ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
PUBLIC vtotal,vcosto

IF EMPTY(m.idnegocio)
	m.idnegocio = null
ENDIF
	
IF EMPTY(m.idVendedor)
	m.IdVendedor = null
ENDIF


TEXT TO cSQL NOSHOW 
SELECT     vt.fecha, SUM(convert(decimal(12,2),det.Cantidad)) AS cant, SUM(convert(decimal(12,2),det.cantidad*det.Ult_Costo)) 
                      AS costo, SUM(convert(decimal(12,2),det.Importe)) AS total
FROM         dbo.vt_factura vt INNER JOIN
                      dbo.st_movimiento_Det det ON vt.IdFactura = det.IdFactura
where vt.idempresa=?oApp.empresa and  (vt.fecha between  ?m.dfecha and  ?m.hfecha )
	and (vt.IdVendedor = ?m.IdVendedor or ?m.idVendedor is null)
	and (vt.IdNegocio = ?m.IdNegocio or ?m.IdNegocio is null)
GROUP BY vt.Fecha
ORDER BY vt.fecha

ENDTEXT

sql(cSQL,'rlnegocio')
SELECT rlnegocio
sum total To vtotal
Sum costo To vcosto

*!*	IF lcDestino =  'A'
*!*		DO exportar
*!*	ENDIF
*!*		
ENDPROC
                                                                ����    �  �                        �   %   �      -     �          �  U    <�  � � U  VTOTAL VCOSTO
  �  � U  SETEO 7�  � � %�C�� ���) � T�� ���� � %�C�� ���K � T�� ���� �	 M(� ��� �~ SELECT     vt.fecha, SUM(convert(decimal(12,2),det.Cantidad)) AS cant, SUM(convert(decimal(12,2),det.cantidad*det.Ult_Costo)) �V �P                       AS costo, SUM(convert(decimal(12,2),det.Importe)) AS total�/ �) FROM         dbo.vt_factura vt INNER JOIN�U �O                       dbo.st_movimiento_Det det ON vt.IdFactura = det.IdFactura�Y �S where vt.idempresa=?oApp.empresa and  (vt.fecha between  ?m.dfecha and  ?m.hfecha )�C �= 	and (vt.IdVendedor = ?m.IdVendedor or ?m.idVendedor is null)�@ �: 	and (vt.IdNegocio = ?m.IdNegocio or ?m.IdNegocio is null)� � GROUP BY vt.Fecha� � ORDER BY vt.fecha� �  � � ��C � �	 rlnegocio� �� F� � K(�  �� �� K(� �� �� U	  VTOTAL VCOSTO	 IDNEGOCIO
 IDVENDEDOR CSQL SQL	 RLNEGOCIO TOTAL COSTO Destroy,     �� BeforeOpenTablesN     �� Initc     ��1 � 2 q 3 � � A � A � Aa�Q�1qqa A �q � � 6                       (         O   Y         t   �      )   �                  sa = pre.