   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=PrimoPDF
OUTPUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=300
COLOR=1
YRESOLUTION=300
TTOPTION=2
COLLATE=1
                                                          W    winspool  PrimoPDF  PrimoPort:                  3C  USB001                                                           �PrimoPDF -STUDIO451c PS3         � lS� 	 �
od   ,  ,  Letter                                                                            PRIV�0                                                                                       '''  '        � l                                  \K hC                             �{��      � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �   SMTJ     � P r i m o P D F   Resolution 600dpi PageSize Letter PageRegion  LeadingEdge  InputSlot OnlyOne                                          ne Collate True OutputBin Bin2 Stapling Off HolePunch Off PrintMode Normal DINDigit1 0 DINDigit2 0 DINDigit3 0 DINDigit4 0 DINDigit5 0 DeptCode False DCDigit1 0 DCDigit2 0 DCDigit3 0 DCDigit4 0 DCDigit5 0 ColorResType ColorLowGeneral DistinguishThinLines True BlackOverPrint True PureBlackGray BlackGrayAuto TonerSave False BlankPage False Smoothing True                                                                                    Arial                                                         IdMoneda                                                      Sucursal                                                      	idfactura                                                     3_VFP.SetVar('tfSucursal',tfSucursal + TotalFactura)           -_VFP.SetVar('tfMoneda',tfMoneda + tfSucursal)                 "Diario de Venta Detallado"                                   Arial                                                         "Fact.Nro."                                                   Arial                                                         Cliente                                                       Arial                                                         ""                                                           Arial                                                         "Fecha"                                                      "@I"                                                          Arial                                                         	"Cliente"                                                     Arial                                                         empresa                                                                                                                     Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha, ' al ' ,m.hfecha                                                                                                  Arial                                                         1IdCondicion, alltrim(IdComprobante), "-" , numero             dataenvironment                                               Arial                                                         producto                                                                                                                    Arial                                                         Dtransform(cantidad,"999,999."+REPLICATE('9', OAPP.PRODUCTO_DECIMAL))                                                          Arial                                                         "Cantidad"                                                   "@I"                                                          Arial                                                         "Descripci�n"                                                "@I"                                                          Arial                                                         precio                                                        "999,999,999.99"                                              Arial                                                         	"Precio"                                                     "@I"                                                          Arial                                                         "Total"                                                      "@I"                                                          Arial                                                         &subtot - (subtot*nvl(Descuento,0)/100)                        "999,999,999.99"                                              Arial                                                         &subtot - (subtot*nvl(Descuento,0)/100)                        "999,999,999.99"                                              Arial                                                         fecha                                                                                                                       Arial                                                         "Total Factura:"                                             Arial                                                         +iif(isnull(m.sucursal),'Todos',descripci�n)                   Arial                                                         "Sucursal:"                                                   Arial                                                         Iva                                                           "999"                                                         Arial                                                         "% Iva"                                                      "@I"                                                          Arial                                                         4round(ValorIva - (ValorIva *nvl(Descuento,0)/100),0)          "999,999,999.99"                                              Arial                                                         "Iva"                                                        "@I"                                                          Arial                                                         iif(RT,'RT','')                                                                                                             Arial                                                         obs                                                                                                                         Arial                                                         "Forma Iva"                                                   Arial                                                         FormaIva                                                      Arial                                                         "Moneda ", Idmoneda                                           Arial                                                         '"Sucursal ",Sucursal, " " , Descripci�n                       Arial                                                         &subtot - (subtot*nvl(Descuento,0)/100)                        "999,999,999.99"                                              Arial                                                         4round(ValorIva - (ValorIva *nvl(Descuento,0)/100),0)          "999,999,999.99"                                              Arial                                                         -"Total Sucursal ",Sucursal, " " , Descripci�n                 Arial                                                         &subtot - (subtot*nvl(Descuento,0)/100)                        "999,999,999.99"                                              Arial                                                         4round(ValorIva - (ValorIva *nvl(Descuento,0)/100),0)          "999,999,999.99"                                              Arial                                                         "Total Moneda ", Idmoneda                                     Arial                                                         (iif(isnull(m.IdCliente),'Todos',Cliente)                      Arial                                                         
"Cliente:"                                                    Arial                                                         	"% Desc"                                                     "@I"                                                          Arial                                                         	Descuento                                                     "999"                                                         Arial                                                         SubTot1                                                       subTot                                                        0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             hPROCEDURE Init

If Empty(m.sucursal)
	Store null To m.sucursal
endif


If Empty(m.IdCliente)
	Store null To m.Idcliente
endif

TEXT TO cmdSQL noshow
		select a.idfactura,a.fecha,a.idcomprobante,a.numero,a.IdMoneda,v.Tipo_Iva as FormaIva,
		rtrim(a.Idcliente)+'-'+c.RazSocial Cliente,a.exenta,a.gravada,
		a.exenta+a.gravada+a.iva total,a.idmoneda,a.sucursal,d.descripci�n, 
		rtrim(b.idproducto)+'-'+e.descripcion producto,b.cantidad,
--		Precio = CASE when v.Tipo_Iva='C' then b.precio else Real end ,
		Precio = Real,
--		subtot = CASE when v.Tipo_Iva='C' then (b.cantidad*b.precio) else (b.cantidad*b.Real)+ ValorIva   end, 
		subtot = (b.cantidad*b.Real), 
		b.Iva,
		ISNULL(b.ValorIva,0) as ValorIva,   RTRIM(ISNULL(b.Obs,'')) as Obs,
		b.RegimenTurismo as RT,
		b.Descuento,a.ImpDesc,a.TotalFactura,a.Iva as TotalIva,a.IdCondicion 
		from vt_Factura a inner join st_movimiento_det b on 
		a.idfactura=b.IdFactura and a.IdEmpresa = b.IdEmpresa 
		left join vt_clientes c on a.IdCliente=c.Idcliente and a.IdEmpresa = c.idempresa
		left join sucursal d on a.sucursal=d.sucursal and a.IdEmpresa = d.IdEmpresa  
		left join st_producto e on b.idproducto=e.idproducto and a.IdEmpresa = e.idempresa
		left join vt_cpbt v on a.IdComprobante = v.IdComprobante and a.Idempresa = v.IdEmpresa
		where a.idempresa=?oApp.Empresa and (a.fecha between ?m.dfecha and ?m.hfecha)
		and (a.sucursal=?m.sucursal or ?m.sucursal is null)	
		and (a.Idcliente=?m.Idcliente or ?m.Idcliente is null)
		order by a.IdMoneda,a.Sucursal,a.fecha, a.Numero
ENDTEXT

sql(cmdSQL,'rpedido')
SELECT rpedido

PUBLIC tfSucursal,tiSucursal,tdSucursal,tfMoneda,tiMoneda,tiMoneda

tfSucursal=0
tfMoneda=0

*Sum Importe To m.Total

ENDPROC
PROCEDURE BeforeOpenTables
Do seteo
ENDPROC
PROCEDURE Destroy
release tfSucursal,tiSucursal,tdSucursal,tfMoneda,tiMoneda,tiMoneda

ENDPROC
                     ����    q  q                        5@   %   }        )   �          �  U  { %�C��  ��� � J���(��  � � %�C�� ���@ � J���(�� � �	 M(� ��^ �X 		select a.idfactura,a.fecha,a.idcomprobante,a.numero,a.IdMoneda,v.Tipo_Iva as FormaIva,�F �@ 		rtrim(a.Idcliente)+'-'+c.RazSocial Cliente,a.exenta,a.gravada,�L �F 		a.exenta+a.gravada+a.iva total,a.idmoneda,a.sucursal,d.descripci�n, �B �< 		rtrim(b.idproducto)+'-'+e.descripcion producto,b.cantidad,�I �C --		Precio = CASE when v.Tipo_Iva='C' then b.precio else Real end ,� � 		Precio = Real,�q �k --		subtot = CASE when v.Tipo_Iva='C' then (b.cantidad*b.precio) else (b.cantidad*b.Real)+ ValorIva   end, �& �  		subtot = (b.cantidad*b.Real), � � 		b.Iva,�K �E 		ISNULL(b.ValorIva,0) as ValorIva,   RTRIM(ISNULL(b.Obs,'')) as Obs,� � 		b.RegimenTurismo as RT,�M �G 		b.Descuento,a.ImpDesc,a.TotalFactura,a.Iva as TotalIva,a.IdCondicion �< �6 		from vt_Factura a inner join st_movimiento_det b on �> �8 		a.idfactura=b.IdFactura and a.IdEmpresa = b.IdEmpresa �X �R 		left join vt_clientes c on a.IdCliente=c.Idcliente and a.IdEmpresa = c.idempresa�U �O 		left join sucursal d on a.sucursal=d.sucursal and a.IdEmpresa = d.IdEmpresa  �Z �T 		left join st_producto e on b.idproducto=e.idproducto and a.IdEmpresa = e.idempresa�^ �X 		left join vt_cpbt v on a.IdComprobante = v.IdComprobante and a.Idempresa = v.IdEmpresa�U �O 		where a.idempresa=?oApp.Empresa and (a.fecha between ?m.dfecha and ?m.hfecha)�< �6 		and (a.sucursal=?m.sucursal or ?m.sucursal is null)	�> �8 		and (a.Idcliente=?m.Idcliente or ?m.Idcliente is null)�8 �2 		order by a.IdMoneda,a.Sucursal,a.fecha, a.Numero� � ��C � � rpedido� �� F� � 7� � � � �	 �	 � T� �� �� T� �� �� U
  SUCURSAL	 IDCLIENTE CMDSQL SQL RPEDIDO
 TFSUCURSAL
 TISUCURSAL
 TDSUCURSAL TFMONEDA TIMONEDA
  �  � U  SETEO  <�  � � � � � � U 
 TFSUCURSAL
 TISUCURSAL
 TDSUCURSAL TFMONEDA TIMONEDA Init,     �� BeforeOpenTables    �� Destroy#    ��1 � A � A � �a�!�aa� ������Q��Q���A �q �� � 5 q 2 �2                       �     %   �  �  0   '     ]  3    )   q                  (Cp_factura.centrocosto = ?m.centro or ?m.Cent