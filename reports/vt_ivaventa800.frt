  �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=5
COLOR=2
                         Arial                                                         sucursal                                                      Comprobante                                                   
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Sucursal:"                                                   Arial                                                         " Fecha"                                                      Arial                                                         cn_rivaventas.fecha                                           "@E"                                                          Arial                                                         cn_rivaventas.sucursal                                                                                                      Arial                                                         cn_rivaventas.numero                                          "@@R 009-999-999999"                                          Arial                                                         "Numero"                                                      Arial                                                         cn_rivaventas.razsocial                                                                                                     Arial                                                         
"Clientes"                                                    Arial                                                         empresa                                                                                                                     Arial                                                         cn_rivaventas.ruc                                             Arial                                                         " RUC"                                                        Arial                                                         "Total General"                                                                                                             Arial                                                         "Libro IVA Venta - Ley 125"                                   Arial                                                         "MES:"                                                                                                                     Arial                                                         "A�O:"                                                       Arial                                                         $"Razon Social / Apellidos / Nombres"                          Arial                                                         "Valor Ventas"                                                Arial                                                         "Retenciones"                                                "@I"                                                          Arial                                                         cmonth(cn_rivaventas.fecha)                                   Arial                                                         year(cn_rivaventas.fecha)                                     "9999"                                                        Arial                                                         "Facturas/Notas"                                             Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 5%"                                                 Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         	"Exentas"                                                     Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         "Total"                                                       Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         "    Iva 10%"                                                 Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         iva5                                                          "999,999,999"                                                  cn_rivacompra.iva5                                           Arial                                                         "    Iva 5%"                                                  Arial                                                         iva5                                                          "999,999,999"                                                                                                               Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 10%"                                                Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         	"Orden:"                                                     Arial                                                         1IIF(m.ordenfactura='F','Fecha','Nro Comprobante')                                                                           Arial                                                         "Comprobante: ", Comprobante                                  Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         iva5                                                          "999,999,999"                                                                                                               Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         "Total: ", Comprobante                                        Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 104
Left = 2
Width = 520
Height = 200
InitialSelectedAlias = "cn_rivacompra"
DataSource = .NULL.
Name = "Dataenvironment"
                                                      	�PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
PROCEDURE Init
SET TEXTMERGE ON 
IF m.ordenfactura='F'
	m.orden = 'c.Fecha, c.Numero'
ELSE
	m.orden = 'c.Numero, c.Fecha'
ENDIF

IF EMPTY(m.vt_cpbt)
	m.vt_cpbt=null
ENDIF
IF EMPTY(m.Sucursal)
	m.sucursal=null
ENDIF
	
Comprobantes=NVL(oApp.LeerConstante("VT_CPBT_LEY125","CHAR(50)"),"'XX'")	

		      
TEXT TO cmdSQL noshow
SELECT     c.Numero, c.Fecha, c.Exenta* Cotizacion as Exentas, c.Gravada* Cotizacion  as Gravada, c.Iva * Cotizacion as Iva, total = c.TotalFactura* Cotizacion , 
					ISNULL(c.RazonSocial,p.RazSocial) as RazSocial, ISNULL(c.Ruc,p.Ruc) as Ruc, 
                      --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas5, 
                      --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas10, 
                      CASE WHEN TIPOAplica = 'M' THEN ISNULL(c.gravada* Cotizacion, 0) ELSE 0 END AS imponible, 
                      --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva5, 
                      --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva10,
                      Gravada5 * Cotizacion AS gravadas5, 
                       Gravada10 * Cotizacion AS gravadas10, 
                       iva5* Cotizacion as Iva5,
                       iva10* Cotizacion as Iva10,
                      c.Sucursal + s.Descripci�n AS Sucursal,
                      c.IdComprobante +'-' + vt_cpbt.Descripcion as Comprobante
FROM         vt_factura AS c left JOIN
                      vt_clientes AS p ON c.IdEmpresa = p.IdEmpresa AND c.IdCliente = p.IdCliente INNER JOIN
                      sucursal AS s ON c.IdEmpresa = s.IdEmpresa AND c.Sucursal = s.Sucursal INNER JOIN
                      vt_cpbt ON c.IdEmpresa = vt_cpbt.IdEmpresa AND c.IdComprobante = vt_cpbt.IdComprobante
WHERE c.idempresa =?oApp.Empresa
       AND (c.sucursal = ?m.sucursal or ?m.Sucursal is null)   
        AND MONTH(c.fecha) = ?m.mes  
        AND YEAR(c.fecha) = ?m.a�o  
        and   c.fecha between ?m.dFecha and ?m.hFecha
        and (c.IdComprobante = ?m.vt_cpbt or ?m.vt_cpbt is null)
        and (c.IdComprobante in ('FA','F1','FA','CR','FF',<<Comprobantes>>))
 ORDER BY c.Sucursal + s.Descripci�n,c.IdComprobante, <<m.orden>>

ENDTEXT



sql(cmdSQL,'cn_rIvaVentas')

SELECT cn_rivaventas



ENDPROC
         
����    �
  �
                        ��   %   
      �
  /   +
          �  U  
  �  � U  SETEOW	 G` � %���  � F��: �  T�� �� c.Fecha, c.Numero�� �b �  T�� �� c.Numero, c.Fecha�� � %�C�� ���� � T�� ���� � %�C�� ���� � T�� ���� �6 T� �CC� VT_CPBT_LEY125� CHAR(50)� � � 'XX'���	 M(� ��� �� SELECT     c.Numero, c.Fecha, c.Exenta* Cotizacion as Exentas, c.Gravada* Cotizacion  as Gravada, c.Iva * Cotizacion as Iva, total = c.TotalFactura* Cotizacion , �W �Q 					ISNULL(c.RazonSocial,p.RazSocial) as RazSocial, ISNULL(c.Ruc,p.Ruc) as Ruc, �� �z                       --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas5, �� �|                       --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas10, �v �p                       CASE WHEN TIPOAplica = 'M' THEN ISNULL(c.gravada* Cotizacion, 0) ELSE 0 END AS imponible, �r �l                       --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva5, �s �m                       --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva10,�@ �:                       Gravada5 * Cotizacion AS gravadas5, �C �=                        Gravada10 * Cotizacion AS gravadas10, �6 �0                        iva5* Cotizacion as Iva5,�8 �2                        iva10* Cotizacion as Iva10,�C �=                       c.Sucursal + s.Descripci�n AS Sucursal,�U �O                       c.IdComprobante +'-' + vt_cpbt.Descripcion as Comprobante�, �& FROM         vt_factura AS c left JOIN�r �l                       vt_clientes AS p ON c.IdEmpresa = p.IdEmpresa AND c.IdCliente = p.IdCliente INNER JOIN�m �g                       sucursal AS s ON c.IdEmpresa = s.IdEmpresa AND c.Sucursal = s.Sucursal INNER JOIN�r �l                       vt_cpbt ON c.IdEmpresa = vt_cpbt.IdEmpresa AND c.IdComprobante = vt_cpbt.IdComprobante�& �  WHERE c.idempresa =?oApp.Empresa�E �?        AND (c.sucursal = ?m.sucursal or ?m.Sucursal is null)   �+ �%         AND MONTH(c.fecha) = ?m.mes  �* �$         AND YEAR(c.fecha) = ?m.a�o  �; �5         and   c.fecha between ?m.dFecha and ?m.hFecha�F �@         and (c.IdComprobante = ?m.vt_cpbt or ?m.vt_cpbt is null)�R �L         and (c.IdComprobante in ('FA','F1','FA','CR','FF',<<Comprobantes>>))�G �A  ORDER BY c.Sucursal + s.Descripci�n,c.IdComprobante, <<m.orden>>� �  � � ��C � � cn_rIvaVentas� �� F�	 � U
  ORDENFACTURA ORDEN VT_CPBT SUCURSAL COMPROBANTES OAPP LEERCONSTANTE CMDSQL SQL CN_RIVAVENTAS BeforeOpenTables,     �� InitA     ��1 q 3 a A� A � A � A b� �
q!a!11a�1Q�!�!aQ���a!qa A �r 4                       &         A   �	      )   �
                                                                                     %ORIENTATION=1
PAPERSIZE=5
COLOR=2
                         Arial                                                         sucursal                                                      Comprobante                                                   
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Sucursal:"                                                   Arial                                                         " Fecha"                                                      Arial                                                         cn_rivaventas.fecha                                           "@E"                                                          Arial                                                         cn_rivaventas.sucursal                                                                                                      Arial                                                         cn_rivaventas.numero                                          "@@R 009-999-999999"                                          Arial                                                         "Numero"                                                      Arial                                                         cn_rivaventas.razsocial                                                                                                     Arial                                                         
"Clientes"                                                    Arial                                                         empresa                                                                                                                     Arial                                                         cn_rivaventas.ruc                                             Arial                                                         " RUC"                                                        Arial                                                         "Total General"                                                                                                             Arial                                                         "Libro IVA Venta - Ley 125"                                   Arial                                                         "MES:"                                                                                                                     Arial                                                         "A�O:"                                                       Arial                                                         $"Razon Social / Apellidos / Nombres"                          Arial                                                         "Valor Ventas"                                                Arial                                                         "Retenciones"                                                "@I"                                                          Arial                                                         cmonth(cn_rivaventas.fecha)                                   Arial                                                         year(cn_rivaventas.fecha)                                     "9999"                                                        Arial                                                         "Facturas/Notas"                                             Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 5%"                                                 Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         	"Exentas"                                                     Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         "Total"                                                       Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         "    Iva 10%"                                                 Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         iva5                                                          "999,999,999"                                                  cn_rivacompra.iva5                                           Arial                                                         "    Iva 5%"                                                  Arial                                                         iva5                                                          "999,999,999"                                                                                                               Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 10%"                                                Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         	"Orden:"                                                     Arial                                                         1IIF(m.ordenfactura='F','Fecha','Nro Comprobante')                                                                           Arial                                                         "Comprobante: ", Comprobante                                  Arial                                                         	gravadas5                                                     "999,999,999,999"                                                                                                           Arial                                                         iva10                                                         "999,999,999"                                                                                                               Arial                                                         -gravadas5 + gravadas10+ exentas+ iva5 + iva10                 "999,999,999,999"                                                                                                           Arial                                                         exentas                                                       "999,999,999,999"                                                                                                           Arial                                                         iva5                                                          "999,999,999"                                                                                                               Arial                                                         
gravadas10                                                    "999,999,999,999"                                                                                                           Arial                                                         "Total: ", Comprobante                                        Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 104
Left = 2
Width = 520
Height = 200
InitialSelectedAlias = "cn_rivacompra"
DataSource = .NULL.
Name = "Dataenvironment"
                                                      	�PROCEDURE Init
SET TEXTMERGE ON 
IF m.ordenfactura='F'
	m.orden = 'c.Fecha, c.Numero'
ELSE
	m.orden = 'c.Numero, c.Fecha'
ENDIF

IF EMPTY(m.vt_cpbt)
	m.vt_cpbt=null
ENDIF
IF EMPTY(m.Sucursal)
	m.sucursal=null
ENDIF
	
Comprobantes=NVL(oApp.LeerConstante("VT_CPBT_LEY125","CHAR(50)"),"'XX'")	

		      

TEXT TO cmdSQL noshow
SELECT     c.Numero, c.Fecha, c.Exenta* Cotizacion as Exentas, c.Gravada* Cotizacion  as Gravada, c.Iva * Cotizacion as Iva, total = c.TotalFactura* Cotizacion , 
					ISNULL(c.RazonSocial,p.RazSocial) as RazSocial, ISNULL(c.Ruc,p.Ruc) as Ruc, 
                      --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas5, 
                      --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas10, 
                      CASE WHEN TIPOAplica = 'M' THEN ISNULL(c.gravada* Cotizacion, 0) ELSE 0 END AS imponible, 
                      --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva5, 
                      --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva10,
                      Gravada5 * Cotizacion AS gravadas5, 
                       Gravada10 * Cotizacion AS gravadas10, 
                       iva5* Cotizacion as Iva5,
                       iva10* Cotizacion as Iva10,
                      c.Sucursal + s.Descripci�n AS Sucursal,
                      c.IdComprobante +'-' + vt_cpbt.Descripcion as Comprobante
FROM         vt_factura AS c left JOIN
                      vt_clientes AS p ON c.IdEmpresa = p.IdEmpresa AND c.IdCliente = p.IdCliente INNER JOIN
                      sucursal AS s ON c.IdEmpresa = s.IdEmpresa AND c.Sucursal = s.Sucursal INNER JOIN
                      vt_cpbt ON c.IdEmpresa = vt_cpbt.IdEmpresa AND c.IdComprobante = vt_cpbt.IdComprobante
WHERE c.idempresa =?oApp.Empresa
       AND (c.sucursal = ?m.sucursal or ?m.Sucursal is null)   
        AND MONTH(c.fecha) = ?m.mes  
        AND YEAR(c.fecha) = ?m.a�o  
        and   c.fecha between ?m.dFecha and ?m.hFecha
        and (c.IdComprobante = ?m.vt_cpbt or ?m.vt_cpbt is null)
        and (c.IdComprobante in ('FA','F1','FA','CR','FF',<<Comprobantes>>))
 ORDER BY c.Sucursal + s.Descripci�n,c.IdComprobante, <<m.orden>>

ENDTEXT



sql(cmdSQL,'cn_rIvaVentas')

SELECT cn_rivaventas



ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
       
����    �
  �
                        ��   %   
      �
  /   +
          �  U  W	 G` � %���  � F��: �  T�� �� c.Fecha, c.Numero�� �b �  T�� �� c.Numero, c.Fecha�� � %�C�� ���� � T�� ���� � %�C�� ���� � T�� ���� �6 T� �CC� VT_CPBT_LEY125� CHAR(50)� � � 'XX'���	 M(� ��� �� SELECT     c.Numero, c.Fecha, c.Exenta* Cotizacion as Exentas, c.Gravada* Cotizacion  as Gravada, c.Iva * Cotizacion as Iva, total = c.TotalFactura* Cotizacion , �W �Q 					ISNULL(c.RazonSocial,p.RazSocial) as RazSocial, ISNULL(c.Ruc,p.Ruc) as Ruc, �� �z                       --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas5, �� �|                       --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.precio * cantidad* Cotizacion, 0) ELSE 0 END) AS gravadas10, �v �p                       CASE WHEN TIPOAplica = 'M' THEN ISNULL(c.gravada* Cotizacion, 0) ELSE 0 END AS imponible, �r �l                       --SUM(CASE WHEN d.iva = 5 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva5, �s �m                       --SUM(CASE WHEN d.Iva = 10 THEN ISNULL(d.Valoriva* Cotizacion, 0) ELSE 0 END) AS iva10,�@ �:                       Gravada5 * Cotizacion AS gravadas5, �C �=                        Gravada10 * Cotizacion AS gravadas10, �6 �0                        iva5* Cotizacion as Iva5,�8 �2                        iva10* Cotizacion as Iva10,�C �=                       c.Sucursal + s.Descripci�n AS Sucursal,�U �O                       c.IdComprobante +'-' + vt_cpbt.Descripcion as Comprobante�, �& FROM         vt_factura AS c left JOIN�r �l                       vt_clientes AS p ON c.IdEmpresa = p.IdEmpresa AND c.IdCliente = p.IdCliente INNER JOIN�m �g                       sucursal AS s ON c.IdEmpresa = s.IdEmpresa AND c.Sucursal = s.Sucursal INNER JOIN�r �l                       vt_cpbt ON c.IdEmpresa = vt_cpbt.IdEmpresa AND c.IdComprobante = vt_cpbt.IdComprobante�& �  WHERE c.idempresa =?oApp.Empresa�E �?        AND (c.sucursal = ?m.sucursal or ?m.Sucursal is null)   �+ �%         AND MONTH(c.fecha) = ?m.mes  �* �$         AND YEAR(c.fecha) = ?m.a�o  �; �5         and   c.fecha between ?m.dFecha and ?m.hFecha�F �@         and (c.IdComprobante = ?m.vt_cpbt or ?m.vt_cpbt is null)�R �L         and (c.IdComprobante in ('FA','F1','FA','CR','FF',<<Comprobantes>>))�G �A  ORDER BY c.Sucursal + s.Descripci�n,c.IdComprobante, <<m.orden>>� �  � � ��C � � cn_rIvaVentas� �� F�	 � U
  ORDENFACTURA ORDEN VT_CPBT SUCURSAL COMPROBANTES OAPP LEERCONSTANTE CMDSQL SQL CN_RIVAVENTAS
  �  � U  SETEO Init,     �� BeforeOpenTables�	    ��1 a A� A � A � A b� �
q!a!11a�1Q�!�!aQ���a!qa A �r 5 q 2                       z	     -   �	  �	  :    )   �
                                                                               