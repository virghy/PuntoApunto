   q   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
                         Arial                                                         "Balance General"                                                                                                           Arial                                                         	m.empresa                                                                                                                   Arial                                                         "Cuenta"                                                      Arial                                                         "Descripci�n"                                                Arial                                                         "Saldo"                                                       Arial                                                         replicate(' ',nivel*5)+ cuenta                                                                                              Arial                                                         	"Periodo"                                                     Arial                                                         (dtoc(m.dfecha) + " al " + dtoc(m.hfecha)                                                                                    Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         saldo                                                         "999,999,999,999"                                                                                                           Arial                                                         dec=0                                                         saldo                                                         "9,999,999,999.99"                                                                                                          Arial                                                         DEC >0                                                        "RESULTADO DEL EJERCICIO"                                                                                                   Arial                                                         saldo                                                         "999,999,999,999"                                                                                                           Arial                                                         nivel = 6 .and. dec = 0                                       niif( left( cuenta,1 ) = "5" .AND. nivel = 1, saldo * -1, iif( left( cuenta,1) = "4" .and. nivel = 1, saldo,0))                "999,999,999,999,999.99"                                                                                                    Arial                                                         6'Moneda: ',iif(m.tipoMoneda='L','Guaranies','Dolares')                                                                      Arial                                                         "Centro Costo"                                                Arial                                                         (iif(m.centro='%', 'Todos',centro.centro)                                                                                    Arial                                                         
"Sucursal"                                                    Arial                                                         )iif(m.sucursal='%', 'Todos',suc.sucursal)                                                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 62
Left = 100
Width = 520
Height = 200
InitialSelectedAlias = "rcuentas"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          �PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
PUBLIC m.dec

IF m.tipomoneda = 'L'
     m.decimales = 0
     m.dec = 0
ELSE
     m.decimales = 2
     m.dec = 2
ENDIF

IF EMPTY(m.dcuenta)
	m.dcuenta='1'
ENDIF

IF EMPTY(m.hcuenta)
	m.hcuenta='9'
ENDIF
	

IF EMPTY(m.sucursal)
     m.sucursal = '%'
ELSE
     = sql('Select descripci�n sucursal from sucursal where idempresa = ?oApp.Empresa and sucursal = ?m.sucursal','Suc')
ENDIF

IF EMPTY(m.centro)
     m.centro = '%'
ELSE
     = sql('Select descripci�n centro from centros where idempresa = ?oApp.Empresa and centro = ?m.centro','Centro')
ENDIF

= sql('exec cn_balance ?oApp.empresa, ?m.dfecha,?m.hfecha, ?oApp.Ejercicio, ?m.sucursal, ?m.centro, ?m.TipoMoneda','Saldos')

SELECT saldos

SET FILTER TO nivel <= m.nivel AND BETWEEN(LEFT(cuenta,10),m.dcuenta,m.hCuenta)
GOTO TOP



ENDPROC
                                                            &���                              �.   %   L      �      t          �  U  
  �  � U  SETEO�	 7��  � %��� � L��; � T�� �� �� T��  �� �� �a � T�� ���� T��  ���� � %�C�� ���� � T�� �� 1�� � %�C�� ���� � T�� �� 9�� � %�C�� ���� � T�� �� %�� �O�w ��C�d Select descripci�n sucursal from sucursal where idempresa = ?oApp.Empresa and sucursal = ?m.sucursal� Suc� �� � %�C�� ���t� T�� �� %�� ���s ��C�] Select descripci�n centro from centros where idempresa = ?oApp.Empresa and centro = ?m.centro� Centro� �� �� ��C�j exec cn_balance ?oApp.empresa, ?m.dfecha,?m.hfecha, ?oApp.Ejercicio, ?m.sucursal, ?m.centro, ?m.TipoMoneda� Saldos� �� F� �) G(��	 ��	 � CC�
 �
=�� �� �	�� #)� U  DEC
 TIPOMONEDA	 DECIMALES DCUENTA HCUENTA SUCURSAL SQL CENTRO SALDOS NIVEL CUENTA BeforeOpenTables,     �� InitA     ��1 q 3 � B� � � � � A A A � qA � 1A r �Q 4                       &         A   v      )                     THIS LFIRSTREPORT