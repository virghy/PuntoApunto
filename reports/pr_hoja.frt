  �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
                         Arial                                                         	"cVentas"                                                     
"cCompras"                                                    "cStock"                                                      "cTesor"                                                      Presupuesto                                                   "999,999,999,999"                                             Arial                                                         "Hoja de Proyecto Detallado"                                  Arial                                                         empresa                                                                                                                     Arial                                                         "Fecha Inicio"                                               Arial                                                         "Nro:"                                                        Arial                                                         	"Nombre:"                                                     Arial                                                         Nombre                                                        Arial                                                         Inicio                                                        Arial                                                         Descripcion                                                   Arial                                                         Nro                                                           Arial                                                         	"Importe"                                                     Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         "Presupuesto"                                                 Arial                                                         cCompras.FacturaProveedor                                     Arial                                                         cCompras.total                                                "999,999,999,999"                                             Arial                                                         "Compras y Gastos:"                                           Arial                                                         7cCompras.IdProveedor,cCompras.Razon,cCompras.Referencia       Arial                                                         cCompras.Fecha                                                Arial                                                         cCompras.total                                                "999,999,999,999"                                             Arial                                                         /rtrim(cVentas.IdComprobante),' ',cVentas.Numero               Arial                                                         cVentas.totalFactura                                          "999,999,999,999"                                             Arial                                                         #cVentas.Idcliente,cVentas.RazSocial                           Arial                                                         cVentas.Fecha                                                 Arial                                                         cVentas.Saldo                                                 "999,999,999,999"                                             Arial                                                         "Facturaciones:"                                              Arial                                                         cCompras.Saldo                                                "999,999,999,999"                                             Arial                                                         "Tesorer�a:"                                                  Arial                                                         cTesor.NroCuenta,cTesor.Nombre                                Arial                                                         cTesor.Debito                                                 "999,999,999,999"                                             Arial                                                         "cTesor.referencia,cTesor.Nrocheque                            Arial                                                         cTesor.Fecha                                                  Arial                                                         cTesor.credito                                                "999,999,999,999"                                             Arial                                                         cCompras.Saldo                                                "999,999,999,999"                                             Arial                                                         cVentas.totalFactura                                          "999,999,999,999"                                             Arial                                                         cVentas.Saldo                                                 "999,999,999,999"                                             Arial                                                         cTesor.Debito                                                 "999,999,999,999"                                             Arial                                                         cTesor.credito                                                "999,999,999,999"                                             Arial                                                         "Saldo"                                                       Arial                                                         	"Importe"                                                     Arial                                                         "Saldo"                                                       Arial                                                         "Debito"                                                      Arial                                                         	"Credito"                                                     Arial                                                         "Nro"                                                         Arial                                                         "Nro Factura"                                                 Arial                                                         "Referencia"                                                  Arial                                                         "Referencia"                                                  Arial                                                         "Cuenta"                                                      Arial                                                         "Referencia"                                                  Arial                                                         	"Cobrado"                                                     Arial                                                         $cVentas.totalFactura - cVentas.Saldo                          "999,999,999,999"                                             Arial                                                         "Saldo"                                                       Arial                                                          (cCompras.total- cCompras.Saldo)                              "999,999,999,999"                                             Arial                                                         "Saldo"                                                       Arial                                                         cTesor.Debito- cTesor.Credito                                 "999,999,999,999"                                             Arial                                                         "Resumen General"                                             Arial                                                         "Presupuestado:"                                              Arial                                                         "Facturado:"                                                  Arial                                                         
"Cobrado:"                                                    Arial                                                         
"Gastado:"                                                    Arial                                                         	"Pagado:"                                                     Arial                                                         tFactura + tCredito                                           "999,999,999,999.99"                                          Arial                                                         tCobrado + tCredito                                           "999,999,999,999.99"                                          Arial                                                         "Saldo:"                                                      Arial                                                         tSaldo                                                        "999,999,999,999.99"                                          Arial                                                         tCompra+ tDebito + tStock                                     "999,999,999,999.99"                                          Arial                                                         tPago+ tDebito                                                "999,999,999,999.99"                                          Arial                                                         tDeuda                                                        "999,999,999,999.99"                                          Arial                                                         "Saldo:"                                                      Arial                                                         "% Dif."                                                      Arial                                                         ^iif(tCompra+tDebito+tStock>0,(mton(tFactura+tCredito)/mton(tCompra+tDebito+tStock)*100)-100,0)                                "999.99"                                                      Arial                                                         Eiif(tPago>0,(mton(tCobrado+tCredito)/mton(tPago+ tDebito)*100)-100,0)                                                         "999.99"                                                      Arial                                                         3iif(tDeuda>0,(mton(tSaldo)/mton(tDeuda)*100)-100,0)           "999.99"                                                      Arial                                                         "Diferencia"                                                  Arial                                                         0(tFactura+ tCredito)-(tCompra+ tDebito + tStock)              "999,999,999,999.99"                                          Arial                                                         %(tCobrado+ tCredito)-(tPago+ tDebito)                         "999,999,999,999.99"                                          Arial                                                         tSaldo-tDeuda                                                 "999,999,999,999.99"                                          Arial                                                         Presupuesto                                                   "999,999,999,999"                                             Arial                                                         	"Totales"                                                     Arial                                                         	"Totales"                                                     Arial                                                         	"Totales"                                                     Arial                                                         IdCliente,RazSocial                                           Arial                                                         
"Cliente:"                                                    Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha," al ",m.hfecha                                      Arial                                                         	"Importe"                                                     Arial                                                         "Materiales:"                                                 Arial                                                         "Nro Operacion"                                               Arial                                                         "Referencia"                                                  Arial                                                         "cStock.IdComprobante,cStock.Numero                            Arial                                                         cStock.totalFactura                                           "999,999,999,999"                                             Arial                                                         cStock.notas                                                  Arial                                                         cStock.Fecha                                                  Arial                                                         cStock.totalFactura                                           "999,999,999,999"                                             Arial                                                         	"Totales"                                                     Arial                                                         tFactura                                                      cVentas.TotalFactura                                          0                                                             tCobrado                                                      "cVentas.TotalFactura-cVentas.Saldo                            0                                                             tSaldo                                                        cVentas.Saldo                                                 0                                                             tCompra                                                       cCompras.Total                                                0                                                             tPago                                                         cCompras.Total-cCompras.Saldo                                 0                                                             tDeuda                                                        cCompras.Saldo                                                0                                                             tBanco                                                        cTesor.Debito-cTesor.Credito                                  0                                                             tDebito                                                       cTesor.Debito                                                 0                                                             tCredito                                                      cTesor.Credito                                                0                                                             tStock                                                        cStock.TotalFactura                                           0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 250
Left = 202
Width = 519
Height = 254
InitialSelectedAlias = "rcheques"
DataSource = .NULL.
Name = "Dataenvironment"
                                                         aPROCEDURE Destroy
Release cTotal,cSaldo
ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
PUBLIC cTotal,cSaldo
TEXT TO cmdSQL
	SELECT     p.Nro, p.Fecha, p.IdCliente, p.Cliente, p.Nombre, p.Descripcion, p.Inicio, p.Fin, p.Estado, p.Localidad, p.Presupuesto, c.RazSocial
	FROM         pr_Proyecto AS p INNER JOIN
	                      vt_clientes AS c ON p.IdEmpresa = c.IdEmpresa AND p.IdCliente = c.IdCliente
					where p.IdEmpresa=?oApp.Empresa
					and Nro = ?m.NroProyecto                                            
ENDTEXT

=sql(cmdSQL,'cProy')
SELECT cProy 

TEXT TO cmdSQL NOSHOW 
SELECT     f.FacturaProveedor, p.Razon, f.IdProveedor, f.Fecha,f.Iva, 
Referencia=RTRIM(ISNULL(f.Referencia,'')) + case when IdMoneda<>'GS' then IdMoneda +' '+ Convert(char(10),f.Total) else '' end , Total=(f.Total*Cotizacion),NroProyecto,
Saldo = (Select isnull(sum(Saldo),0) from cp_Forma_Pago s where f.IdFactura=s.nrocomprob)*Cotizacion
FROM         cp_factura AS f INNER JOIN
                      cp_proveedor AS p ON f.IdEmpresa = p.IdEmpresa AND f.IdProveedor = p.IdProveedor
                      					where f.IdEmpresa=?oApp.Empresa
					and NroProyecto= ?m.NroProyecto 
					order by f.Fecha,f.FacturaProveedor   

ENDTEXT

=sql(cmdSQL,'cCompras')

TEXT TO cmdSQL NOSHOW 
SELECT     f.IdComprobante, f.Numero, f.Iva, f.IdCliente, c.RazSocial, f.Fecha, f.IdMoneda, f.TotalFactura, f.NroProyecto,
Saldo=(Select isnull(sum(Saldo),0) from vt_Forma_Pago s where f.IdFactura=s.IdFactura)
FROM         vt_factura AS f INNER JOIN
                      vt_clientes AS c ON f.IdEmpresa = c.IdEmpresa AND f.IdCliente = c.IdCliente
                      where f.IdEmpresa=?oApp.Empresa
					and NroProyecto= ?m.NroProyecto   
					order by f.Fecha,f.Numero

ENDTEXT

=sql(cmdSQL,'cVentas')


TEXT TO cmdSQL NOSHOW
SELECT     f.IdComprobante, f.NroRemision Numero, f.Fecha, f.IdMoneda, 
f.NroProyecto,convert(varchar(500),Notas) as Notas,
TotalFactura=(Select Sum(Cantidad*Costo_Pro) from st_Movimiento_det m where m.IdRemision=f.IdRemision)
FROM         os_remision AS f 
                      where f.IdEmpresa=?oapp.Empresa
					and NroProyecto= ?m.NroProyecto   
--and IdFactura is null 	&&VG 09/10/08  traer todas las remisiones
union
SELECT     f.IdComprobante, f.Numero, f.Fecha, f.IdMoneda, 
f.NroProyecto,Referencia Notas,
TotalFactura=(Select Sum(Cantidad*Precio * case when IdDeposito_Sal is null then -1 else 1 end) from st_Movimiento_det m where m.IdMovimiento=f.IdMovimiento)
FROM         st_Movimiento AS f 
                      where f.IdEmpresa=?oApp.Empresa
					and NroProyecto= ?m.NroProyecto   
					order by f.Fecha,f.Numero

ENDTEXT
=sql(cmdSQL,'cStock')


TEXT TO cmdSQL NOSHOW 
SELECT     ISNULL(d.FechaDiferida, d.fecha) AS Fecha, c.nrocuenta, c.nombre, c.idmoneda, d.iddeposito, d.idoperacion, LEFT(o.descripcion, 4) AS operacion, 
                      d.idconcepto, RTRIM(ISNULL(d.depositante, '')) + '-' + RTRIM(ISNULL(d.referencia, '')) AS Referencia, dt.nrocheque, d.nroasiento, d.nrooperacion, 
                      Credito=$0,Debito=dt.importe,
NroProyecto
FROM         ts_detdepos_base AS dt INNER JOIN
                      ts_operacion AS o INNER JOIN
                      ts_depositos_base AS d ON o.idoperacion = d.idoperacion INNER JOIN
                      ts_cuentas AS c ON c.idcuenta = d.idcuenta ON dt.iddeposito = d.iddeposito
				where d.IdEmpresa=?oApp.Empresa
				and NroProyecto= ?m.NroProyecto   
union
SELECT     ISNULL(d.FechaDiferida, d.fecha) AS Fecha, c.nrocuenta, c.nombre, c.idmoneda, d.iddeposito, d.idoperacion, LEFT(o.descripcion, 4) AS operacion, 
                      d.idconcepto, RTRIM(ISNULL(d.depositante, '')) + '-' + RTRIM(ISNULL(d.referencia, '')) AS Referencia, dt.nrocheque, d.nroasiento, d.nrooperacion, 
                      Credito=dt.importe,Debito=$0,
NroProyecto
FROM         ts_detdepos_base AS dt INNER JOIN
                      ts_operacion AS o INNER JOIN
                      ts_depositos_base AS d ON o.idoperacion = d.idoperacion INNER JOIN
                      ts_cuentas AS c ON c.idcuenta = d.idcuenta_Ent ON dt.iddeposito = d.iddeposito
             	where d.IdEmpresa=?oApp.Empresa
				and NroProyecto= ?m.NroProyecto  
				ORDER BY 1, d.idoperacion, d.nrooperacion
ENDTEXT

=sql(cmdSQL,'cTesor')

SELECT cCompras
INDEX on NroProyecto TAG Nro
CALCULATE SUM(Total),SUM(Saldo) TO cTotal,cSaldo FOR fecha <m.dfecha
SET FILTER TO Fecha>=m.dFecha


SELECT cVentas
INDEX on NroProyecto TAG Nro

CALCULATE SUM(TotalFactura),SUM(Saldo) TO vTotal,vSaldo FOR fecha <m.dfecha
SET FILTER TO Fecha>=m.dFecha

SELECT cTesor
INDEX on NroProyecto TAG Nro
CALCULATE SUM(Debito),SUM(Credito) TO tDebito,tCredito FOR fecha <m.dfecha
SET FILTER TO Fecha>=m.dFecha

SELECT cSTock
INDEX on NroProyecto TAG Nro

CALCULATE SUM(TotalFactura) TO sTotal FOR fecha <m.dfecha
SET FILTER TO Fecha>=m.dFecha




SELECT cProy 
SET RELATION TO Nro INTO cVentas ADDITIVE  
SET RELATION TO Nro INTO cCompras ADDITIVE  
SET RELATION TO Nro INTO cTesor ADDITIVE  
SET RELATION TO Nro INTO cStock ADDITIVE  



ENDPROC
                            Q���    8  8                        �   %   �      �  h   �          �  U    <�  � � U  CTOTAL CSALDO
  �  � U  SETEO� 7�  � � M(� �� �� 	SELECT     p.Nro, p.Fecha, p.IdCliente, p.Cliente, p.Nombre, p.Descripcion, p.Inicio, p.Fin, p.Estado, p.Localidad, p.Presupuesto, c.RazSocial�/ �) 	FROM         pr_Proyecto AS p INNER JOIN�h �b 	                      vt_clientes AS c ON p.IdEmpresa = c.IdEmpresa AND p.IdCliente = c.IdCliente�* �$ 					where p.IdEmpresa=?oApp.Empresa�O �I 					and Nro = ?m.NroProyecto                                            � � ��C � � cProy� �� F� �	 M(� ��L �F SELECT     f.FacturaProveedor, p.Razon, f.IdProveedor, f.Fecha,f.Iva, �� �� Referencia=RTRIM(ISNULL(f.Referencia,'')) + case when IdMoneda<>'GS' then IdMoneda +' '+ Convert(char(10),f.Total) else '' end , Total=(f.Total*Cotizacion),NroProyecto,�j �d Saldo = (Select isnull(sum(Saldo),0) from cp_Forma_Pago s where f.IdFactura=s.nrocomprob)*Cotizacion�- �' FROM         cp_factura AS f INNER JOIN�l �f                       cp_proveedor AS p ON f.IdEmpresa = p.IdEmpresa AND f.IdProveedor = p.IdProveedor�@ �:                       					where f.IdEmpresa=?oApp.Empresa�+ �% 					and NroProyecto= ?m.NroProyecto �1 �+ 					order by f.Fecha,f.FacturaProveedor   � �  � � ��C � � cCompras� ��	 M(� ��� �z SELECT     f.IdComprobante, f.Numero, f.Iva, f.IdCliente, c.RazSocial, f.Fecha, f.IdMoneda, f.TotalFactura, f.NroProyecto,�\ �V Saldo=(Select isnull(sum(Saldo),0) from vt_Forma_Pago s where f.IdFactura=s.IdFactura)�- �' FROM         vt_factura AS f INNER JOIN�g �a                       vt_clientes AS c ON f.IdEmpresa = c.IdEmpresa AND f.IdCliente = c.IdCliente�; �5                       where f.IdEmpresa=?oApp.Empresa�- �' 					and NroProyecto= ?m.NroProyecto   �$ � 					order by f.Fecha,f.Numero� �  � � ��C � � cVentas� ��	 M(� ��M �G SELECT     f.IdComprobante, f.NroRemision Numero, f.Fecha, f.IdMoneda, �9 �3 f.NroProyecto,convert(varchar(500),Notas) as Notas,�l �f TotalFactura=(Select Sum(Cantidad*Costo_Pro) from st_Movimiento_det m where m.IdRemision=f.IdRemision)�$ � FROM         os_remision AS f �; �5                       where f.IdEmpresa=?oapp.Empresa�- �' 					and NroProyecto= ?m.NroProyecto   �H �B --and IdFactura is null 	&&VG 09/10/08  traer todas las remisiones� � union�A �; SELECT     f.IdComprobante, f.Numero, f.Fecha, f.IdMoneda, �% � f.NroProyecto,Referencia Notas,�� �� TotalFactura=(Select Sum(Cantidad*Precio * case when IdDeposito_Sal is null then -1 else 1 end) from st_Movimiento_det m where m.IdMovimiento=f.IdMovimiento)�& �  FROM         st_Movimiento AS f �; �5                       where f.IdEmpresa=?oApp.Empresa�- �' 					and NroProyecto= ?m.NroProyecto   �$ � 					order by f.Fecha,f.Numero� �  � � ��C � � cStock� ��	 M(� ��� �� SELECT     ISNULL(d.FechaDiferida, d.fecha) AS Fecha, c.nrocuenta, c.nombre, c.idmoneda, d.iddeposito, d.idoperacion, LEFT(o.descripcion, 4) AS operacion, �� ��                       d.idconcepto, RTRIM(ISNULL(d.depositante, '')) + '-' + RTRIM(ISNULL(d.referencia, '')) AS Referencia, dt.nrocheque, d.nroasiento, d.nrooperacion, �9 �3                       Credito=$0,Debito=dt.importe,� � NroProyecto�4 �. FROM         ts_detdepos_base AS dt INNER JOIN�8 �2                       ts_operacion AS o INNER JOIN�^ �X                       ts_depositos_base AS d ON o.idoperacion = d.idoperacion INNER JOIN�f �`                       ts_cuentas AS c ON c.idcuenta = d.idcuenta ON dt.iddeposito = d.iddeposito�) �# 				where d.IdEmpresa=?oApp.Empresa�, �& 				and NroProyecto= ?m.NroProyecto   � � union�� �� SELECT     ISNULL(d.FechaDiferida, d.fecha) AS Fecha, c.nrocuenta, c.nombre, c.idmoneda, d.iddeposito, d.idoperacion, LEFT(o.descripcion, 4) AS operacion, �� ��                       d.idconcepto, RTRIM(ISNULL(d.depositante, '')) + '-' + RTRIM(ISNULL(d.referencia, '')) AS Referencia, dt.nrocheque, d.nroasiento, d.nrooperacion, �9 �3                       Credito=dt.importe,Debito=$0,� � NroProyecto�4 �. FROM         ts_detdepos_base AS dt INNER JOIN�8 �2                       ts_operacion AS o INNER JOIN�^ �X                       ts_depositos_base AS d ON o.idoperacion = d.idoperacion INNER JOIN�j �d                       ts_cuentas AS c ON c.idcuenta = d.idcuenta_Ent ON dt.iddeposito = d.iddeposito�3 �-              	where d.IdEmpresa=?oApp.Empresa�+ �% 				and NroProyecto= ?m.NroProyecto  �3 �- 				ORDER BY 1, d.idoperacion, d.nrooperacion� � ��C � � cTesor� �� F� � & �� ��� �) }��
 �� �(�  � ��� ����	 �� G(��
 �� �� F� � & �� ��� �) }��
 �� �(� � ��� ����	 �� G(��
 �� �� F� � & �� ��� �) }��
 �� �(� � ��� ���� �� G(��
 �� �� F� � & �� ��� � }��
 �� �(� ��� �� G(��
 �� �� F� � G-(�� ��� � G-(�� ��� � G-(�� ��� � G-(�� ��� � U  CTOTAL CSALDO CMDSQL SQL CPROY CCOMPRAS NROPROYECTO NRO TOTAL SALDO FECHA DFECHA CVENTAS TOTALFACTURA VTOTAL VSALDO CTESOR DEBITO CREDITO TDEBITO TCREDITO CSTOCK STOTAL Destroy,     �� BeforeOpenTablesN     �� Initc     ��1 � 2 q 3 � � Q	����A bq � ��
����a A �� ��q��Aa A �� ���A���� Q1
a��Aa A q� 
�
�A��a��� 
�
�A���1�1A rr � �s � �r � �r � �u 4                       (         O   Y         t   V      )   8                                                         