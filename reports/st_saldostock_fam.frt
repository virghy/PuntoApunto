   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=TOSHIBA e-STUDIO451c PS3
OUTPUT=192.168.0.17
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=600
COLOR=2
DUPLEX=1
YRESOLUTION=600
TTOPTION=3
COLLATE=0
                               J  ,  winspool  TOSHIBA e-STUDIO451c PS3  192.168.0.17                                                                     �TOSHIBA e-STUDIO451c PS3         � S�� 	 �
od   X  X   Letter                                                                            PRIV�0                                                                                       '''  '        @                                  \K hC                             x�d�      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   @  SMTJ     0T O S H I B A   e - S T U D I O 4 5 1 c   P S 3   Resolution 600dpi PageSize Letter PageRegion  InputSlot Auto MediaType Plain Duplex None Collate True OutputBin Bin2 Stapling Off HolePunch Off PrintMode Normal DINDigit1 0 DINDigit2 0 DINDigit3 0 DINDigit4 0 DINDigit5 0 DeptCode False DCDigit1 0 DCDigit2 0 DCDigit3 0 DCDigit4 0 DCDigit5 0 ColorResType ColorLowGeneral DistinguishThinLines True BlackOverPrint True PureBlackGray BlackGrayAuto TonerSave False BlankPage False Smoothing True                                                                                    Arial                                                         familia                                                       familia+linea                                                 %"Saldos de Stock por Familia y Linea"                                                                                       Arial                                                         
"Producto"                                                    Arial                                                         
Idproducto                                                    Arial                                                         descripcion                                                                                                                 Arial                                                         ""                                                           Arial                                                         "Existencia"                                                 Arial                                                         Cantidad                                                      "999,999.99"                                                  Arial                                                         "Descripci�n"                                                 Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         Familia                                                       Arial                                                         linea                                                         Arial                                                         "Hasta Fecha:"                                                Arial                                                         "Dep�sito:"                                                   Arial                                                         m.hfecha                                                                                                                    Arial                                                         Kiif(isnull(m.deposito),'Consolidado',m.deposito+" - " + xdeposito.deposito)                                                   Arial                                                         unidad                                                        Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             sPROCEDURE Init
IF EMPTY(m.Deposito)
	m.deposito = null
ELSE
	sql("Select Deposito from st_depositos where IdEmpresa=?oApp.Empresa and IdDeposito = ?m.Deposito",'xdeposito')	
ENDIF

IF EMPTY(m.hproducto)
	m.hproducto= 'ZZZ'
ENDIF

IF EMPTY(m.familia)
	m.familia= null
ENDIF

IF EMPTY(m.linea)
	m.linea= null
ENDIF

IF m.OrdenProducto='C'
 	m.Orden='p.IdProducto'
ELSE
 	m.Orden='upper(p.Descripcion)'
ENDIF
 
 	


TEXT TO cmdSQL NOSHOW TEXTMERGE
SELECT p.IdProducto,p.Descripcion,Unidad,ISNULL(Cantidad,0) as Cantidad, Familia = f.IdFamilia + f.Descripcion,
	Linea = l.IdLinea + l.Descripcion
	from st_Producto p left join dbo.st_SaldoStock(?oApp.Empresa,null,?m.deposito,?m.hfecha) s
			ON p.IdEmpresa=s.IdEmpresa AND p.IdProducto = s.IdProducto 
			left join st_Familia f on p.IdEmpresa=f.IdEmpresa AND p.Familia = f.IdFamilia 
			left join st_Linea l on p.IdEmpresa=l.IdEmpresa AND p.Linea = l.IdLinea 
	where p.IdEmpresa=?oApp.Empresa			
		and p.IdProducto between ?m.dproducto and ?m.hProducto
		and (p.Familia = ?m.familia or ?m.Familia is null)
		and (p.linea = ?m.Linea or ?m.linea is null)
		and p.AfectaStock = 1
		and (ISNULL(Cantidad,0) <> 0 or ?m.StockCero='S')
		order by ISNULL(f.Descripcion,''), ISNULL(p.Linea,''), <<m.Orden>>
ENDTEXT

sql(cmdSQL,'saldos')
SELECT saldos
	 
ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
          u���    \  \                        �Q   %   �        (   �          �  U  � %�C��  ��� � T��  ���� �� �u ��C�\ Select Deposito from st_depositos where IdEmpresa=?oApp.Empresa and IdDeposito = ?m.Deposito�	 xdeposito� �� � %�C�� ���� � T�� �� ZZZ�� � %�C�� ���� � T�� ���� � %�C�� ���� T�� ���� � %��� � C��9� T�� �� p.IdProducto�� �d�# T�� �� upper(p.Descripcion)�� �
 M(� `��u �o SELECT p.IdProducto,p.Descripcion,Unidad,ISNULL(Cantidad,0) as Cantidad, Familia = f.IdFamilia + f.Descripcion,�( �" 	Linea = l.IdLinea + l.Descripcion�a �[ 	from st_Producto p left join dbo.st_SaldoStock(?oApp.Empresa,null,?m.deposito,?m.hfecha) s�D �> 			ON p.IdEmpresa=s.IdEmpresa AND p.IdProducto = s.IdProducto �W �Q 			left join st_Familia f on p.IdEmpresa=f.IdEmpresa AND p.Familia = f.IdFamilia �Q �K 			left join st_Linea l on p.IdEmpresa=l.IdEmpresa AND p.Linea = l.IdLinea �) �# 	where p.IdEmpresa=?oApp.Empresa			�> �8 		and p.IdProducto between ?m.dproducto and ?m.hProducto�: �4 		and (p.Familia = ?m.familia or ?m.Familia is null)�4 �. 		and (p.linea = ?m.Linea or ?m.linea is null)� � 		and p.AfectaStock = 1�9 �3 		and (ISNULL(Cantidad,0) <> 0 or ?m.StockCero='S')�J �D 		order by ISNULL(f.Descripcion,''), ISNULL(p.Linea,''), <<m.Orden>>� � ��C � � saldos� �� F� � U	  DEPOSITO SQL	 HPRODUCTO FAMILIA LINEA ORDENPRODUCTO ORDEN CMDSQL SALDOS
  �  � U  SETEO Init,     �� BeforeOpenTablesv    ��1 � � QA !A � A � A B�� 1A � Q�Aq���A���A rq 3 q 2                       7     &   ^  h  1    )   \                  STA