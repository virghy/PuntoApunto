   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=PrimoPDF
OUTPUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=1
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=3
COLLATE=1
                                                           W    winspool  PrimoPDF  PrimoPort:                  B001                                                                 	HPrimoPDF .0.195\HP Deskjet 100  � �S�  �
od   X  X  Letter                                                                            PRIV�0                                                                                       '''  '          �                                  \K �	                             �{��     � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         tocol pcl3gui hpImagingDll hpfime50.dll Orientation PORTRAIT ColorMode 24bpp HPGrayScale 0 HPTextThreshold 24 HPGraphicThreshold 22 hpSupportsREST 1 hpDPIInfo 0 HPHideQualitySettings 0 Resolution 300x300dpi Halftone HT_PATSIZE_DEFAULT HPMechOffset 60 HPRlt 1 HPPagesToPrint 4_AllPages PaperSize A4 HPMaxDpi 0_disabled MediaType 0_-2_300x300                                                                    P  LPPH   Q�`Q�`                                      X  ,  X  ,     �  �  �  }  K   K   <   <   <   <          '           '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Mon Aug 01 09:33:00:535 2011                                                                    w�`K   K                w�`                                                      Arial                                                         IdMoneda                                                      sucursal                                                      	idcliente                                                     total                                                         "999,999,999,999.99"                                          Arial                                                         "Ventas por Cliente y Sucursal"                                                                                             Arial                                                         empresa                                                                                                                     Arial                                                         "Fecha"                                                      Arial                                                         
"Per�odo:"                                                    Arial                                                         &dtoc(m.dfecha)+ " al " +dtoc(m.hfecha)                                                                                      Arial                                                         vt_rclientedeposito.fecha                                                                                                   Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         	"Cliente"                                                     Arial                                                         "Nro."                                                        Arial                                                         *iif(empty(m.sucursal),'Todos',descripci�n)                                                                                  Arial                                                         +IdCliente,' ',vt_rclientedeposito.razsocial                   Arial                                                         numero                                                        "@B"                                                          Arial                                                         
"Sucursal"                                                    Arial                                                         "Total"                                                       Arial                                                         "Cpbte."                                                      Arial                                                         idcomprobante                                                                                                               Arial                                                         V"Total ("+  alltrim(vt_rclientedeposito.idcliente)+") "+ vt_rclientedeposito.razsocial                                        Arial                                                         exenta                                                        "999,999,999.99"                                              Arial                                                         Gravada                                                       "99,999,999,999.99"                                           Arial                                                         iva                                                           "999,999,999.99"                                              Arial                                                         "Exenta"                                                                                                                    Arial                                                         	"Gravada"                                                     Arial                                                         "IVA"                                                         Arial                                                         descripci�n                                                                                                                 Arial                                                         
"Sucursal"                                                    Arial                                                         $"Total ("+  alltrim(descripci�n)+")"                          Arial                                                         total                                                         "999,999,999,999.99"                                          Arial                                                         exenta                                                        "999,999,999.99"                                              Arial                                                         gravada                                                       "99,999,999,999.99"                                           Arial                                                         iva                                                           "999,999,999.99"                                              Arial                                                         total                                                         "999,999,999,999.99"                                          Arial                                                         exenta                                                        "999,999,999.99"                                              Arial                                                         gravada                                                       "99,999,999,999.99"                                           Arial                                                         iva                                                           "999,999,999.99"                                              Arial                                                         IdMoneda                                                      Arial                                                         "Moneda"                                                      Arial                                                         !"Total ("+  alltrim(IdMoneda)+")"                             Arial                                                         total                                                         "999,999,999,999.99"                                          Arial                                                         exenta                                                        "999,999,999.99"                                              Arial                                                         gravada                                                       "99,999,999,999.99"                                           Arial                                                         iva                                                           "999,999,999.99"                                              Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 157
Left = -2
Width = 759
Height = 448
InitialSelectedAlias = "vt_rclientedeposito"
DataSource = .NULL.
Name = "Dataenvironment"
                                               �PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
		LOCAL strsql
SET DATABASE TO datos

IF EMPTY(m.Idcliente)
	m.Idcliente = null
ENDIF
	

strsql = 'select b.idcliente, b.fecha, b.sucursal, b.idcomprobante, b.idfactura, '+;
		'b.numero, c.razsocial, d.descripci�n, '+;
		'isnull(b.exenta,0) exenta, '+;
		'isnull(b.gravada,0) gravada, '+;
		'isnull(b.iva,0) iva, b.ImpDesc,'+;
		'b.TotalFactura total, b.IdMoneda '+;
		'from vt_factura b, vt_clientes c, sucursal d '+;
		'where  b.sucursal = d.sucursal and b.IdEmpresa = d.IdEmpresa '+;
		'and b.idcliente = c.idcliente and b.IdEmpresa = c.IdEmpresa '+;
		'and (b.idcliente = ?m.idcliente or ?m.idcliente is null)'+;
		'and b.IdEmpresa = ?oApp.Empresa ' +;
		'and b.sucursal = ?m.sucursal '+;
		'and b.fecha BETWEEN ?m.dfecha and ?m.hfecha '+;
		'order by IdMoneda,b.Sucursal,b.idcliente, b.idcomprobante '

=sql(strsql ,'vt_rclientedeposito')
SELECT vt_rclientedeposito
ENDPROC
                                                   9���                                )�   %   �      �     �          �  U  
  �  � U  SETEO ��  � G(� datos� %�C�� ���3 � T�� ���� ��T�  ��G select b.idcliente, b.fecha, b.sucursal, b.idcomprobante, b.idfactura, �& b.numero, c.razsocial, d.descripci�n, � isnull(b.exenta,0) exenta, � isnull(b.gravada,0) gravada, � isnull(b.iva,0) iva, b.ImpDesc,�! b.TotalFactura total, b.IdMoneda �- from vt_factura b, vt_clientes c, sucursal d �= where  b.sucursal = d.sucursal and b.IdEmpresa = d.IdEmpresa �< and b.idcliente = c.idcliente and b.IdEmpresa = c.IdEmpresa �8 and (b.idcliente = ?m.idcliente or ?m.idcliente is null)�  and b.IdEmpresa = ?oApp.Empresa � and b.sucursal = ?m.sucursal �, and b.fecha BETWEEN ?m.dfecha and ?m.hfecha �: order by IdMoneda,b.Sucursal,b.idcliente, b.idcomprobante ��$ ��C �  � vt_rclientedeposito� �� F� � U  STRSQL DATOS	 IDCLIENTE SQL VT_RCLIENTEDEPOSITO BeforeOpenTables,     �� InitA     ��1 q 3 q � � A � q*Bq 1                       &         A   �      )                                        dbo.vt_Vendedores b ON fact.IdEmpresa = b.IdE