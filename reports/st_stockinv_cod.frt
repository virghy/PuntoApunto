   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=PrimoPDF
OUTPUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=300
COLOR=2
YRESOLUTION=300
TTOPTION=1
COLLATE=1
                                                           M    winspool  PrimoPDF  PrimoPort:                  002                                                                  	XPrimoPDF t 1000 J110 series      � lS� 	 �
od   ,  ,  Letter                                                                            PRIV�0                                                                                       '''  '        � l                                  \K hC                             �{��      � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �   SMTJ     � P r i m o P D F   Resolution 600dpi PageSize Letter PageRegion  LeadingEdge  InputSlot OnlyOne                                          _DEFAULT HPMechOffset 60 hpDPIInfo 0 Resolution 600x300dpi HPRlt 1 HPPagesToPrint 4_AllPages PaperSize LETTER MediaType 0.1004_0_600x300 HPHideQualitySettings 0 HPMaxDpi 0_disabled hpSpeedMech 3                                                                      H  LPPH   Q�`Q�`                              X  X  X  ,     �  �  �  }  K   K   <   <   <   <          '           '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '  '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Wed Sep 12 16:10:13:436 2012                                                                    w�`K   K                w�`                                      Arial                                                         !"Saldos de Stock para Inventario"                                                                                           Arial                                                         
"Producto"                                                    Arial                                                         
Idproducto                                                    Arial                                                         descripcion                                                   Arial                                                         ""                                                           Arial                                                         "Existencia"                                                 Arial                                                         cantidad                                                      "999,999.99"                                                  Arial                                                         "Descripci�n"                                                 Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Hasta Fecha:"                                                Arial                                                         "Dep�sito:"                                                   Arial                                                         m.hfecha                                                                                                                    Arial                                                         Kiif(isnull(m.deposito),'Consolidado',m.deposito+" - " + xdeposito.deposito)                                                   Arial                                                         unidad                                                                                                                      Arial                                                         "Ubicaci�n"                                                  Arial                                                         "Verificado"                                                 Arial                                                         "............................"                                                                                              Arial                                                         	ubicaci�n                                                                                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             �PROCEDURE Init
IF EMPTY(m.Deposito)
	m.deposito = null
ELSE
	sql("Select Deposito from st_depositos where IdEmpresa=?oApp.Empresa and IdDeposito = ?m.Deposito",'xdeposito')	
ENDIF



IF EMPTY(m.hproducto)
	m.hproducto= 'ZZZ'
ENDIF


TEXT TO cmdSQL noshow
SELECT p.IdProducto,Descripcion,Unidad,Cantidad,Ubicaci�n
	from st_Producto p left join dbo.st_SaldoStock(?oApp.Empresa,null,?m.deposito,?m.hfecha) s
			ON p.IdEmpresa=s.IdEmpresa AND 
				p.IdProducto = s.IdProducto 
	where p.IdEmpresa=?oApp.Empresa			
		and p.IdProducto between ?m.dproducto and ?m.hProducto
		and p.AfectaStock = 1
		and p.Activo = 1
		and (isnull(FiltraSucursal,0)=0 or exists(Select idproducto from st_ProductoSucursal s where p.IdEmpresa=s.IdEmpresa and p.IdProducto=s.IdProducto and s.Sucursal=?m.Sucursal))
--		and (p.Activo=1 or NVL(Cantidad,0)<>0)
    	and isnull(Cantidad,0)<>0
		order by p.IdProducto
ENDTEXT

sql(cmdSQL,'saldos')
SELECT saldos
ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                                                   ����    �  �                        ��   %         u     =          �  U  � %�C��  ��� � T��  ���� �� �u ��C�\ Select Deposito from st_depositos where IdEmpresa=?oApp.Empresa and IdDeposito = ?m.Deposito�	 xdeposito� �� � %�C�� ���� � T�� �� ZZZ�� �	 M(� ��? �9 SELECT p.IdProducto,Descripcion,Unidad,Cantidad,Ubicaci�n�a �[ 	from st_Producto p left join dbo.st_SaldoStock(?oApp.Empresa,null,?m.deposito,?m.hfecha) s�( �" 			ON p.IdEmpresa=s.IdEmpresa AND �& �  				p.IdProducto = s.IdProducto �) �# 	where p.IdEmpresa=?oApp.Empresa			�> �8 		and p.IdProducto between ?m.dproducto and ?m.hProducto� � 		and p.AfectaStock = 1� � 		and p.Activo = 1�� �� 		and (isnull(FiltraSucursal,0)=0 or exists(Select idproducto from st_ProductoSucursal s where p.IdEmpresa=s.IdEmpresa and p.IdProducto=s.IdProducto and s.Sucursal=?m.Sucursal))�0 �* --		and (p.Activo=1 or NVL(Cantidad,0)<>0)�$ �     	and isnull(Cantidad,0)<>0� � 		order by p.IdProducto� � ��C � � saldos� �� F� � U  DEPOSITO SQL	 HPRODUCTO CMDSQL SALDOS
  �  � U  SETEO Init,     �� BeforeOpenTables     ��1 � � QA !A � ��a����qA�A rq 2 q 2                       �        �  �  !    )   �                  der by ISNULL(f.D