   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              HORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2970
PAPERWIDTH=2100
COLOR=2
                                                      Arial                                                         "Movimientos de Stock"                                                                                                      Arial                                                         "Comprobante:"                                                Arial                                                         ""                                                           Arial                                                         cantidad                                                      "@Z 999,999.99"                                                                                                             Arial                                                         alltrim( oApp.Nombreempresa )                                                                                               Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Fecha:"                                                      Arial                                                         "Dep�sito Salida:"                                            Arial                                                         IdDeposito_Sal,Deposito_Sal                                   Arial                                                         "Cantidad "                                                   Arial                                                         fecha                                                                                                                       Arial                                                         $IdComprobante,'-',descripcion,numero                          Arial                                                         
referencia                                                                                                                  Arial                                                         "Costo"                                                       Arial                                                         	costo_pro                                                     "@Z 999,999,999.99"                                                                                                         Arial                                                         &alltrim(Idproducto) + " - " + producto                        Arial                                                         
"Producto"                                                    Arial                                                         cantidad*costo_pro                                            "999,999,999.99"                                                                                                            Arial                                                         "Total"                                                       Arial                                                         "Total "                                                      Arial                                                         cantidad*costo_pro                                            "999,999,999.99"                                                                                                            Arial                                                         "Dep�sito Entrada:"                                           Arial                                                         IdDeposito_Ent,Deposito                                       Arial                                                         "Referencia:"                                                 Arial                                                         "U.M."                                                        Arial                                                         unidad                                                                                                                      Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             	�PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
TEXT TO CMDSQL NOSHOW
SELECT     md.IdComprobante, c.Descripcion, m.numero, m.fecha, md.IdDeposito_Ent, m.nro_ref, dp.Deposito, md.IdDeposito_Sal, d.Deposito AS deposito_sal, m.referencia, 
                      md.IdProducto, p.Descripcion AS Producto, p.Unidad, md.Cantidad, p.Catalogo,md.Precio as Costo_pro
FROM         st_movimiento_Det AS md INNER JOIN
                      st_movimiento AS m ON md.IdMovimiento = m.idmovimiento INNER JOIN
                      st_cpbt_stk AS c ON m.idempresa = c.IdEmpresa AND m.IdComprobante = c.Cpbt_Stk LEFT OUTER JOIN
                      st_Producto AS p ON md.IdEmpresa = p.IdEmpresa AND md.IdProducto = p.IdProducto LEFT OUTER JOIN
                      st_Depositos AS dp ON md.IdDeposito_Ent = dp.IdDeposito AND md.IdEmpresa = dp.IdEmpresa LEFT OUTER JOIN
                      st_Depositos AS d ON md.IdDeposito_Sal = d.IdDeposito AND md.IdEmpresa = d.IdEmpresa	
            WHERE m.idempresa = ?oapp.empresa 
			AND m.IdComprobante = ?m.cpbt_stk 
			AND m.numero = ?m.numero 
ENDTEXT

sql(cmdsql, "consulta")
SELECT CONSULTA


*!*	SELECT fa_detfactu.producto, ;
*!*		st_movimiento_base.fecha, precio, costo_pro, fa_detfactu.deposito_ent, ;
*!*		fa_detfactu.deposito, fa_detfactu.cpbt_stk AS comprob, ;
*!*		fa_detfactu.n�mero AS numero, referencia, fa_detfactu.cantidad, iddetalle ;
*!*	FROM datos!fa_detfactu INNER JOIN datos!st_movimiento_base ;
*!*		ON fa_detfactu.idfactura = st_movimiento_base.idmovimiento ;
*!*	WHERE st_movimiento_base.idempresa = oapp.empresa ;
*!*		AND fa_detfactu.idempresa = oapp.empresa ;
*!*		AND fa_detfactu.cpbt_stk = m.cpbt_stk ;
*!*		AND fa_detfactu.n�mero = m.numero ;
*!*	INTO CURSOR SALDO_STOCK

*!*	SELECT deposito ;
*!*	FROM datos!st_deposito ;
*!*	WHERE saldo_stock.deposito = iddeposito ;
*!*	INTO CURSOR xdeposito

*!*	SELECT deposito ;
*!*	FROM datos!st_deposito ;
*!*	WHERE saldo_stock.deposito_ent = iddeposito ;
*!*	INTO CURSOR xdeposito_ent

*!*	SELECT descripcion, idcpbt_stk ;
*!*	FROM datos!st_cpbt_stk_base ;
*!*	WHERE m.cpbt_stk = idcpbt_stk AND idempresa = oapp.empresa ;
*!*	INTO CURSOR xComprob

*!*	SELECT ss.*, st_producto.descripcion, st_producto.unidad ;
*!*	FROM saldo_stock ss INNER JOIN datos!st_producto ON ss.producto = st_producto.idproducto ;
*!*	WHERE st_producto.idempresa = oapp.empresa ORDER BY iddetalle INTO CURSOR saldos

ENDPROC
                     u���    \  \                        �   %   �           �          �  U  
  �  � U  SETEOW	 M(�  ��� �� SELECT     md.IdComprobante, c.Descripcion, m.numero, m.fecha, md.IdDeposito_Ent, m.nro_ref, dp.Deposito, md.IdDeposito_Sal, d.Deposito AS deposito_sal, m.referencia, �~ �x                       md.IdProducto, p.Descripcion AS Producto, p.Unidad, md.Cantidad, p.Catalogo,md.Precio as Costo_pro�5 �/ FROM         st_movimiento_Det AS md INNER JOIN�] �W                       st_movimiento AS m ON md.IdMovimiento = m.idmovimiento INNER JOIN�z �t                       st_cpbt_stk AS c ON m.idempresa = c.IdEmpresa AND m.IdComprobante = c.Cpbt_Stk LEFT OUTER JOIN�{ �u                       st_Producto AS p ON md.IdEmpresa = p.IdEmpresa AND md.IdProducto = p.IdProducto LEFT OUTER JOIN�� �}                       st_Depositos AS dp ON md.IdDeposito_Ent = dp.IdDeposito AND md.IdEmpresa = dp.IdEmpresa LEFT OUTER JOIN�q �k                       st_Depositos AS d ON md.IdDeposito_Sal = d.IdDeposito AND md.IdEmpresa = d.IdEmpresa	�4 �.             WHERE m.idempresa = ?oapp.empresa �+ �% 			AND m.IdComprobante = ?m.cpbt_stk �" � 			AND m.numero = ?m.numero � � ��C �  � consulta� �� F� � U  CMDSQL SQL CONSULTA BeforeOpenTables,     �� InitA     ��1 q 3 � �
�Q���1A�!A �q 1                       &         A   �	      )   \                  )+ 