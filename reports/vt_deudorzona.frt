   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Enviar a OneNote 2007
OUTPUT=Send To Microsoft OneNote Port:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=120
COLOR=1
YRESOLUTION=144
                                                                    Z  )  winspool  Enviar a OneNote 2007  Send To Microsoft OneNote Port:                                                     �Enviar a OneNote 2007 S3         � � /        d   x   �    Letter                                                                                wpno               �          �                                                                                                                      \K hC                             x�d�      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   @  SMTJ     0T O S H I B A   e - S T U D I O 4 5 1 c   P S 3   Resolution 600dpi PageSize Letter PageRegion  InputSlot Auto MediaType Plain Duplex None Collate True OutputBin Bin2 Stapling Off HolePunch Off PrintMode Normal DINDigit1 0 DINDigit2 0 DINDigit3 0 DINDigit4 0 DINDigit5 0 DeptCode False DCDigit1 0 DCDigit2 0 DCDigit3 0 DCDigit4 0 DCDigit5 0 ColorResType ColorLowGeneral DistinguishThinLines True BlackOverPrint True PureBlackGray BlackGrayAuto TonerSave False BlankPage False Smoothing True                                                                                    Arial                                                         vt_rresumensaldos.idmoneda                                    	IdZonaCom                                                     &"Saldo de Clientes por Zona Comercial"                        Arial                                                         empresa                                                       Arial                                                         "Saldo"                                                       Arial                                                         	"Cliente"                                                                                                                   Arial                                                         	idCliente                                                     Arial                                                         
"Per�odo:"                                                    Arial                                                         1"Desde " + dtoc(m.dfecha)+ " al " +dtoc(m.hfecha)                                                                           Arial                                                         vt_rresumensaldos.saldo                                       "@Z 999,999,999.99"                                           Arial                                                         "Total : " + ZonaComercial                                    Arial                                                         vt_rresumensaldos.saldo                                       "@Z 999,999,999,999.99"                                       Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         "Vencimientos:"                                               Arial                                                         1"Desde " + dtoc(m.dvence)+ " al " +dtoc(m.hvence)                                                                           Arial                                                         -"Total Moneda : " +vt_rresumensaldos.idmoneda                                                                               Arial                                                         vt_rresumensaldos.saldo                                       "@Z 999,999,999,999.99"                                                                                                     Arial                                                         "Moneda: ", IdMoneda                                          Arial                                                         2"Zona Comercial: ", IdzonaCom + ' '+ ZonaComercial            Arial                                                         Alltrim(razSocial)                                            Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 78
Left = 169
Width = 555
Height = 347
InitialSelectedAlias = "vt_rresumensaldos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                 �PROCEDURE Init
LOCAL strsql
DO SETEO

SET DATABASE TO datos

If Empty(m.idcliente)
	m.idcliente = null
ENDIF

IF EMPTY(m.ZonaCom)
	m.ZonaCom = null
ENDIF
	

TEXT TO cmdSQL noshow
		select a.idcliente, SUM(a.saldo) as Saldo, 
		a.idmoneda, c.razsocial, c.IDzonaCom, zc.Descripcion as ZonaComercial
		from vt_Forma_Pago a inner join vt_clientes c on a.idcliente = c.idcliente and a.IdEmpresa = c.IdEmpresa 
		left join vt_ZonaCom zc on c.IdEmpresa=zc.IdEmpresa and c.IdZonaCom = zc.IdZonaCom
		where (a.idcliente = ?m.idcliente or ?m.idcliente is null)
		and a.fecha BETWEEN ?m.dfecha and ?m.hfecha 
		and (c.IdZonaCom = ?m.ZonaCom or ?m.ZonaCom is null)
		and a.vencimiento BETWEEN ?m.dvence and ?m.hvence 
		and a.saldo <> 0
		and a.IdEmpresa=?oApp.Empresa 
		group by a.idcliente, a.idmoneda, c.razsocial, c.idzonacom,zc.descripcion 
		ORDER BY a.idmoneda,c.IdZonaCom, a.IDCLIENTE

ENDTEXT

	

=sql(cmdSQL ,'vt_rresumensaldos')
SELECT vt_rresumensaldos

ENDPROC
                     ����    �  �                        9�   %         Z     "          �  U  � ��  � � � G(� datos� %�C�� ���: � T�� ���� � %�C�� ���\ � T�� ���� �	 M(� ��3 �- 		select a.idcliente, SUM(a.saldo) as Saldo, �M �G 		a.idmoneda, c.razsocial, c.IDzonaCom, zc.Descripcion as ZonaComercial�q �k 		from vt_Forma_Pago a inner join vt_clientes c on a.idcliente = c.idcliente and a.IdEmpresa = c.IdEmpresa �Z �T 		left join vt_ZonaCom zc on c.IdEmpresa=zc.IdEmpresa and c.IdZonaCom = zc.IdZonaCom�B �< 		where (a.idcliente = ?m.idcliente or ?m.idcliente is null)�4 �. 		and a.fecha BETWEEN ?m.dfecha and ?m.hfecha �< �6 		and (c.IdZonaCom = ?m.ZonaCom or ?m.ZonaCom is null)�: �4 		and a.vencimiento BETWEEN ?m.dvence and ?m.hvence � � 		and a.saldo <> 0�& �  		and a.IdEmpresa=?oApp.Empresa �R �L 		group by a.idcliente, a.idmoneda, c.razsocial, c.idzonacom,zc.descripcion �4 �. 		ORDER BY a.idmoneda,c.IdZonaCom, a.IDCLIENTE� �  � �" ��C � � vt_rresumensaldos� �� F� � U  STRSQL SETEO DATOS	 IDCLIENTE ZONACOM CMDSQL SQL VT_RRESUMENSALDOS Init,     ��1 q q � � A � A � 1��!A���a!Aa A $q 2                       �      )   �                   IDCOMPROBANTE
 CMDGENERAR CLICK RUNSQL
 CONTAINER1 TSFA