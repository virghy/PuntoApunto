     !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Arial                          D  $  winspool  hp LaserJet 1150  hpLaserJet1150                                               hp LaserJet 1150                !@� d߀ 	 �4d   ��                                                                                         B�e�               �� �� ��         4  �  d  	                                                                                                                                   A r i a l                                                       ��� H   �      B�e��ں                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     �ںh p   L a s e r J e t   1 1 5 0     1 1 5 0 , L o c a l O n l y , D r v C o n v e r t                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           �DRIVER=winspool
DEVICE=hp LaserJet 1150
OUTPUT=hpLaserJet1150
ORIENTATION=0
PAPERSIZE=9
PAPERLENGTH=2970
PAPERWIDTH=2100
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=-3
COLOR=2
DUPLEX=1
TTOPTION=3
COLLATE=0
               st_stock_cod.deposito          st_stock_cod.moneda            Arial                          "Dep�sito:"                    4iif(empty(m.deposito),"Todos",st_stock_cod.deposito)                                           Arial                          titulo                                                        Arial                          Arial                          
"Producto"                     st_stock_cod.idproducto                                       Arial                          Arial                          "Descripci�n"                  st_stock_cod.descripcion                                      Arial                          Arial                          
"Familia:"                     Arial                          "Linea:"                       7iif(empty(m.familia),"Todos",st_stock_cod.desc_familia)                                        Arial                          3iif(empty(m.linea),"Todos",st_stock_cod.desc_linea)                                            Arial                          Arial                          "Cantidad"                    st_stock_cod.existencia                                       Arial                          "999,999.99"                   st_stock_cod.�ltimo_cos                                       Arial                          "9,999,999.99"                 Arial                          "Costo"                       "Total general "                                              Arial                          st_stock_cod.existencia                                       Arial                          "99,999,999.99"                *"Total dep�sito " +  st_stock_cod.deposito                                                     Arial                          st_stock_cod.existencia                                       Arial                          "99,999,999.99"                st_stock_cod.moneda                                           Arial                          :round( st_stock_cod.existencia* st_stock_cod.�ltimo_cos,2)                                     Arial                          "999,999,999.99"               Arial                          "Costo Total"                 st_stock_cod.existencia                                       Arial                          "99,999,999.99"                9round(st_stock_cod.existencia* st_stock_cod.�ltimo_cos,2)                                      Arial                          "9,999,999,999.99"             H"Total stock en " + st_stock_cod.deposito+ " en " +  st_stock_cod.moneda                                                        Arial                          Arial                          "UND"                         st_stock_cod.unidad                                           Arial                          empresa                                                       Arial                          
datetime()                                                    Arial                          "P�g. " + str( _pageno,3 )                                                                     Arial                          totales                        0                              0                              Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          Arial                          dataenvironment                KLeft = 10
Top = 260
Width = 381
Height = 126
Name = "Dataenvironment"
                     BPROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
LOCAL lctitulo
lctitulo = "Stock Ordenado por Codigo"
SELECT VAL(st_producto.idproducto) AS idproducto,; 
st_producto.descripcion, ;
st_producto.�ltimo_cos,; 
st_producto.moneda, st_producto.unidad,; 
st_producto.ubicaci�n, st_producto.familia, ;
st_producto.linea, st_stock.existencia, bs_linea.descripcion AS desc_linea, bs_familia.descripcion AS desc_familia, st_stock.deposito, lctitulo AS titulo FROM datos!bs_linea, datos!bs_familia, datos!st_producto, datos!st_stock WHERE st_producto.idproducto = st_stock.idproducto AND st_producto.familia = bs_familia.cod_familia AND st_producto.linea = bs_linea.cod_linea AND (bs_linea.idempresa = oapp.empresa AND bs_familia.idempresa = oapp.empresa AND st_producto.idempresa = oapp.empresa AND st_stock.idempresa = oapp.empresa AND st_producto.familia = m.familia AND st_producto.linea = m.linea AND st_stock.deposito = m.deposito) ORDER BY st_stock.deposito, st_producto.idproducto, st_producto.moneda INTO CURSOR st_stock_cod
SELECT st_stock_cod
GOTO TOP

ENDPROC
                             ����    �  �                        �B   %   .      h  	   V          �  U  
  �  � U  SETEO� ��  �& T�  �� Stock Ordenado por Codigo���o� datos!bs_linea� datos!bs_familia� datos!st_producto� datos!st_stock�C� � g�Q� �� � ��� � ��� � ��� � ��� � ��� � ��� �	 ���
 � ��� � �Q� �� � �Q� ��
 � ���  �Q� ��� � �
 � � � � � � 	� � �	 � � 	�r � � � � � � � � � 	� � � � � 	� �
 � � � 	� � � �� 	� � �	 ��	 	� �
 � �� 		����
 � ��� � ��� � ���� st_stock_cod� F� � #)� U  LCTITULO ST_PRODUCTO
 IDPRODUCTO DESCRIPCION
 �LTIMO_COS MONEDA UNIDAD	 UBICACI�N FAMILIA LINEA ST_STOCK
 EXISTENCIA BS_LINEA
 DESC_LINEA
 BS_FAMILIA DESC_FAMILIA DEPOSITO TITULO DATOS COD_FAMILIA	 COD_LINEA	 IDEMPRESA OAPP EMPRESA ST_STOCK_COD BeforeOpenTables,     �� InitA     ��1 q 3 q avq Q 2                       &         A   7      )   �                  	�> �8 		and p.IdProducto bet