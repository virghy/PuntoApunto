   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
                         Arial                                                         	"Valores"                                                     
"Facturas"                                                    "Recibo de Dinero"                                            Arial                                                         oApp.NombreEmpresa                                            Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         "Recib� de ", Facturas.cliente                                Arial                                                         Valores.Importe                                               "999,999,999,999.99"                                          Arial                                                         "Nro"                                                         Arial                                                         *facturas.IdComprobante,'-',Facturas.numero                    Arial                                                         Facturas.importe                                              "999,999,999,999.99"                                          Arial                                                         Facturas.num_recibo                                           Arial                                                         "RUC ",Facturas.ruc                                           Arial                                                         "Total"                                                       Arial                                                         "La Cantidad de ",mLetras                                     Arial                                                         "Tipo"                                                       Arial                                                         "Nro"                                                         Arial                                                         "Fecha"                                                       Arial                                                         "Banco"                                                       Arial                                                         	"Importe"                                                     Arial                                                         "Detalle de Valores"                                         Arial                                                         Valores.TipoValor                                             Arial                                                         Valores.FchCheque                                             Arial                                                         Valores.NroCheque                                             Arial                                                         Valores.Banco                                                 Arial                                                         "Nro"                                                         Arial                                                         "Fecha"                                                       Arial                                                         "Cuota"                                                       Arial                                                         	"Importe"                                                     Arial                                                         "Detalle de Facturas"                                        Arial                                                         Facturas.FechaFact                                            "@D"                                                          Arial                                                         Facturas.Cuota                                                Arial                                                         Facturas.importe                                              "999,999,999,999.99"                                          Arial                                                         "En concepto de  "                                            Arial                                                         "Fecha  ",Facturas.Fecha                                      Arial                                                         "Firma y Sello Autorizada "                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 62
Left = 4
Width = 759
Height = 448
InitialSelectedAlias = "vt_rdiariocontrol"
DataSource = .NULL.
Name = "Dataenvironment"
                                                   �PROCEDURE Init

TEXT TO cmdSQL NOSHOW 
	select a.idpago,a.sucursal,a.num_recibo,a.tip_reci,a.fecha,rtrim(a.idcliente)+'-'+c.razsocial cliente,
	rtrim(a.idcobrador)+'-'+rtrim(e.nombre)+' '+rtrim(e.apellido) cobrador,c.Ruc,
	b.numero,b.idmoneda,b.importe,b.importe_pag,f.fecha fechafact,TotalFacturas,f.Idcomprobante,b.Cuota
	from vt_pagos a inner join vt_det_pagos b on a.idpago=b.idpago 
	and a.idempresa=?oApp.empresa 
	left join vt_clientes c on a.idcliente=c.idcliente and a.IdEmpresa = c.idempresa
	left join vt_cobradores d on a.idcobrador=d.idcobrador  and a.IdEmpresa = d.idempresa
	left join bs_personas e on d.idpersona=e.idpersona 
	left join vt_factura f on b.idfactura=f.idfactura 
	where a.IdPago = ?m.IdRecibo
ENDTEXT 
=sql(cmdSQL,'Facturas')
	
*	sql('exec vt_recibo ?oapp.empresa,?m.dFecha,?m.hFecha,?m.idcobrador','vt_rrecibo')
	SELECT Facturas
TEXT TO cmdSQL NOSHOW 
SELECT     v.nrocheque, v.fchcheque, v.importe, b.descripcion AS Banco, tv.tipovalor,IdCobro
FROM         ts_valores_base AS v LEFT OUTER JOIN
                      bs_bancos AS b ON v.idbanco = b.idbanco LEFT OUTER JOIN
                      ts_tipovalor AS tv ON v.idtipovalor = tv.idtipovalor
                      where v.IdCobro= ?m.IdRecibo

ENDTEXT
=sql(cmdSQL,'Valores')

	
PUBLIC mLetras



mLetras= ALLTRIM(numeral(int(TotalFacturas)))

m.decimales=IIF(Idmoneda='GS',0,2)
IF m.decimales > 0
	mletras = "DOLARES " + mletras 
	mLetras = mLetras + ' CON ' + SUBSTR(STR(TotalFacturas - INT(TotalFacturas),3,2),2) + '/100'
ELSE 
	mletras = "GUARANIES " + mletras 
ENDIF

	
SELECT Valores
INDEX on IdCobro TAG Nro

SELECT Facturas
INDEX on IdPago TAG Nro


CREATE CURSOR cRecibo (IdRecibo I)
SELECT cRecibo
APPEND BLANK
replace IdRecibo WITH m.IdRecibo

SET RELATION TO IdRecibo INTO Valores ADDITIVE  
SET RELATION TO IdRecibo INTO Facturas ADDITIVE  


ENDPROC
PROCEDURE BeforeOpenTables
Do seteo
ENDPROC
                      ����    �  �                        }8   %   �      :  .   �          �  U  �	 M(�  ��m �g 	select a.idpago,a.sucursal,a.num_recibo,a.tip_reci,a.fecha,rtrim(a.idcliente)+'-'+c.razsocial cliente,�T �N 	rtrim(a.idcobrador)+'-'+rtrim(e.nombre)+' '+rtrim(e.apellido) cobrador,c.Ruc,�j �d 	b.numero,b.idmoneda,b.importe,b.importe_pag,f.fecha fechafact,TotalFacturas,f.Idcomprobante,b.Cuota�F �@ 	from vt_pagos a inner join vt_det_pagos b on a.idpago=b.idpago �% � 	and a.idempresa=?oApp.empresa �W �Q 	left join vt_clientes c on a.idcliente=c.idcliente and a.IdEmpresa = c.idempresa�\ �V 	left join vt_cobradores d on a.idcobrador=d.idcobrador  and a.IdEmpresa = d.idempresa�: �4 	left join bs_personas e on d.idpersona=e.idpersona �9 �3 	left join vt_factura f on b.idfactura=f.idfactura �# � 	where a.IdPago = ?m.IdRecibo� � ��C �  � Facturas� �� F� �	 M(�  ��b �\ SELECT     v.nrocheque, v.fchcheque, v.importe, b.descripcion AS Banco, tv.tipovalor,IdCobro�7 �1 FROM         ts_valores_base AS v LEFT OUTER JOIN�S �M                       bs_bancos AS b ON v.idbanco = b.idbanco LEFT OUTER JOIN�P �J                       ts_tipovalor AS tv ON v.idtipovalor = tv.idtipovalor�8 �2                       where v.IdCobro= ?m.IdRecibo� �  � � ��C �  � Valores� �� 7� � T� �CCC� 8� ���# T�� �C� � GS� � � �6�� %��� � ��K� T� �� DOLARES � ��5 T� �� �  CON CC� C� 8��Z�\� /100�� �n� T� ��
 GUARANIES � �� � F� � & ��	 ���
 � F� � & �� ���
 � h�� cRecibo� � I� F� � � >� ���� �� G-(�� ��� � G-(�� ��� � U  CMDSQL SQL FACTURAS MLETRAS NUMERAL TOTALFACTURAS	 DECIMALES IDMONEDA VALORES IDCOBRO NRO IDPAGO CRECIBO IDRECIBO
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � �A�aQq���1A �s � !q1�a A �s T21�Q� �A s � r � �q Q � 4 q 1                       m     ,   �  �  >    )   �                  PORTE LVALI