   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
DIO451c PS3
OUTPUT      `Top = 32
Left = 177
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                              dataenvironment                                               Arial                                                         Arial                                                         Arial                                                         familia                                                       familia+linea                                                 '"Lista de Precios y Costos por Familia"                                                                                     Arial                                                         
"Producto"                                                    Arial                                                         
Idproducto                                                                                                                  Arial                                                         descripcion                                                   Arial                                                         Arial                                                         ""                                                           Arial                                                         precio                                                        "999,999,999.99"                                              Arial                                                         "Descripci�n"                                                 Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         Familia                                                                                                                     Arial                                                         Linea                                                                                                                       Arial                                                         "Lista de Precio:"                                            Arial                                                         	m.idLista                                                                                                                   Arial                                                         "Precio"                                                                                                                    Arial                                                         costo                                                         "999,999,999.99"                                              Arial                                                         "Costo"                                                                                                                     Arial                                                         !IIF(TipoRatio='S',Ratio,Utilidad)                             "999,999.99"                                                  Arial                                                         %IIF(TipoRatio='S',"Ratio","Utilidad")                         Arial                                                         
fechacosto                                                    "@D"                                                                                                                        Arial                                                         "Fecha Costo"                                                                                                               Arial                                                         Arial                                                         Arial                                                         Arial                                                        ]PROCEDURE Destroy
RELEASE TipoRatio
ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
PUBLIC TipoRatio

TipoRatio =oApp.LeerConstante('VT_RATIO','char(1)')
IF EMPTY(m.Familia)
	m.Familia= null
ENDIF

IF EMPTY(m.Linea)
	m.Linea= null
ENDIF
	

TEXT TO cmdSQL noshow
	SELECT     CONVERT(CHAR(3),fam.IdFamilia) + '-' + fam.Descripcion AS Familia, CONVERT(CHAR(3),lin.IdLinea)+ '-' + lin.Descripcion AS Linea, prod.IdProducto, prod.Descripcion, Fecha_�lti AS FechaCosto, 
	                      prod.Ult_Costo AS Costo, Precio=ISNULL(pre.Precio,Prod.Precio), CASE WHEN pre.precio > 0 THEN ROUND(prod.Ult_Costo / pre.Precio, 2) ELSE 0 END AS Ratio,
	                      CASE WHEN ISNULL(pre.Precio,Prod.Precio) > 0 THEN ROUND((ISNULL(pre.Precio,Prod.Precio) -prod.Ult_Costo) / prod.Ult_Costo * 100, 2) ELSE 0 END AS Utilidad
	FROM         dbo.st_Producto prod LEFT OUTER JOIN
	                      dbo.st_Linea lin ON prod.IdEmpresa = lin.IdEmpresa AND prod.Linea = lin.IdLinea LEFT OUTER JOIN
	                      dbo.st_Familia fam ON prod.IdEmpresa = fam.IdEmpresa AND prod.Familia = fam.IdFamilia LEFT OUTER JOIN
	                      dbo.vt_Precios pre ON prod.IdEmpresa = pre.IdEmpresa AND prod.IdProducto = pre.IdProducto
	WHERE     (prod.IdTipo in('P','S')) and Activo = 1 and Prod.IdEmpresa= ?oApp.Empresa and 
	(Prod.Familia = ?m.Familia or ?m.Familia is null) and 
	(Prod.Linea = ?m.Linea or ?m.Linea is null) 
	and pre.IdLista = ?m.IdLista
	Order by Fam.Descripcion, lin.Descripcion , prod.Descripcion
	
ENDTEXT

SQL(cmdSQL,'cLista')
SELECT cLista


ENDPROC
                                `���    G  G                        ��   %   g      �     �          �  U  
  <�  � U 	 TIPORATIO
  �  � U  SETEO� 7�  �& T�  �C� VT_RATIO� char(1)� � �� %�C�� ���K � T�� ���� � %�C�� ���m � T�� ���� �	 M(� ��� �� 	SELECT     CONVERT(CHAR(3),fam.IdFamilia) + '-' + fam.Descripcion AS Familia, CONVERT(CHAR(3),lin.IdLinea)+ '-' + lin.Descripcion AS Linea, prod.IdProducto, prod.Descripcion, Fecha_�lti AS FechaCosto, �� �� 	                      prod.Ult_Costo AS Costo, Precio=ISNULL(pre.Precio,Prod.Precio), CASE WHEN pre.precio > 0 THEN ROUND(prod.Ult_Costo / pre.Precio, 2) ELSE 0 END AS Ratio,�� �� 	                      CASE WHEN ISNULL(pre.Precio,Prod.Precio) > 0 THEN ROUND((ISNULL(pre.Precio,Prod.Precio) -prod.Ult_Costo) / prod.Ult_Costo * 100, 2) ELSE 0 END AS Utilidad�8 �2 	FROM         dbo.st_Producto prod LEFT OUTER JOIN�| �v 	                      dbo.st_Linea lin ON prod.IdEmpresa = lin.IdEmpresa AND prod.Linea = lin.IdLinea LEFT OUTER JOIN�� �| 	                      dbo.st_Familia fam ON prod.IdEmpresa = fam.IdEmpresa AND prod.Familia = fam.IdFamilia LEFT OUTER JOIN�v �p 	                      dbo.vt_Precios pre ON prod.IdEmpresa = pre.IdEmpresa AND prod.IdProducto = pre.IdProducto�` �Z 	WHERE     (prod.IdTipo in('P','S')) and Activo = 1 and Prod.IdEmpresa= ?oApp.Empresa and �= �7 	(Prod.Familia = ?m.Familia or ?m.Familia is null) and �3 �- 	(Prod.Linea = ?m.Linea or ?m.Linea is null) �# � 	and pre.IdLista = ?m.IdLista�C �= 	Order by Fam.Descripcion, lin.Descripcion , prod.Descripcion� � 	� � ��C � � cLista� �� F� � U 	 TIPORATIO OAPP LEERCONSTANTE FAMILIA LINEA CMDSQL SQL CLISTA Destroy,     �� BeforeOpenTablesE     �� InitZ     ��1 q 2 q 3 q b� A � A � Qq��!a�111q A rq 3                       $         K   U         p   R      )   G                  dpago ,  � � 			 vt_cl