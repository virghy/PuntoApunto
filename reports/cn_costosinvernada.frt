   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
DIO451c PS3
OUTPUT      �Top = 66
Left = 20
Width = 792
Height = 419
InitialSelectedAlias = "cn_rcostos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          dataenvironment                                               Arial                                                         Arial                                                         ""Planilla de costos de producci�n"                                                                                          Arial                                                         empresa                                                                                                                     Arial                                                         "Cuenta"                                                      Arial                                                         "Descripci�n"                                                Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         "Total"                                                       "@J"                                                                                                                        Arial                                                         cn_rcostos.saldo                                              "999,999,999,999.99"                                          Arial                                                         m.Decimales>0                                                 "Costo/Cabeza"                                                "@J"                                                                                                                        Arial                                                         /round(cn_rcostos.saldo / m.cabeza ,m.decimales)               "999,999.999"                                                 Arial                                                         m.Decimales>0                                                 "Costo/Kilo"                                                  "@J"                                                                                                                        Arial                                                         m.kilo>1                                                      ;round((cn_rcostos.saldo / m.cabeza ) / m.kilo1,m.decimales)                                                                   "999,999.999"                                                 Arial                                                         m.kilo>1 and m.Decimales>0                                    (round(cn_rcostos.saldo * 100  / total,2)                      "999.99"                                                      Arial                                                         "Centro Costo:"                                               Arial                                                         cn_rcostos.cuenta                                                                                                           Arial                                                         'dtoc(m.dfecha) + " - " + dtoc(m.hfecha)                                                                                     Arial                                                         	"Periodo"                                                     Arial                                                         cn_rcostos.descripci�n                                        Arial                                                         "%"                                                           "@J"                                                                                                                        Arial                                                         m.kilo1                                                       
"@B 99999"                                                    Arial                                                         m.kilo>1                                                      m.cabeza                                                                                                                    Arial                                                         cn_rcostos.saldo                                              "999,999,999,999"                                             Arial                                                         m.Decimales=0                                                 .round(cn_rcostos.saldo / m.cabeza,m.decimales)                "999,999,999"                                                 Arial                                                         m.Decimales=0                                                 :round((cn_rcostos.saldo / m.cabeza) / m.kilo1,m.decimales)                                                                    "999,999,999"                                                 Arial                                                         m.kilo>1 and m.Decimales=0                                    100                                                           "999.99"                                                                                                                    Arial                                                         "Total"                                                       "@J"                                                                                                                        Arial                                                         Iiif(empty(m.centro),"Todos",m.centro + " - " +  vcentrocosto.descripci�n)                                                                                                                   Arial                                                         m.totalcabeza                                                                                                               Arial                                                         "Promedio General de Cabezas:"                                Arial                                                         Biif(m.tipoganado = 'C', 'Promedio de Cabezas','Terneros Marcados')                                                                                                                          Arial                                                         Kiif(m.tipoganado = 'C', 'Produccion Kilo Promedio','Kilo Promedio Destete')                                                   Arial                                                         m.kilo>1                                                      6'Moneda: '+iif(m.tipoMoneda='L','Guaranies','Dolares')                                                                      Arial                                                         m.kilo                                                        Arial                                                         "Total Kg. producidos:"                                       Arial                                                         
"Costo/Ha"                                                    "@J"                                                          Arial                                                         m.kilo>1                                                      ,round(cn_rcostos.saldo / m.Has ,m.decimales)                  "999,999.999"                                                 Arial                                                         m.kilo>1 and m.Decimales>0                                    ,round(cn_rcostos.saldo / m.Has ,m.decimales)                  "999,999,999"                                                 Arial                                                         m.kilo>1 and m.Decimales=0                                    m.Has                                                         Arial                                                         "Hect�rea Util:"                                              Arial                                                         cn_rcostos.saldo                                              "999,999,999,999"                                             Arial                                                         m.Decimales=0                                                 /round(cn_rcostos.saldo / m.cabeza ,m.decimales)               "999,999,999"                                                 Arial                                                         m.Decimales=0                                                 ;round((cn_rcostos.saldo / m.cabeza ) / m.kilo1,m.decimales)                                                                   "999,999,999"                                                 Arial                                                         m.kilo>1 and m.Decimales=0                                    ,round(cn_rcostos.saldo / m.Has ,m.decimales)                  "999,999,999"                                                 Arial                                                         m.kilo>1 and m.Decimales=0                                    kilo1                                                         m.kilo/m.cabeza                                               m.kilo/m.cabeza                                               Arial                                                         Arial                                                         Arial                                                         Arial                                                        -PROCEDURE Init
DO SETEO
PUBLIC total, decimales, m.tipoGanado
IF m.tipomoneda = 'L'
     m.decimales = 0
ELSE
     m.decimales = 3
ENDIF
TEXT TO cmdSQL noshow
	SELECT * 
	FROM dbo.cn_saldoCuenta(?oApp.Empresa,?m.dcuenta,?m.hcuenta,?m.centro,?m.dfecha,?m.hFecha,?m.TipoMoneda)
ENDTEXT

=sql(cmdSQL,'cn_rcostos')
SELECT cn_rcostos
=sql("Select Descripci�n from centros where IdEmpresa=?oApp.Empresa and Centro = ?m.Centro",'vcentrocosto')
SUM Saldo TO Total
m.TipoGanado='C'

ENDPROC
PROCEDURE Destroy
RELEASE  total, decimales
ENDPROC
                ����    �  �                        W�   %   9      �     X          �  U  � �  � 7� � �� � %��� � L��; � T�� �� �� �R � T�� ���� �	 M(� �� �
 	SELECT * �o �i 	FROM dbo.cn_saldoCuenta(?oApp.Empresa,?m.dcuenta,?m.hcuenta,?m.centro,?m.dfecha,?m.hFecha,?m.TipoMoneda)� � ��C � �
 cn_rcostos� �� F� �p ��C�T Select Descripci�n from centros where IdEmpresa=?oApp.Empresa and Centro = ?m.Centro� vcentrocosto� �� K(� �� �� T�� �� C�� U	  SETEO TOTAL	 DECIMALES
 TIPOGANADO
 TIPOMONEDA CMDSQL SQL
 CN_RCOSTOS SALDO  <�  � � U  TOTAL	 DECIMALES Init,     �� Destroy    ��1 q A� � � A � �A �q � 3 � 1                       �        	  "      )   �                  tock',