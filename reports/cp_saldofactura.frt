   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              dataenvironment                                               Arial                                                         HORIENTATION=0
PAPERSIZE=1
PAPERLENGTH=2794
PAPERWIDTH=2159
COLOR=2
                                                      idproveedor                                                   empresa                                                                                                                     Arial                                                         "Saldos a Pagar por Proveedor"                                Arial                                                         "  Proveedor"                                                 Arial                                                         cp_rvencefactu.facturaproveedor                                                                                             Arial                                                         "En Fecha :"                                                  Arial                                                         SaldoGS                                                       "@Z 9,999,999,999"                                             cp_rvencefactu.saldo                                         Arial                                                         "Saldo GS"                                                   Arial                                                         "Comprobante"                                                 Arial                                                         $cp_rvencefactu.idproveedor," ",razon                                                                                        Arial                                                         "Fecha Factura"                                              Arial                                                         cp_rvencefactu.fecha                                          "@D"                                                                                                                        Arial                                                         m.Fecha                                                       "@D"                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         "Total Proveedor"                                             Arial                                                         "Total General "                                                                                                            Arial                                                         SaldoUSD                                                      "@Z 9,999,999,999.99"                                          cp_rvencefactu.saldo                                         Arial                                                         "Saldo U$S"                                                  Arial                                                         SaldoUSD                                                      "@Z 999,999,999,999.99"                                       Arial                                                         SaldoGS                                                       "@Z 999,999,999,999"                                          Arial                                                         SaldoUSD                                                      "@Z 999,999,999,999.99"                                       Arial                                                         SaldoGS                                                       "@Z 999,999,999,999"                                          Arial                                                         lower(LCSELEREPO)                                             Arial                                                         Importe                                                       "@Z 9,999,999,999.99"                                          cp_rvencefactu.saldo                                         Arial                                                         	"Importe"                                                     Arial                                                         SaldoGS                                                       *iif(IdMoneda='GS',Importe-nvl(pagado,0),0)                    0                                                             SaldoUSD                                                      +iif(IdMoneda='U$S',importe-nvl(pagado,0),0)                   0                                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         �Top = 94
Left = 16
Width = 555
Height = 285
InitialSelectedAlias = "cp_rvencefactu"
DataSource = .NULL.
Name = "Dataenvironment"
                                                     �PROCEDURE Init
LOCAL strsql


IF EMPTY(m.dproveedor)
	m.dproveedor=null
ENDIF
	
	
SET DATABASE TO DATOS 
TEXT TO cmdSQL noshow
SELECT     SUM(isnull(pd.importe,0) + (isnull(nc.total,0) *-1) ) AS Pagado,f.IdProveedor, f.FacturaProveedor, f.Fecha, f.IdFactura, f.Total as Importe, cp_proveedor.Razon, f.IdMoneda
FROM         cp_proveedor INNER JOIN
                      cp_factura AS f ON cp_proveedor.IdEmpresa = f.IdEmpresa AND cp_proveedor.IdProveedor = f.IdProveedor LEFT OUTER JOIN
                      cp_pagosdet_base AS pd INNER JOIN
                      cp_pagos_base AS p ON pd.idpago = p.idpago ON f.IdFactura = pd.idfactura AND p.fecha <=?m.Fecha
left join cp_factura AS nc on f.IdEmpresa=nc.IdEmpresa and f.IdProveedor = nc.IdProveedor and f.FacturaProveedor = nc.FacturaProveedor_ref
INNER JOIN cp_condicion c ON f.IdEmpresa = c.idempresa AND f.IdCondicion = c.idcondicion
where 
	AND (f.idproveedor BETWEEN ?m.dproveedor AND ?m.hproveedor or ?m.dproveedor  is null)
	AND (f.Fecha <= ?m.Fecha)
	And f.idempresa= ?oApp.Empresa
	and f.FacturaProveedor_ref is null
	and c.plazo>0
	and YEAR(f.fecha)>2008
GROUP BY f.IdProveedor,f.FacturaProveedor, f.Fecha, f.IdFactura, f.Total, cp_proveedor.Razon, f.IdMoneda
having SUM(isnull(pd.importe,0) + (isnull(nc.total,0) *-1) )<>f.Total
order by  f.Idproveedor, f.Fecha
ENDTEXT

=sql(cmdSQL ,'cp_rvencefactu')
SELECT cp_rvencefactu




ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                                 ����    �  �                        u�   %   �      P               �  U  o ��  � %�C�� ���% � T�� ���� � G(� DATOS�	 M(� ��� �� SELECT     SUM(isnull(pd.importe,0) + (isnull(nc.total,0) *-1) ) AS Pagado,f.IdProveedor, f.FacturaProveedor, f.Fecha, f.IdFactura, f.Total as Importe, cp_proveedor.Razon, f.IdMoneda�* �$ FROM         cp_proveedor INNER JOIN�� ��                       cp_factura AS f ON cp_proveedor.IdEmpresa = f.IdEmpresa AND cp_proveedor.IdProveedor = f.IdProveedor LEFT OUTER JOIN�= �7                       cp_pagosdet_base AS pd INNER JOIN�{ �u                       cp_pagos_base AS p ON pd.idpago = p.idpago ON f.IdFactura = pd.idfactura AND p.fecha <=?m.Fecha�� �� left join cp_factura AS nc on f.IdEmpresa=nc.IdEmpresa and f.IdProveedor = nc.IdProveedor and f.FacturaProveedor = nc.FacturaProveedor_ref�^ �X INNER JOIN cp_condicion c ON f.IdEmpresa = c.idempresa AND f.IdCondicion = c.idcondicion� � where �\ �V 	AND (f.idproveedor BETWEEN ?m.dproveedor AND ?m.hproveedor or ?m.dproveedor  is null)�  � 	AND (f.Fecha <= ?m.Fecha)�% � 	And f.idempresa= ?oApp.Empresa�) �# 	and f.FacturaProveedor_ref is null� � 	and c.plazo>0� � 	and YEAR(f.fecha)>2008�n �h GROUP BY f.IdProveedor,f.FacturaProveedor, f.Fecha, f.IdFactura, f.Total, cp_proveedor.Razon, f.IdMoneda�K �E having SUM(isnull(pd.importe,0) + (isnull(nc.total,0) *-1) )<>f.Total�& �  order by  f.Idproveedor, f.Fecha� � ��C � � cp_rvencefactu� �� F� � U  STRSQL
 DPROVEEDOR DATOS CMDSQL SQL CP_RVENCEFACTU
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 q � A � � ��	��	�� �Q�A���aA �q 6 q 2                       �        �  �  &    )   �                    Usuario = RTRIM(u.last_name) + ' ' + u.first_name,�X