   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
                         Arial                                                         n�mero                                                        'Lista de Asientos'                                                                                                         Arial                                                         empresa                                                                                                                     Arial                                                         cuenta                                                                                                                      Arial                                                         	"Cuenta"                                                     Arial                                                         "Debe"                                                        Arial                                                         "Haber"                                                       Arial                                                         n�mero                                                        "99999"                                                                                                                     Arial                                                         "Fecha:"                                                      Arial                                                         fecha                                                                                                                       Arial                                                         "Nota:"                                                       Arial                                                         nota                                                                                                                        Arial                                                         !descripci�n, ' - ',  CentroNombre                                                                                           Arial                                                         debe                                                          "@Z 999,999,999,999"                                                                                                        Arial                                                         dec <= 0                                                      haber                                                         "@Z 999,999,999,999"                                                                                                        Arial                                                         dec <= 0                                                      debe                                                          "@Z 999,999,999.99"                                                                                                         Arial                                                         dec > 0                                                       haber                                                         "@Z 999,999,999.99"                                                                                                         Arial                                                         dec > 0                                                       debe                                                          "999,999,999,999"                                                                                                           Arial                                                         dec <= 0                                                      haber                                                         "999,999,999,999"                                                                                                           Arial                                                         dec <= 0                                                      debe                                                          "999,999,999.99"                                                                                                            Arial                                                         dec > 0                                                       haber                                                         "999,999,999.99"                                                                                                            Arial                                                         dec > 0                                                                                                                                                                                   "Rango:"                                                      Arial                                                         9alltrim(str(m.dnumero)) + 'al ' + alltrim(Str(m.hnumero))                                                                                                                                   Arial                                                         
"Per�odo:"                                                    Arial                                                         'dtoc(m.dfecha) + ' al ' +dtoc(m.hfecha)                                                                                     Arial                                                         "Sucursal:"                                                   Arial                                                         	"N�mero:"                                                     Arial                                                         debe                                                          "@Z 999,999,999,999"                                                                                                        Arial                                                         dec <= 0                                                      haber                                                         "@Z 999,999,999,999"                                                                                                        Arial                                                         dec <= 0                                                      debe                                                          "@Z 999,999,999.99"                                                                                                         Arial                                                         dec > 0                                                       haber                                                         "@Z 999,999,999.99"                                                                                                         Arial                                                         dec > 0                                                       
"Totales:"                                                    Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         *iif(m.sucursal='%','Todos',SucursalNombre)                                                                                  Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 220
Left = 1
Width = 520
Height = 200
InitialSelectedAlias = "rasientos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          uPROCEDURE BeforeOpenTables
DO seteo
ENDPROC
PROCEDURE Destroy
RELEASE dec
ENDPROC
PROCEDURE Init
PUBLIC dec
dec = 0

TEXT TO cmdSQL noshow
SELECT sucursalNombre,n�mero,fecha, descripci�n AS nota, sucursal, CentroNombre,
cuenta, debe, haber, idconcepto, documento, centro, detalle, CuentaNombre as descripci�n,iddetalle 
FROM cn_vAsientos
WHERE (n�mero BETWEEN ?m.dnumero AND ?m.hnumero) 
	AND (fecha BETWEEN ?m.dfecha AND ?m.hfecha) AND sucursal like  ?m.sucursal 
	and IdEmpresa=?oApp.Empresa
	ORDER BY n�mero ,iddetalle

ENDTEXT


IF sql(cmdSQL ,'rAsientos') > 0
     SELECT rasientos
ENDIF

ENDPROC
        S���    :  :                        �n   %   n      �     �          �  U  
  �  � U  SETEO
  <�  � U  DEC� 7�  � T�  �� ��	 M(� ��V �P SELECT sucursalNombre,n�mero,fecha, descripci�n AS nota, sucursal, CentroNombre,�i �c cuenta, debe, haber, idconcepto, documento, centro, detalle, CuentaNombre as descripci�n,iddetalle � � FROM cn_vAsientos�7 �1 WHERE (n�mero BETWEEN ?m.dnumero AND ?m.hnumero) �R �L 	AND (fecha BETWEEN ?m.dfecha AND ?m.hfecha) AND sucursal like  ?m.sucursal �" � 	and IdEmpresa=?oApp.Empresa�! � 	ORDER BY n�mero ,iddetalle� �  � �" %�C � �	 rAsientos� � ���� F� � � U  DEC CMDSQL SQL	 RASIENTOS BeforeOpenTables,     �� DestroyA     �� InitT     ��1 q 2 q 2 q � � a�qq!!a A #q A 2                       $         B   M         h   j      )   :                   U  PRODUCTO CMDSQL SQL RINGRE
 