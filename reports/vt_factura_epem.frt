     @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=5
COLOR=2
                         Arial                                                         
"cFactura"                                                    
"cFactura"                                                    IdCliente,' - ',Cliente                                       Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         numero                                                        Arial                                                         IIF(plazo=0,'X','')                                           Arial                                                         IIF(plazo=0,'','X')                                           Arial                                                         RUC                                                           Arial                                                         Jtransform(cantidad,iif(round(Cantidad,0)=Int(Cantidad),'9999','9999.999'))                                                    Arial                                                         
cantidad>0                                                    Producto                                                      Arial                                                         @transform(lPRecio,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                              Arial                                                         
Cantidad>0                                                    Itransform(lPRecio*Cantidad,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                     Arial                                                         Iva=0 and Cantidad>0                                          Itransform(lPRecio*Cantidad,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                     Arial                                                         Iva=10                                                        Remision                                                      Arial                                                         
IdProducto                                                    Arial                                                         Jtransform(cantidad,iif(round(Cantidad,0)=Int(Cantidad),'9999','9999.999'))                                                    Arial                                                         
cantidad>0                                                    Producto                                                      Arial                                                         @transform(lPRecio,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                              Arial                                                         
Cantidad>0                                                    Itransform(lPRecio*Cantidad,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                     Arial                                                         Iva=0 and Cantidad>0                                          Itransform(lPRecio*Cantidad,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                     Arial                                                         Iva=10                                                        
IdProducto                                                    Arial                                                         IdCliente,' - ', Cliente                                      Arial                                                         Fecha                                                         "@D"                                                          Arial                                                         numero                                                        Arial                                                         IIF(plazo=0,'X','')                                           Arial                                                         IIF(plazo=0,'','X')                                           Arial                                                         RUC                                                           Arial                                                         Remision                                                      Arial                                                         Btransform(importe10,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                            Arial                                                         Rtransform(round(importe10*10/110,0),iif(IdMoneda='GS','999,999,999','999,999.99'))                                            Arial                                                         IdMoneda='GS'                                                 >transform(Total,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                                Arial                                                         mletras                                                       Arial                                                         Atransform(importe0,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                             Arial                                                         ktransform(round(importe10*10/110,0) +round(importe5*5/105,0),iif(IdMoneda='GS','999,999,999','999,999.99'))                   Arial                                                         IdMoneda='GS'                                                 Rtransform(round(importe10*10/110,2),iif(IdMoneda='GS','999,999,999','999,999.99'))                                            Arial                                                         IdMoneda<>'GS'                                                ktransform(round(importe10*10/110,2) +round(importe5*5/105,2),iif(IdMoneda='GS','999,999,999','999,999.99'))                   Arial                                                         IdMoneda<>'GS'                                                Btransform(importe10,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                            Arial                                                         Rtransform(round(importe10*10/110,0),iif(IdMoneda='GS','999,999,999','999,999.99'))                                            Arial                                                         IdMoneda='GS'                                                 >transform(Total,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                                Arial                                                         mletras                                                       Arial                                                         Atransform(importe0,iif(IdMoneda='GS','999,999,999','999,999.99'))                                                             Arial                                                         ktransform(round(importe10*10/110,0) +round(importe5*5/105,0),iif(IdMoneda='GS','999,999,999','999,999.99'))                   Arial                                                         IdMoneda='GS'                                                 Rtransform(round(importe10*10/110,2),iif(IdMoneda='GS','999,999,999','999,999.99'))                                            Arial                                                         IdMoneda<>'GS'                                                ktransform(round(importe10*10/110,2) +round(importe5*5/105,2),iif(IdMoneda='GS','999,999,999','999,999.99'))                   Arial                                                         IdMoneda<>'GS'                                                "Zona: ",IdCiclo                                              Arial                                                         "Zona: ",IdCiclo                                              Arial                                                         "Contrato: ",NroContrato                                      Arial                                                         "Contrato: ",NroContrato                                      Arial                                                         'Direccion : ', Direccion                                     Arial                                                         'Direccion : ', Direccion                                     Arial                                                         lPrecio                                                       real                                                          0                                                             importe0                                                      Eiif(iva=0,(lprecio*cantidad)-lprecio*cantidad*nvl(Descuento,0)/100,0)                                                         0                                                             importe5                                                      Eiif(iva=5,(lprecio*cantidad)-lprecio*cantidad*nvl(Descuento,0)/100,0)                                                         0                                                             	importe10                                                     Fiif(iva=10,(lprecio*cantidad)-lprecio*cantidad*nvl(Descuento,0)/100,0)                                                        0                                                             Total                                                         TotalFactura                                                  0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               _Top = 220
Left = 1
Width = 519
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                              PROCEDURE Init
DO seteo
SET CENTURY ON 
_ASCIICOLS = 145
_asciirows = 45
TEXT TO cmdSQL noshow
SELECT     v.IdComprobante, v.Numero, v.Sucursal, v.IdCliente, V.RazonSocial AS Cliente, v.IdCondicion, cond.Descripcion AS Condicion, v.Fecha, v.IdVendedor, 
                      RTRIM(p.Nombre) + ' ' + p.Apellido AS Vendedor, v.IdNegocio, det.IdProducto, det.Cantidad, det.Real as Precio, det.Ult_Costo AS CostoUnitario, 
                      det.GravadaIncluido, det.RegimenTurismo, det.Imprime, c.Direccion, c.Telefono, v.Ruc, cond.Plazo, isnull(rtrim(det.Descripcion), ' ') AS Producto, det.Iva, 
                      det.[real], TotalFactura,v.IdMoneda,Vence=dateadd(dd,cond.Inicial,v.Fecha),cond.Inicial,
                      Remision = dbo.Vt_RemisionDescripcion(v.IdFactura),v.IdFActura,Det.Descuento,v.IdPedido,v.Audit_Usuario,v.NroContrato,v.IdCiclo 
FROM         dbo.vt_clientes c RIGHT OUTER JOIN
                      dbo.vt_factura v left JOIN
                      dbo.st_movimiento_Det det ON v.IdFactura = det.IdFactura and det.Imprime=1 ON c.IdEmpresa = v.IdEmpresa AND c.IdCliente = v.IdCliente INNER JOIN 
                      st_producto AS pr ON det.idproducto = pr.idproducto and det.idempresa=pr.idempresa LEFT OUTER JOIN
                      dbo.vt_Condicion cond ON v.IdEmpresa = cond.IdEmpresa AND v.IdCondicion = cond.IdCondicion LEFT OUTER JOIN
                      dbo.BS_Personas p INNER JOIN
                      dbo.vt_Vendedores vend ON p.IdPersona = vend.idpersona ON v.IdEmpresa = vend.IdEmpresa AND v.IdVendedor = vend.IdVendedor
                      where v.IdFactura = ?m.IdFActura 
ENDTEXT

sql(cmdSQL,'cFactura')
SELECT cFactura
*SET STEP ON 
m.Total = TotalFactura
m.moneda = IdMoneda
m.nro=0
*m.nro = RECCOUNT()
SCAN
	m.nro = m.nro + memlines(producto)
ENDSCAN

GO top
m.Ciclo = IdCiclo
m.Contrato = NroContrato
COUNT ALL FOR NVL(Descuento,0)<>0 TO m.NroDesc

m.Nro = m.Nro + m.NroDesc

DO WHILE m.nro<11
	APPEND BLANK
	replace IdProducto WITH "", TotalFactura WITH m.Total,IdMoneda WITH m.Moneda, IdCiclo WITH m.Ciclo, NroContrato WITH m.Contrato
	m.nro= m.nro + 1
ENDDO 
	
PUBLIC mLetras


mLetras= ALLTRIM(numeral(int(m.total)))

m.decimales=IIF(m.moneda='GS',0,2)
IF m.decimales > 0
	mletras = "DOLARES " + mletras 
	mLetras = mLetras + ' CON ' + SUBSTR(STR(m.total - INT(m.total),3,2),2) + '/100'
ELSE 
	mletras = "GUARANIES " + mletras 
ENDIF


*!*	CREATE CURSOR Cabecera (IdFactura I ) 
*!*	SELECT Cabecera
*!*	INSERT INTO cabecera(IdFactura) values(m.IdFActura )
*!*	INSERT INTO cabecera(IdFactura) values(m.IdFActura )
*!*	INSERT INTO cabecera(IdFactura) values(m.IdFActura )


*!*	SELECT cFactura
*!*	INDEX on IdFactura TAG Nro

*!*	SELECT Cabecera
*!*	SET RELATION TO IdFactura INTO cFactura ADDITIVE  
ENDPROC
                                   
,���    
  
                        'p   %   \	      �	  0   j	          �  U  t �  � G � T�>����� T�?��-��	 M(� ��� �� SELECT     v.IdComprobante, v.Numero, v.Sucursal, v.IdCliente, V.RazonSocial AS Cliente, v.IdCondicion, cond.Descripcion AS Condicion, v.Fecha, v.IdVendedor, �� ��                       RTRIM(p.Nombre) + ' ' + p.Apellido AS Vendedor, v.IdNegocio, det.IdProducto, det.Cantidad, det.Real as Precio, det.Ult_Costo AS CostoUnitario, �� ��                       det.GravadaIncluido, det.RegimenTurismo, det.Imprime, c.Direccion, c.Telefono, v.Ruc, cond.Plazo, isnull(rtrim(det.Descripcion), ' ') AS Producto, det.Iva, �t �n                       det.[real], TotalFactura,v.IdMoneda,Vence=dateadd(dd,cond.Inicial,v.Fecha),cond.Inicial,�� ��                       Remision = dbo.Vt_RemisionDescripcion(v.IdFactura),v.IdFActura,Det.Descuento,v.IdPedido,v.Audit_Usuario,v.NroContrato,v.IdCiclo �5 �/ FROM         dbo.vt_clientes c RIGHT OUTER JOIN�6 �0                       dbo.vt_factura v left JOIN�� ��                       dbo.st_movimiento_Det det ON v.IdFactura = det.IdFactura and det.Imprime=1 ON c.IdEmpresa = v.IdEmpresa AND c.IdCliente = v.IdCliente INNER JOIN �~ �x                       st_producto AS pr ON det.idproducto = pr.idproducto and det.idempresa=pr.idempresa LEFT OUTER JOIN�� ��                       dbo.vt_Condicion cond ON v.IdEmpresa = cond.IdEmpresa AND v.IdCondicion = cond.IdCondicion LEFT OUTER JOIN�8 �2                       dbo.BS_Personas p INNER JOIN�� ��                       dbo.vt_Vendedores vend ON p.IdPersona = vend.idpersona ON v.IdEmpresa = vend.IdEmpresa AND v.IdVendedor = vend.IdVendedor�= �7                       where v.IdFactura = ?m.IdFActura � � ��C � � cFactura� �� F� � T�� �� �� T�� �� �� T�� �� �� ~��� T�� ��� C�	 ��� � #)� T��
 �� �� T�� �� �� �C� � �� �(�� � T�� ��� �� �� +��� ����� �= >� ���  �� ���� �� ���� �� ����
 �� ���� �� T�� ��� ��� � 7� � T� �CCC�� 8� ���% T�� �C�� � GS� � � �6�� %��� � ��J� T� �� DOLARES � ��9 T� �� �  CON CC�� C�� 8��Z�\� /100�� �m� T� ��
 GUARANIES � �� � U  SETEO CMDSQL SQL CFACTURA TOTAL TOTALFACTURA MONEDA IDMONEDA NRO PRODUCTO CICLO IDCICLO CONTRATO NROCONTRATO	 DESCUENTO NRODESC
 IDPRODUCTO MLETRAS NUMERAL	 DECIMALES Init,     ��1 q a � � � A
�
�A�	Qa�
�a�Q	�A �q � � � � qA R � � �rBQ �QA r sR1��� �A ?                             )   
                  .nroseguro�W