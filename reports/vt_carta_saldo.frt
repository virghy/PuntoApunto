   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
PUT=PrimoPort:
ORI      aTop = 114
Left = 162
Width = 381
Height = 301
DataSource = .NULL.
Name = "Dataenvironment"
                             dataenvironment                                               Arial                                                         Arial                                                         	IdCliente                                                     
datetime()                                                                                                                  Arial                                                         IdComprobante," - ",nrocomprob                                	Wingdings                                                     Arial                                                         	"Factura"                                                                                                                   Arial                                                         !soloresumen                                                  saldo                                                         "99,999,999,999.99"                                                                                                         Arial                                                         
"Per�odo:"                                                    Arial                                                         "Saldo"                                                       Arial                                                         "Resumen de Cuentas "                                         Arial                                                         empresa                                                                                                                     Arial                                                         m.dfecha, " al " ,M.hfecha                                    Arial                                                         IdCliente,razsocial                                                                                                         Arial                                                         !SoloResumen                                                  saldo                                                         "99,999,999,999.99"                                           Arial                                                         fecha                                                         "@DYS"                                                        Arial                                                         "Fecha"                                                                                                                     Arial                                                         !soloresumen                                                  	"Totales"                                                     Arial                                                         Vencimiento                                                   "@DYS"                                                        Arial                                                         "Vence"                                                                                                                     Arial                                                         !soloresumen                                                  
"Se�or/a:"                                                    Arial                                                         Importe                                                       "99,999,999,999.99"                                           Arial                                                         	"Importe"                                                     Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         '"'                                                           	Wingdings                                                     descripcion                                                   Arial                                                         "Descripcion"                                                 Arial                                                         !soloresumen                                                  "Importe Ult. Pago:"                                          Arial                                                         
ImpUltPago                                                    "999,999,999.99"                                              Arial                                                         
FchUltPago                                                    "@D"                                                          Arial                                                         !SoloResumen                                                  "Fecha Ult. Pago:"                                            Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                        �PROCEDURE BeforeOpenTables
DO seteo
ENDPROC
PROCEDURE Init
Local sSQL

*--- agar 04/10/05

IF EMPTY(m.IdCliente)
	m.IdCliente = null
ENDIF
IF EMPTY(m.Sucursal)
	m.Sucursal = null
ENDIF


TEXT TO cmdSQL noshow
select c.IdCliente, c.RazSocial,  
              f.IdComprobante,  
              f.Numero as NroComprob,  
              f.Fecha,fp.Vencimiento,  
              mo.Descripcion as DesMoneda,
              FchUltPago=(Select top 1 Fecha from vt_pagos p where  p.IdEmpresa=c.IdEmpresa and p.IdCliente = c.IdCliente and fecha > '01/02/2008' order by Fecha Desc),
              ImpUltPago=(Select top 1 TotalFacturas from vt_pagos p where  p.IdEmpresa=c.IdEmpresa and p.IdCliente = c.IdCliente and fecha > '01/02/2008' order by Fecha Desc),
              sum( fp.Saldo ) as Saldo,SUM(Importe) as Importe,
              Descripcion=(Select top 1 Descripcion from st_movimiento_Det m where m.IdFactura = f.IdFactura order by IdDetalle)               
--              Descripcion=dbo.vt_Descripcion(f.IdFactura)               
        from vt_Forma_Pago fp, vt_factura f, vt_Clientes c, bs_monedas mo  
       where fp.IdFactura = f.IdFactura and fp.IdEmpresa = f.IdEmpresa  
          and f.IdCliente = c.IdCliente and f.IdEmpresa = c.IdEmpresa  
          and fp.IdMoneda = mo.IdMoneda  
           and f.IdEmpresa = ?oApp.Empresa       
          and ( ?m.Sucursal is null or f.Sucursal = ?m.Sucursal )  
          and f.fecha between ?m.dfecha and ?m.hfecha  
          and fp.vencimiento between ?m.dvence and ?m.hvence  
          and ( ?m.IdCliente is null or f.IdCliente = ?m.IdCliente)  
        group by c.IdEmpresa,c.IdCliente, c.RazSocial,f.IdFactura, f.IdComprobante, f.Numero, f.Fecha, fp.Vencimiento, mo.Descripcion  
         Having sum(fp.Saldo) <> 0  
        order by 1, f.fecha


ENDTEXT
	



sql( cmdSQL, 'xxSaldoCli' )

Select xxSaldoCli
ENDPROC
                                                             ����    v  v                        �:   %   �        '   �          �  U  
  �  � U  SETEO. ��  � %�C�� ���% � T�� ���� � %�C�� ���G � T�� ���� �	 M(� ��( �" select c.IdCliente, c.RazSocial,  �& �                f.IdComprobante,  �- �'               f.Numero as NroComprob,  �- �'               f.Fecha,fp.Vencimiento,  �0 �*               mo.Descripcion as DesMoneda,�� ��               FchUltPago=(Select top 1 Fecha from vt_pagos p where  p.IdEmpresa=c.IdEmpresa and p.IdCliente = c.IdCliente and fecha > '01/02/2008' order by Fecha Desc),�� ��               ImpUltPago=(Select top 1 TotalFacturas from vt_pagos p where  p.IdEmpresa=c.IdEmpresa and p.IdCliente = c.IdCliente and fecha > '01/02/2008' order by Fecha Desc),�E �?               sum( fp.Saldo ) as Saldo,SUM(Importe) as Importe,�� ��               Descripcion=(Select top 1 Descripcion from st_movimiento_Det m where m.IdFactura = f.IdFactura order by IdDetalle)               �P �J --              Descripcion=dbo.vt_Descripcion(f.IdFactura)               �Q �K         from vt_Forma_Pago fp, vt_factura f, vt_Clientes c, bs_monedas mo  �N �H        where fp.IdFactura = f.IdFactura and fp.IdEmpresa = f.IdEmpresa  �M �G           and f.IdCliente = c.IdCliente and f.IdEmpresa = c.IdEmpresa  �/ �)           and fp.IdMoneda = mo.IdMoneda  �7 �1            and f.IdEmpresa = ?oApp.Empresa       �I �C           and ( ?m.Sucursal is null or f.Sucursal = ?m.Sucursal )  �= �7           and f.fecha between ?m.dfecha and ?m.hfecha  �D �>           and fp.vencimiento between ?m.dvence and ?m.hvence  �K �E           and ( ?m.IdCliente is null or f.IdCliente = ?m.IdCliente)  �� ��         group by c.IdEmpresa,c.IdCliente, c.RazSocial,f.IdFactura, f.IdComprobante, f.Numero, f.Fecha, fp.Vencimiento, mo.Descripcion  �* �$          Having sum(fp.Saldo) <> 0  �! �         order by 1, f.fecha� �  � �  � � ��C � �
 xxSaldoCli� �� F� � U  SSQL	 IDCLIENTE SUCURSAL CMDSQL SQL
 XXSALDOCLI BeforeOpenTables,     �� InitA     ��1 q 2 q � A � A � �a���
aQQ	���q��A���a a A �r 1                       $         ?   u      )   v                  = mo.IdMoneda  
           and f.IdEmpre