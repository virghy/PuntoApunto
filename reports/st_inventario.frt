   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Microsoft Office Document Image Writer
OUTPUT=Microsoft Document Imaging Writer Port:
ORIENTATION=0
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=200
COLOR=2
YRESOLUTION=200
                                           s  :  winspool  Microsoft Office Document Image Writer  Microsoft Document Imaging Writer Port:                            ,Microsoft Office Document Imag   � � /   	     d   �   �    Letter                                                                                widm              �          �                                                                                                                                 Arial                                                         idinventario                                                  "Resultado de Inventario"                                     Arial                                                         ""                                                           Arial                                                         'IIF(difresultado<0,abs(difresultado),0)                       "@Z 999,999.99"                                               Arial                                                         alltrim( oApp.Nombreempresa )                                                                                               Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         
"Faltante"                                                    Arial                                                         obs                                                           Arial                                                         "Inventario"                                                  Arial                                                         
inventario                                                    "@Z 999,999.99"                                               Arial                                                         )alltrim(idproducto) + " - " + descripcion                     Arial                                                         
"Producto"                                                    Arial                                                         "IIF(difresultado>0,difresultado,0)                            "999,999.99"                                                  Arial                                                         
"Sobrante"                                                    Arial                                                         "Total General"                                               Arial                                                         "Dep�sito Entrada:"                                           Arial                                                          alltrim(iddeposito)+"-"+deposito                              Arial                                                         "Referencia:"                                                 Arial                                                         
"Cantidad"                                                    Arial                                                         	"Importe"                                                     Arial                                                         difresultado*importe                                          "999,999,999.99"                                              Arial                                                         cantidad                                                      "@Z 999,999.99"                                               Arial                                                         'IIF(difresultado<0,abs(difresultado),0)                       "@Z 999,999.99"                                               Arial                                                         "IIF(difresultado>0,difresultado,0)                            "999,999.99"                                                  Arial                                                         difresultado*importe                                          "999,999,999.99"                                              Arial                                                         
"Periodo:"                                                    Arial                                                         m.dfecha,'al',m.hfecha                                        Arial                                                         idinventario                                                  "@Z 999,999.99"                                               Arial                                                         "Inventario Nro:"                                             Arial                                                         "Total Inventario"                                            Arial                                                         'IIF(difresultado<0,abs(difresultado),0)                       "@Z 999,999.99"                                               Arial                                                         "IIF(difresultado>0,difresultado,0)                            "999,999.99"                                                  Arial                                                         difresultado*importe                                          "999,999,999.99"                                              Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 350
Left = 195
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                            \PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
IF EMPTY(m.deposito)
	m.Deposito = null
ENDIF
	

TEXT TO cmdSQL noshow
SELECT     st_inventario.IdDeposito, st_inventario.IdInventario, st_inventario.Fecha, st_inventario.Obs, st_Depositos.Deposito, st_Producto.Descripcion, 
                      (st_inventariodet.Inventario- st_inventariodet.Cantidad) as difresultado, st_inventariodet.IdProducto, st_inventariodet.Cantidad, st_inventariodet.Inventario, st_inventariodet.Importe
FROM         st_Depositos INNER JOIN
                      st_inventario ON st_Depositos.IdEmpresa = st_inventario.IdEmpresa AND st_Depositos.IdDeposito = st_inventario.IdDeposito INNER JOIN
                      st_inventariodet ON st_inventario.IdInventario = st_inventariodet.IdInventario INNER JOIN
                      st_Producto ON st_Depositos.IdEmpresa = st_Producto.IdEmpresa AND st_inventariodet.IdProducto = st_Producto.IdProducto AND 
                      st_inventario.IdEmpresa = st_Producto.IdEmpresa
where st_producto.IdEmpresa=?oApp.Empresa and 
	  (st_inventario.idinventario= ?m.inventario or ?m.inventario = 0)
      and st_inventario.Fecha between ?m.dfecha and ?m.hfecha
      and (st_inventario.IdDeposito = ?m.Deposito or ?m.Deposito is null)        

            
ENDTEXT

sql(cmdSQL,'Inven')
SELECT Inven

  


ENDPROC
                                 =���    $  $                        �   %   s      �     �          �  U  
  �  � U  SETEO %�C��  ��� � T��  ���� �	 M(� ��� �� SELECT     st_inventario.IdDeposito, st_inventario.IdInventario, st_inventario.Fecha, st_inventario.Obs, st_Depositos.Deposito, st_Producto.Descripcion, �� ��                       (st_inventariodet.Inventario- st_inventariodet.Cantidad) as difresultado, st_inventariodet.IdProducto, st_inventariodet.Cantidad, st_inventariodet.Inventario, st_inventariodet.Importe�* �$ FROM         st_Depositos INNER JOIN�� ��                       st_inventario ON st_Depositos.IdEmpresa = st_inventario.IdEmpresa AND st_Depositos.IdDeposito = st_inventario.IdDeposito INNER JOIN�u �o                       st_inventariodet ON st_inventario.IdInventario = st_inventariodet.IdInventario INNER JOIN�� ��                       st_Producto ON st_Depositos.IdEmpresa = st_Producto.IdEmpresa AND st_inventariodet.IdProducto = st_Producto.IdProducto AND �K �E                       st_inventario.IdEmpresa = st_Producto.IdEmpresa�4 �. where st_producto.IdEmpresa=?oApp.Empresa and �I �C 	  (st_inventario.idinventario= ?m.inventario or ?m.inventario = 0)�C �=       and st_inventario.Fecha between ?m.dfecha and ?m.hfecha�W �Q       and (st_inventario.IdDeposito = ?m.Deposito or ?m.Deposito is null)        � �  � �             � � ��C � � Inven� �� F� � U  DEPOSITO CMDSQL SQL INVEN BeforeOpenTables,     �� InitA     ��1 q 3 � A � �	1��	Qq	�A�1qa !A bq 5                       &         A   Q      )   $                  � � � ��� � ��� � ���
 � ���
 � ��C�
 � 