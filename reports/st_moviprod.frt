   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Enviar a OneNote 2007
OUTPUT=Send To Microsoft OneNote Port:
ORIENTATION=0
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=300
COLOR=1
YRESOLUTION=300
                                                                   Z  )  winspool  Enviar a OneNote 2007  Send To Microsoft OneNote Port:                                                     Enviar a OneNote 2007 C/841C/8   � � /   	     d   ,  ,   Letter                                                                                wpno               �          �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             SMTJ      H P   D e s k J e t   8 4 0 C / 8 4 1 C / 8 4 2 C / 8 4 3 C   InputBin FORMSOURCE RESDLL UniresDLL PSAlignmentFile HPF880AL PSHelpFile HPFDJ200 Orientation PORTRAIT PaperSize A4 Resolution r300x300 PM PlainEconoMono MediaType STANDARD Photo1200Mode Off ColorMode Mono PQ Econo HPHTDLLName HPFIMG50 HPHTBrightness HPHTSliderMiddle HPHTIntensity HPHTSliderMiddle HPHTColorTemp HPHTSliderMiddle HPHTVividness HPHTSliderMiddle HPHTInkLevels HPHTSliderMiddle                                                           $   �$               $   �$                                                     Arial                                                         
idproducto                                                    "Movimiento de Productos"                                                                                                   Arial                                                         "Producto:"                                                   Arial                                                         )alltrim(idproducto) + " - " + descripcion                                                                                   Arial                                                         ""                                                           Arial                                                         "Saldo"                                                      Arial                                                         rmoviprod.entrada                                             "@Z 9,999,999.99"                                             Arial                                                         "Fecha"                                                       Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         
"Periodo:"                                                    Arial                                                         "Dep�sito:"                                                   Arial                                                         m.dfecha,'al', m.hfecha                                                                                                     Arial                                                         Liif(empty(m.deposito),'Consolidado',m.deposito+" - " + rmoviprod11.deposito)                                                  Arial                                                         "Cpbte."                                                      Arial                                                         "Referencia"                                                  Arial                                                         
"Entrada "                                                    Arial                                                         "Salida"                                                      Arial                                                         rmoviprod.salida                                              "@Z 9,999,999.99"                                             Arial                                                         saldos                                                        "9,999,999.99"                                                                                                              Arial                                                         fecha                                                                                                                       Arial                                                         
referencia                                                    Arial                                                         ;alltrim(((IdComprobante))) +'-'+alltrim(str(nvl(numero,0)))                                                                   Arial                                                         saldo_anterior                                                "999,999.99"                                                  Arial                                                         "Saldo anterior"                                              Arial                                                         entrada                                                       "@Z 9,999,999.99"                                                                                                           Arial                                                         salida                                                        "@Z 9,999,999.99"                                                                                                           Arial                                                         saldos                                                        "9,999,999.99"                                                                                                              Arial                                                         	"Totales"                                                     Arial                                                         rmoviprod.precio                                              "99,999,999.99"                                               Arial                                                         	"Precio "                                                     Arial                                                         "Costo"                                                       Arial                                                         rmoviprod.costo_pro                                           "99,999,999.99"                                               Arial                                                         saldos                                                        entrada - salida                                              ,iif(isnull(saldo_anterior),0,saldo_anterior)                  Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             �PROCEDURE Init
IF EMPTY(m.producto)
	TEXT TO cmdSQL noshow
		SELECT IdProducto as Producto  FROM st_producto WHERE idEmpresa=?oApp.Empresa ORDER BY idProducto
	ENDTEXT
ELSE
	TEXT TO cmdSQL noshow
		SELECT IdProducto as Producto FROM st_producto WHERE idEmpresa=?oApp.Empresa AND IdProducto = ?m.Producto ORDER BY idProducto
	ENDTEXT
ENDIF

	sql(cmdSQL,'Productos')




If Empty(m.deposito)
	Messagebox('Ingrese Dep�sito',0,'Futura')
	Return .f.
else
SELECT Productos
SCAN

*	sql('exec st_moviprod ?m.dFecha, ?m.hFecha,?oapp.empresa,?m.producto,?m.deposito','rmoviprod')
	TEXT TO cmdSQL noshow
		Declare @dFecha1 datetime
		Set @dFecha1=dateadd(dd,-1,?m.dfecha) 


		SELECT ss.*, isnull(saldo_anterior.Cantidad,0)as saldo_anterior, st_producto.descripcion, st_producto.unidad 
		FROM dbo.st_MoviProducto(?oApp.Empresa,?Productos.Producto, ?m.Deposito,?m.dFecha,?m.hFecha  )ss left join 	
		dbo.st_SaldoStock(?oApp.Empresa,?Productos.Producto, ?m.Deposito,@dFecha1)   SALDO_ANTERIOR ON ss.idproducto = SALDO_ANTERIOR.idproducto 
		left JOIN st_producto 
			ON ss.idproducto = st_producto.idproducto and ss.IdEmpresa = st_producto.IdEmpresa
		ORDER BY ss.idproducto, fecha, entrada DESC,  numero 
		
		SELECT deposito 
		FROM st_depositos WHERE IdEmpresa = ?oApp.Empresa and IdDeposito = ?m.deposito  
	ENDTEXT

	sql(cmdSQL,'rmoviprod1')
	Select rmoviprod1
	IF NOT used("rmoviprod")
		SELECT * FROM rmoviprod1 ORDER BY idproducto, fecha, entrada DESC,  numero INTO CURSOR rmoviprod READWRITE 	
	ELSE
		INSERT into rmoviprod;
		SELECT * FROM rmoviprod1 order by idproducto, fecha, entrada DESC,  numero
	ENDIF
	
			
ENDSCAN
SELECT rmoviprod
	
*brow
*set
ENDIF 
*brow


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
       ���    �  �                        N#   %          �  -   H          �  U  t %�C��  ���� �	 M(� ��i �c 		SELECT IdProducto as Producto  FROM st_producto WHERE idEmpresa=?oApp.Empresa ORDER BY idProducto� � �!�	 M(� ��� � 		SELECT IdProducto as Producto FROM st_producto WHERE idEmpresa=?oApp.Empresa AND IdProducto = ?m.Producto ORDER BY idProducto� � � ��C � �	 Productos� �� %�C�� ����( ��C� Ingrese Dep�sito� � Futura�x�� B�-�� �m� F� � ~�b�	 M(� ��! � 		Declare @dFecha1 datetime�. �( 		Set @dFecha1=dateadd(dd,-1,?m.dfecha) � �  � �  �u �o 		SELECT ss.*, isnull(saldo_anterior.Cantidad,0)as saldo_anterior, st_producto.descripcion, st_producto.unidad �t �n 		FROM dbo.st_MoviProducto(?oApp.Empresa,?Productos.Producto, ?m.Deposito,?m.dFecha,?m.hFecha  )ss left join 	�� �� 		dbo.st_SaldoStock(?oApp.Empresa,?Productos.Producto, ?m.Deposito,@dFecha1)   SALDO_ANTERIOR ON ss.idproducto = SALDO_ANTERIOR.idproducto � � 		left JOIN st_producto �[ �U 			ON ss.idproducto = st_producto.idproducto and ss.IdEmpresa = st_producto.IdEmpresa�= �7 		ORDER BY ss.idproducto, fecha, entrada DESC,  numero � � 		� � 		SELECT deposito �X �R 		FROM st_depositos WHERE IdEmpresa = ?oApp.Empresa and IdDeposito = ?m.deposito  � � ��C � �
 rmoviprod1� �� F� � %�C�	 rmoviprod�
���; o�
 rmoviprod1���� ��� ��� �<��	 ����	 rmoviprod�� �^�: r��	 rmoviprodo�
 rmoviprod1���� ��� ��� �<��	 �� � � F�
 � � U  PRODUCTO CMDSQL SQL DEPOSITO	 PRODUCTOS
 RMOVIPROD1
 IDPRODUCTO FECHA ENTRADA NUMERO	 RMOVIPROD
  �  � U  SETEO Init,     �� BeforeOpenTables    ��1 � �A � � QA A ��q � q � � �a a QA	���� ��A �q ��� �A C q D 5 q 2                       �     +   �  �  =    )   �                  IdProducto between ?m.dproducto and 