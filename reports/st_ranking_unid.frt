   t   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
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
                                                           8    winspool  PrimoPDF  PrimoPort:                       `PrimoPDF                        � �S� 	 �4d   ,  ,  A4                                                                                PRIV�0                                                                                       '''  '          �                                  P4 (�                             D�M      � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Arial                                                         ,"Ranking de Ventas en Unidades por Deposito"                                                                                Arial                                                         
"Producto"                                                    Arial                                                         rranking.idproducto                                                                                                         Arial                                                         rranking.descripcion                                                                                                        Arial                                                         ""                                                           Arial                                                         "Unidades"                                                   Arial                                                         rranking.cantidad                                             "99,999,999.99"                                                                                                             Arial                                                         "Descripci�n"                                                 Arial                                                         alltrim( empresa )                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Periodo::"                                                   Arial                                                         "Dep�sito:"                                                   Arial                                                         m.dfecha, ' al ' ,m.hfecha                                                                                                  Arial                                                         Kiif(isnull(m.deposito),'Consolidado',m.deposito+" - " + rranking1.deposito)                                                                                                                 Arial                                                         rranking.unidad                                                                                                             Arial                                                         "Acumulado"                                                  Arial                                                         " %s/Total"                                                 "@I"                                                          Arial                                                         "% s/Acum."                                                 "@I"                                                          Arial                                                         cantidad                                                      "9,999,999.99"                                                                                                              Arial                                                         Eiif(rranking.cantidad>0,round(rranking.cantidad * 100 / m.total,2),0)                                                         "999.99"                                                      Arial                                                         6iif(rranking.cantidad>0,round(acum * 100 / total,2),0)        "999.99"                                                      Arial                                                         acum                                                          cantidad                                                      0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               `Top = 75
Left = 208
Width = 381
Height = 355
DataSource = .NULL.
Name = "Dataenvironment"
                             7PROCEDURE Init
PUBLIC total
If Empty(m.deposito)
	m.deposito= null
Endif

sql('exec st_ranking_unid ?m.deposito,?oapp.empresa,?m.dFecha,?m.hFecha','rranking')
SELECT rranking
Sum cantidad To total

ENDPROC
PROCEDURE Destroy
RELEASE total

ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
      ����    �  �                        Y#   %         q     W          �  U  �  7�  � %�C�� ���% � T�� ���� �Z ��C�B exec st_ranking_unid ?m.deposito,?oapp.empresa,?m.dFecha,?m.hFecha� rranking� �� F� � K(�  �� �� U  TOTAL DEPOSITO SQL RRANKING CANTIDAD
  <�  � U  TOTAL
  �  � U  SETEO Init,     �� Destroy�     �� BeforeOpenTables	    ��1 q � A �q � 3 q 3 q 2                       �      	   �   �         "  ,      )   �                  IdEmp