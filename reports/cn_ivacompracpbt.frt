  �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=5
COLOR=2
                         Arial                                                         sucursal                                                      ComprobanteDesc                                               
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         "Sucursal:"                                                   Arial                                                         " Fecha"                                                      Arial                                                         cn_rivacompra.fechacomprobante                                                                                              Arial                                                         cn_rivacompra.sucursal                                                                                                      Arial                                                         cn_rivacompra.comprobante                                                                                                   Arial                                                         "Numero"                                                      Arial                                                         cn_rivacompra.gravadas5                                       "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 5%"                                                 Arial                                                         cn_rivacompra.iva10                                           "999,999,999"                                                                                                               Arial                                                         	"Exentas"                                                     Arial                                                         ccn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible                           "999,999,999,999"                                                                                                           Arial                                                         "Total"                                                       Arial                                                         cn_rivacompra.exentas                                         "999,999,999,999"                                                                                                           Arial                                                         "    Iva 10%"                                                 Arial                                                         cn_rivacompra.razon                                                                                                         Arial                                                          " Proveedor de Bienes/Servicios"                              Arial                                                         empresa                                                                                                                     Arial                                                         "Total General"                                                                                                             Arial                                                         "Documento"                                                  Arial                                                         "Iva Compra por Comprobante"                                                                                                Arial                                                         "MES:"                                                                                                                     Arial                                                         "A�O:"                                                       Arial                                                         $"Razon Social / Apellidos / Nombres"                          Arial                                                         "Valor de Compras / Servicios"                                Arial                                                         "ImportacionesBase Imponible"                               "@I"                                                          Arial                                                         4cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',1,0)          "999,999,999,999"                                             Arial                                                         0cn_rivacompra.iva10 * IIF(TipoOperacion='D',1,0)              "999,999,999"                                                 Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',1,0)                                                           "999,999,999,999"                                             Arial                                                         2cn_rivacompra.exentas * IIF(TipoOperacion='D',1,0)            "999,999,999,999"                                             Arial                                                         &CMONTH(cn_rivacompra.fechacomprobante)                                                                                      Arial                                                         $year(cn_rivacompra.fechacomprobante)                          "9999"                                                                                                                      Arial                                                         	Imponible                                                     "999,999,999,999"                                                                                                           Arial                                                         %Imponible* IIF(TipoOperacion='D',1,0)                         "999,999,999,999"                                             Arial                                                          cn_rivacompra.iva5                                           "999,999,999"                                                  cn_rivacompra.iva5                                           Arial                                                         "    Iva 5%"                                                  Arial                                                         /cn_rivacompra.iva5 * IIF(TipoOperacion='D',1,0)               "999,999,999"                                                 Arial                                                         cn_rivacompra.gravadas10                                      "999,999,999,999"                                                                                                           Arial                                                         "Gravadas 10%"                                                Arial                                                         5cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',1,0)         "999,999,999,999"                                             Arial                                                         ruc                                                                                                                         Arial                                                         "RUC"                                                         Arial                                                         	"Periodo"                                                     Arial                                                         (dtoc(m.dfecha) + " al " + dtoc(m.hfecha)                                                                                    Arial                                                          "Comprobante: ", ComprobanteDesc                                                                                            Arial                                                         cn_rivacompra.gravadas5                                       "999,999,999,999"                                                                                                           Arial                                                         cn_rivacompra.iva10                                           "999,999,999"                                                                                                               Arial                                                         ccn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible                           "999,999,999,999"                                                                                                           Arial                                                         cn_rivacompra.exentas                                         "999,999,999,999"                                                                                                           Arial                                                         	Imponible                                                     "999,999,999,999"                                                                                                           Arial                                                          cn_rivacompra.iva5                                           "999,999,999"                                                  cn_rivacompra.iva5                                           Arial                                                         cn_rivacompra.gravadas10                                      "999,999,999,999"                                                                                                           Arial                                                         "Total: ", ComprobanteDesc                                                                                                  Arial                                                         "Total: ", Sucursal                                           Arial                                                         "Importaciones"                                                                                                             Arial                                                         Eiif(Tipo='M',cn_rivacompra.gravadas5,0) * IIF(TipoOperacion='D',1,-1)                                                         "999,999,999,999"                                             Arial                                                         Aiif(Tipo='M',cn_rivacompra.iva10,0) * IIF(TipoOperacion='D',1,-1)                                                             "999,999,999"                                                 Arial                                                         �iif(Tipo='M',cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible,0) * IIF(TipoOperacion='D',1,-1)                                             "999,999,999,999"                                             Arial                                                         Ciif(Tipo='M',cn_rivacompra.exentas,0) * IIF(TipoOperacion='D',1,-1)                                                           "999,999,999,999"                                             Arial                                                         7iif(Tipo='M',Imponible,0) * IIF(TipoOperacion='D',1,-1)       "999,999,999,999"                                             Arial                                                         @iif(Tipo='M',cn_rivacompra.iva5,0) * IIF(TipoOperacion='D',1,-1)                                                              "999,999,999"                                                 Arial                                                         Fiif(Tipo='M',cn_rivacompra.gravadas10,0) * IIF(TipoOperacion='D',1,-1)                                                        "999,999,999,999"                                             Arial                                                         "Indirectos"                                                                                                                Arial                                                         Eiif(Tipo='I',cn_rivacompra.gravadas5,0) * IIF(TipoOperacion='D',1,-1)                                                         "999,999,999,999"                                             Arial                                                         Aiif(Tipo='I',cn_rivacompra.iva10,0) * IIF(TipoOperacion='D',1,-1)                                                             "999,999,999"                                                 Arial                                                         �iif(Tipo='I',cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible,0) * IIF(TipoOperacion='D',1,-1)                                             "999,999,999,999"                                             Arial                                                         Ciif(Tipo='I',cn_rivacompra.exentas,0) * IIF(TipoOperacion='D',1,-1)                                                           "999,999,999,999"                                             Arial                                                         7iif(Tipo='I',Imponible,0) * IIF(TipoOperacion='D',1,-1)       "999,999,999,999"                                             Arial                                                         @iif(Tipo='I',cn_rivacompra.iva5,0) * IIF(TipoOperacion='D',1,-1)                                                              "999,999,999"                                                 Arial                                                         Fiif(Tipo='I',cn_rivacompra.gravadas10,0) * IIF(TipoOperacion='D',1,-1)                                                        "999,999,999,999"                                             Arial                                                         
"Directos"                                                                                                                  Arial                                                         Eiif(Tipo='D',cn_rivacompra.gravadas5,0) * IIF(TipoOperacion='D',1,-1)                                                         "999,999,999,999"                                             Arial                                                         Aiif(Tipo='D',cn_rivacompra.iva10,0) * IIF(TipoOperacion='D',1,-1)                                                             "999,999,999"                                                 Arial                                                         �iif(Tipo='D',cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible,0) * IIF(TipoOperacion='D',1,-1)                                             "999,999,999,999"                                             Arial                                                         Ciif(Tipo='D',cn_rivacompra.exentas,0) * IIF(TipoOperacion='D',1,-1)                                                           "999,999,999,999"                                             Arial                                                         7iif(Tipo='D',Imponible,0) * IIF(TipoOperacion='D',1,-1)       "999,999,999,999"                                             Arial                                                         @iif(Tipo='D',cn_rivacompra.iva5,0) * IIF(TipoOperacion='D',1,-1)                                                              "999,999,999"                                                 Arial                                                         Fiif(Tipo='D',cn_rivacompra.gravadas10,0) * IIF(TipoOperacion='D',1,-1)                                                        "999,999,999,999"                                             Arial                                                         "Condicion Compra:"                                          Arial                                                         .IIF(m.CondicionIVA='T','Todos',m.CondicionIVA)                Arial                                                         "Cond."                                                       Arial                                                         IdCondicion                                                   Arial                                                         5cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',1,-1)         "999,999,999,999"                                             Arial                                                         1cn_rivacompra.iva10 * IIF(TipoOperacion='D',1,-1)             "999,999,999"                                                                                                               Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',1,-1)                                                          "999,999,999,999"                                             Arial                                                         3cn_rivacompra.exentas * IIF(TipoOperacion='D',1,-1)           "999,999,999,999"                                                                                                           Arial                                                         &Imponible* IIF(TipoOperacion='D',1,-1)                        "999,999,999,999"                                                                                                           Arial                                                         0cn_rivacompra.iva5 * IIF(TipoOperacion='D',1,-1)              "999,999,999"                                                                                                               Arial                                                         6cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',1,-1)        "999,999,999,999"                                                                                                           Arial                                                         4cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',0,1)          "999,999,999,999"                                             Arial                                                         0cn_rivacompra.iva10 * IIF(TipoOperacion='D',0,1)              "999,999,999"                                                 Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',0,1)                                                           "999,999,999,999"                                             Arial                                                         2cn_rivacompra.exentas * IIF(TipoOperacion='D',0,1)            "999,999,999,999"                                             Arial                                                         %Imponible* IIF(TipoOperacion='D',0,1)                         "999,999,999,999"                                             Arial                                                         /cn_rivacompra.iva5 * IIF(TipoOperacion='D',0,1)               "999,999,999"                                                 Arial                                                         5cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',0,1)         "999,999,999,999"                                             Arial                                                         "Total Facturas"                                              Arial                                                         "Total Creditos"                                              Arial                                                         "Saldo"                                                       Arial                                                         4cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',1,0)          "999,999,999,999"                                             Arial                                                         0cn_rivacompra.iva10 * IIF(TipoOperacion='D',1,0)              "999,999,999"                                                 Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',1,0)                                                           "999,999,999,999"                                             Arial                                                         2cn_rivacompra.exentas * IIF(TipoOperacion='D',1,0)            "999,999,999,999"                                             Arial                                                         %Imponible* IIF(TipoOperacion='D',1,0)                         "999,999,999,999"                                             Arial                                                         /cn_rivacompra.iva5 * IIF(TipoOperacion='D',1,0)               "999,999,999"                                                 Arial                                                         5cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',1,0)         "999,999,999,999"                                             Arial                                                         5cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',1,-1)         "999,999,999,999"                                             Arial                                                         1cn_rivacompra.iva10 * IIF(TipoOperacion='D',1,-1)             "999,999,999"                                                 Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',1,-1)                                                          "999,999,999,999"                                             Arial                                                         3cn_rivacompra.exentas * IIF(TipoOperacion='D',1,-1)           "999,999,999,999"                                             Arial                                                         &Imponible* IIF(TipoOperacion='D',1,-1)                        "999,999,999,999"                                             Arial                                                         0cn_rivacompra.iva5 * IIF(TipoOperacion='D',1,-1)              "999,999,999"                                                 Arial                                                         6cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',1,-1)        "999,999,999,999"                                             Arial                                                         4cn_rivacompra.gravadas5 * IIF(TipoOperacion='D',0,1)          "999,999,999,999"                                             Arial                                                         0cn_rivacompra.iva10 * IIF(TipoOperacion='D',0,1)              "999,999,999"                                                 Arial                                                         �(cn_rivacompra.gravadas5 + gravadas10+ cn_rivacompra.exentas+ cn_rivacompra.iva5 + iva10 + imponible ) * IIF(TipoOperacion='D',0,1)                                                           "999,999,999,999"                                             Arial                                                         2cn_rivacompra.exentas * IIF(TipoOperacion='D',0,1)            "999,999,999,999"                                             Arial                                                         %Imponible* IIF(TipoOperacion='D',0,1)                         "999,999,999,999"                                             Arial                                                         /cn_rivacompra.iva5 * IIF(TipoOperacion='D',0,1)               "999,999,999"                                                 Arial                                                         5cn_rivacompra.gravadas10 * IIF(TipoOperacion='D',0,1)         "999,999,999,999"                                             Arial                                                         "Total Facturas"                                              Arial                                                         "Total Creditos"                                              Arial                                                         "Saldo"                                                       Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 220
Left = 1
Width = 520
Height = 200
InitialSelectedAlias = "cn_rivacompra"
DataSource = .NULL.
Name = "Dataenvironment"
                                                      �PROCEDURE Init
IF EMPTY(m.cp_cpbt)
	m.cp_cpbt=null
ENDIF
IF EMPTY(m.sucursal)
	m.sucursal = null
ENDIF
	
	

TEXT TO cmdSQL noshow

SELECT Sucursal = cn_iva.sucursal + '-' +s.Descripci�n, cn_iva.comprobante,    
  cn_iva.fechacomprobante, cp_proveedor.razon, cn_Iva.Tipo,   
   Cp_proveedor.ruc, cn_iva.c�digo, cn_Iva.IdIva, TipoComprobante +'-'+ cp.Comprobante as ComprobanteDesc, cp.Tipo as TipoOperacion, 
   sum(CASE WHEN CN_IVA.TIPO <> 'M' and porcentaje=5 THEN ISNULL(d.gravada,0) else 0 end) as gravadas5,    
   sum(CASE WHEN CN_IVA.TIPO <> 'M' and porcentaje=10 THEN ISNULL(d.gravada,0) else 0 end) as gravadas10,  
	  sum(CASE WHEN CN_IVA.TIPO = 'M' THEN d.gravada else 0 end) as imponible,    
     sum(d.exentas) as Exentas, 
     sum(case when porcentaje=5 then ISNULL(d.iva,0) else 0 end) as Iva5,    
     sum(case when porcentaje=10 then ISNULL(d.iva,0) else 0 end) as Iva10,
     cn_Iva.IdCondicion    
     FROM  cn_iva inner join cn_iva_Detalle d on cn_Iva.IdIva = d.IdIva    
      Left JOIN cp_proveedor   
     ON  cn_iva.c�digo = cp_proveedor.idproveedor AND    cn_iva.idempresa=cp_proveedor.idempresa
     left join cp_Comprobante cp on cn_iva.TipoComprobante = cp.IdComprob and cn_iva.idempresa=cp.idempresa
     left join Sucursal s on cn_IVA.Sucursal = s.Sucursal and cn_Iva.Idempresa= s.IdEmpresa
      WHERE cn_iva.idempresa = ?oApp.Empresa  
       AND (cn_iva.sucursal = ?m.sucursal or ?m.sucursal is null)
        AND MONTH(cn_iva.fechacomprobante) = ?m.mes  
        AND YEAR(cn_iva.fechacomprobante) = ?m.a�o  
        and   cn_iva.fechacomprobante between ?m.dFecha and ?m.hFecha
        and (cn_iva.TipoComprobante = ?m.cp_cpbt or ?m.cp_cpbt is null)
      AND cn_iva.tipoiva = 'C'  
      and (?m.CondicionIVa='T' or ?m.CondicionIVa=cn_Iva.Idcondicion)
       group by cn_iva.sucursal,s.Descripci�n, cn_iva.comprobante,    
  cn_iva.fechacomprobante, cp_proveedor.razon, cn_IVa.Tipo,   
   Cp_proveedor.ruc, cn_iva.c�digo, cn_Iva.IdIva,TipoComprobante , cp.Comprobante, cp.Tipo,cn_Iva.IdCondicion    
      ORDER BY cn_iva.Sucursal, TipoComprobante, cn_iva.fechacomprobante, cn_iva.comprobante  

ENDTEXT


sql(cmdsql,'cn_rivacompra')
SELECT cn_rivacompra

ENDPROC
PROCEDURE BeforeOpenTables
DO seteo


ENDPROC
                                                                  
A���    (
  (
                        գ   %   Q	      �	  +   y	          �  U  � %�C��  ��� � T��  ���� � %�C�� ���@ � T�� ���� �	 M(� �� �  �U �O SELECT Sucursal = cn_iva.sucursal + '-' +s.Descripci�n, cn_iva.comprobante,    �D �>   cn_iva.fechacomprobante, cp_proveedor.razon, cn_Iva.Tipo,   �� ��    Cp_proveedor.ruc, cn_iva.c�digo, cn_Iva.IdIva, TipoComprobante +'-'+ cp.Comprobante as ComprobanteDesc, cp.Tipo as TipoOperacion, �q �k    sum(CASE WHEN CN_IVA.TIPO <> 'M' and porcentaje=5 THEN ISNULL(d.gravada,0) else 0 end) as gravadas5,    �q �k    sum(CASE WHEN CN_IVA.TIPO <> 'M' and porcentaje=10 THEN ISNULL(d.gravada,0) else 0 end) as gravadas10,  �U �O 	  sum(CASE WHEN CN_IVA.TIPO = 'M' THEN d.gravada else 0 end) as imponible,    �& �       sum(d.exentas) as Exentas, �S �M      sum(case when porcentaje=5 then ISNULL(d.iva,0) else 0 end) as Iva5,    �Q �K      sum(case when porcentaje=10 then ISNULL(d.iva,0) else 0 end) as Iva10,�! �      cn_Iva.IdCondicion    �Q �K      FROM  cn_iva inner join cn_iva_Detalle d on cn_Iva.IdIva = d.IdIva    �% �       Left JOIN cp_proveedor   �f �`      ON  cn_iva.c�digo = cp_proveedor.idproveedor AND    cn_iva.idempresa=cp_proveedor.idempresa�q �k      left join cp_Comprobante cp on cn_iva.TipoComprobante = cp.IdComprob and cn_iva.idempresa=cp.idempresa�a �[      left join Sucursal s on cn_IVA.Sucursal = s.Sucursal and cn_Iva.Idempresa= s.IdEmpresa�4 �.       WHERE cn_iva.idempresa = ?oApp.Empresa  �G �A        AND (cn_iva.sucursal = ?m.sucursal or ?m.sucursal is null)�; �5         AND MONTH(cn_iva.fechacomprobante) = ?m.mes  �: �4         AND YEAR(cn_iva.fechacomprobante) = ?m.a�o  �K �E         and   cn_iva.fechacomprobante between ?m.dFecha and ?m.hFecha�M �G         and (cn_iva.TipoComprobante = ?m.cp_cpbt or ?m.cp_cpbt is null)�& �        AND cn_iva.tipoiva = 'C'  �K �E       and (?m.CondicionIVa='T' or ?m.CondicionIVa=cn_Iva.Idcondicion)�L �F        group by cn_iva.sucursal,s.Descripci�n, cn_iva.comprobante,    �D �>   cn_iva.fechacomprobante, cp_proveedor.razon, cn_IVa.Tipo,   �w �q    Cp_proveedor.ruc, cn_iva.c�digo, cn_Iva.IdIva,TipoComprobante , cp.Comprobante, cp.Tipo,cn_Iva.IdCondicion    �d �^       ORDER BY cn_iva.Sucursal, TipoComprobante, cn_iva.fechacomprobante, cn_iva.comprobante  � �  � � ��C � � cn_rivacompra� �� F� � U  CP_CPBT SUCURSAL CMDSQL SQL CN_RIVACOMPRA
  �  � U  SETEO Init,     �� BeforeOpenTables<	    ��1 � A � A � a QA�Qa1QaAq����a��AqAa A �q 3 q 3                       �     )   �  �  0    )   (
                  ntaje=5 THEN ISNULL(d.gravada,0) else 0 end) as gravada