   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
                         Arial                                                         %"Comprobante de Entrega de Productos"                                                                                       Arial                                                         "Comprobante:"                                                Arial                                                         ""                                                           Arial                                                         cantidad                                                      "@Z 999,999.99"                                                                                                             Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Fecha:"                                                      Arial                                                         "Dep�sito Salida:"                                            Arial                                                         Iddeposito_sal,deposito_sal                                   Arial                                                         "Cantidad "                                                   Arial                                                         fecha                                                                                                                       Arial                                                         9descripcion,' ',idcomprobante+ " " + alltrim(str(numero))                                                                     Arial                                                         
referencia                                                                                                                  Arial                                                         "Precio Credito"                                                                                                            Arial                                                         Precio                                                        "@Z 999,999,999.99"                                                                                                         Arial                                                         <alltrim(idproducto) + " - " + alltrim(producto)," ",catalogo                                                                  Arial                                                         
"Producto"                                                    Arial                                                         cantidad*precio                                               "999,999,999.99"                                                                                                            Arial                                                         "Total"                                                       Arial                                                         "Total "                                                      Arial                                                         cantidad*precio                                               "999,999,999.99"                                                                                                            Arial                                                         "Dep�sito Entrada:"                                           Arial                                                         Iddeposito_ent,deposito                                       Arial                                                         "Referencia:"                                                 Arial                                                         "U.M."                                                        Arial                                                         unidad                                                                                                                      Arial                                                         "Entregado Por"                                               Arial                                                         "Autorizado Por"                                              Arial                                                         "Recibido Por"                                                Arial                                                         "Referencia:"                                                 Arial                                                         nro_ref                                                       Arial                                                         "..\bitmaps\logoyuty.jpg"                                     ConLogo="S"                                                   oApp.NombreEmpresa                                            Arial                                                         ConLogo="N"                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 440
Left = 181
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                            
�PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init


TEXT TO CMDSQL NOSHOW
	SELECT     md.IdComprobante, c.Descripcion, m.numero, m.fecha, md.IdDeposito_Ent, m.nro_ref, dp.Deposito, md.IdDeposito_Sal, d.Deposito AS deposito_sal, m.referencia, 
                      md.IdProducto, p.Descripcion AS Producto, p.Unidad, md.Cantidad, p.Catalogo,
 Precio=dbo.VT_TraerPrecio(?oApp.Empresa,md.IdProducto,?m.ListaPrecio)
FROM         st_movimiento_Det AS md INNER JOIN
                      st_movimiento AS m ON md.IdMovimiento = m.idmovimiento INNER JOIN
                      st_cpbt_stk AS c ON m.idempresa = c.IdEmpresa AND m.IdComprobante = c.Cpbt_Stk LEFT OUTER JOIN
                      st_Producto AS p ON md.IdEmpresa = p.IdEmpresa AND md.IdProducto = p.IdProducto LEFT OUTER JOIN
                      st_Depositos AS dp ON md.IdDeposito_Ent = dp.IdDeposito AND md.IdEmpresa = dp.IdEmpresa LEFT OUTER JOIN
                      st_Depositos AS d ON md.IdDeposito_Sal = d.IdDeposito AND md.IdEmpresa = d.IdEmpresa
	WHERE m.idempresa = ?oapp.empresa 
			AND m.idempresa = ?oapp.empresa 
			AND m.IdComprobante = ?m.cpbt_stk 
			AND m.numero = ?m.numero 
ENDTEXT

sql(cmdsql, "consulta")
SELECT CONSULTA




*!*		SELECT st_movimiento_det.idproducto,;
*!*			st_movimiento.fecha, costo_pro, st_movimiento_det.iddeposito_ent,; 
*!*			st_movimiento_det.iddeposito_sal, st_movimiento_det.idComprobante AS comprob,; 
*!*			st_movimiento_det.n�mero AS numero, st_movimiento.referencia, st_movimiento_det.cantidad, iddetalle; 
*!*		FROM st_movimiento_det INNER JOIN st_movimiento;
*!*			ON st_movimiento_det.idfactura = st_movimiento.idmovimiento; 
*!*		WHERE st_movimiento.idempresa = ?oapp.empresa ;
*!*			AND st_movimiento_det.idempresa = ?oapp.empresa ;
*!*			AND st_movimiento_det.idComprbante = ?m.cpbt_stk ;
*!*			AND st_movimiento_det.n�mero = ?m.numero ;
*!*		into cursor  SALDO_STOCK 
*!*		


*!*		SELECT deposito ;
*!*		FROM st_depositos;
*!*		WHERE saldo_stock.iddeposito_sal = iddeposito ;
*!*		INTO CURSOR XDEPOSITO


*!*		SELECT deposito ;
*!*		FROM st_depositos ;
*!*		WHERE saldo_stock.iddeposito_ent = iddeposito ;
*!*		INTO CURSOR  xdeposito_ent 


*!*		SELECT descripcion, cpbt_stk ;
*!*		FROM st_cpbt_stk ;
*!*		WHERE ?m.cpbt_stk = cpbt_stk AND idempresa = ?oapp.empresa ;
*!*		into cursor xComprob
*!*	 
*!*		SELECT ss.*, st_producto.descripcion, st_producto.unidad,p.Precio ;
*!*		FROM saldo_stock ss INNER JOIN st_producto ON ss.idproducto = st_producto.idproducto ;
*!*		LEFT JOIN vt_precios p ON ss.idproducto = p.IdProducto AND p.IdLista = "02" AND p.IdEmpresa = ?oApp.Empresa;
*!*		WHERE st_producto.idempresa = ?oapp.empresa ;
*!*		ORDER BY iddetalle into cursor saldos
ENDPROC
                                     ����    �  �                        ��   %         [     /          �  U  
  �  � U  SETEO�	 M(�  ��� �� 	SELECT     md.IdComprobante, c.Descripcion, m.numero, m.fecha, md.IdDeposito_Ent, m.nro_ref, dp.Deposito, md.IdDeposito_Sal, d.Deposito AS deposito_sal, m.referencia, �h �b                       md.IdProducto, p.Descripcion AS Producto, p.Unidad, md.Cantidad, p.Catalogo,�L �F  Precio=dbo.VT_TraerPrecio(?oApp.Empresa,md.IdProducto,?m.ListaPrecio)�5 �/ FROM         st_movimiento_Det AS md INNER JOIN�] �W                       st_movimiento AS m ON md.IdMovimiento = m.idmovimiento INNER JOIN�z �t                       st_cpbt_stk AS c ON m.idempresa = c.IdEmpresa AND m.IdComprobante = c.Cpbt_Stk LEFT OUTER JOIN�{ �u                       st_Producto AS p ON md.IdEmpresa = p.IdEmpresa AND md.IdProducto = p.IdProducto LEFT OUTER JOIN�� �}                       st_Depositos AS dp ON md.IdDeposito_Ent = dp.IdDeposito AND md.IdEmpresa = dp.IdEmpresa LEFT OUTER JOIN�p �j                       st_Depositos AS d ON md.IdDeposito_Sal = d.IdDeposito AND md.IdEmpresa = d.IdEmpresa�) �# 	WHERE m.idempresa = ?oapp.empresa �) �# 			AND m.idempresa = ?oapp.empresa �+ �% 			AND m.IdComprobante = ?m.cpbt_stk �" � 			AND m.numero = ?m.numero � � ��C �  � consulta� �� F� � U  CMDSQL SQL CONSULTA BeforeOpenTables,     �� InitA     ��1 q 3 � �
��Q���1���!A �q �1                       &         A   �
      )   �                  aCosto, �� �� 		                      prod.