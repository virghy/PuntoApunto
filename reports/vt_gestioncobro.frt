  8   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=9
COLOR=2
                         Arial                                                         Cobrador                                                      ""Planilla de Gesti�n de Cobranzas"                            Arial                                                         oApp.NombreEmpresa                                            Arial                                                         
"Cliente"                                                    Arial                                                         "Fecha:"                                                      Arial                                                         m.Fecha                                                       Arial                                                         9IdCliente,' ',alltrim(RazSocial),' ',Telefono,' ',Celular                                                                     Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         (iif(isnull(m.sucursal),'Todos',sucursal)                      Arial                                                         
"Sucursal"                                                    Arial                                                         cobrador                                                                                                                    Arial                                                         
"Cobrador"                                                    Arial                                                         "O.P."                                                        Arial                                                         ImporteCuota                                                  "999,999,999"                                                 Arial                                                         
"Producto"                                                    Arial                                                         Facturas                                                      Arial                                                         "Cuota"                                                       Arial                                                         Cuotas                                                        "999"                                                         Arial                                                         "Plazo"                                                       Arial                                                         Saldo                                                         "999,999,999"                                                 Arial                                                         "Saldo Ant."                                                  Arial                                                         Anterior                                                      "999,999,999"                                                 Arial                                                         "Meta Dia Ant."                                               Arial                                                         Actual                                                        "999,999,999"                                                 Arial                                                         
"Meta Hoy"                                                    Arial                                                         Pago                                                          "999,999,999"                                                 Arial                                                         
"Pag� Hoy"                                                    Arial                                                         "Boleta No."                                                  Arial                                                         Actual-Pago                                                   "999,999,999"                                                 Arial                                                         "Saldo Dia"                                                   Arial                                                         Saldo                                                         "999,999,999"                                                 Arial                                                         "Saldo Actual"                                                Arial                                                         CuotasPagadas                                                 "999"                                                         Arial                                                         "Cuotas Cob."                                                 Arial                                                         Cuotas-CuotasPagadas                                          "999"                                                         Arial                                                         "Cuotas Pend."                                                Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 62
Left = 4
Width = 759
Height = 448
InitialSelectedAlias = "vt_rdiariocontrol"
DataSource = .NULL.
Name = "Dataenvironment"
                                                   kPROCEDURE Init



If Empty(m.sucursal)
	Store null To m.sucursal
ENDIF


TEXT TO cmdSQL noshow
Declare @Fecha datetime
Set @Fecha ='23-01-2012'

SELECT     cl.IdCliente, cl.RazSocial, cl.Telefono, cl.Celular, cn.Descripcion,fa.IdFactura,
sum(de.Saldo) as Saldo,
Sum(case when cn.tipovencimiento='D'  AND de.Vencimiento< @Fecha then de.Saldo 
	WHEN cn.tipovencimiento='S'  AND (DATEPART(wk,de.Vencimiento)< DATEPART(wk,@Fecha) or year(de.Vencimiento) < year(@Fecha)) then de.Saldo else 0 end) as Anterior,
Sum(case when cn.tipovencimiento='D'  AND de.Vencimiento=@Fecha then de.Saldo 
	WHEN cn.tipovencimiento='S'  AND DATEPART(wk,de.Vencimiento)= DATEPART(wk,@Fecha) then de.Saldo else 0 end) as Actual,
count(*) as Cuotas,
max(de.Importe) as ImporteCuota,
Sum(case when de.Saldo=0 then 1 else 0 end) as CuotasPagadas,
Pago=0
FROM         vt_clientes AS cl INNER JOIN
                      vt_factura AS fa ON cl.IdEmpresa = fa.IdEmpresa AND cl.IdCliente = fa.IdCliente INNER JOIN
                      vt_forma_pago AS de ON fa.IdFactura = de.IdFactura INNER JOIN
                      vt_Condicion AS cn ON fa.IdEmpresa = cn.IdEmpresa AND fa.IdCondicion = cn.IdCondicion
where cn.tipovencimiento in('D','S') and 
cl.IdEmpresa=?oApp.Empresa                      
group by cl.IdCliente, cl.RazSocial, cl.Telefono, cl.Celular, cn.Descripcion,fa.IdFactura
order by cn.Descripcion,cl.IdCliente
ENDTEXT
	
*	sql('exec vt_recibocobrador ?oapp.empresa,?m.dFecha,?m.hFecha,?m.idcobrador','vt_rrecibo')
=	sql(cmdSQL,'vt_rrecibo')
	SELECT vt_rrecibo
	
	
	

ENDPROC
PROCEDURE BeforeOpenTables
Do seteo
ENDPROC
                  ���    �  �                        =�   %   5      �      ]          �  U  � %�C��  ��� � J���(��  � �	 M(� �� � Declare @Fecha datetime� � Set @Fecha ='23-01-2012'� �  �b �\ SELECT     cl.IdCliente, cl.RazSocial, cl.Telefono, cl.Celular, cn.Descripcion,fa.IdFactura,� � sum(de.Saldo) as Saldo,�U �O Sum(case when cn.tipovencimiento='D'  AND de.Vencimiento< @Fecha then de.Saldo �� �� 	WHEN cn.tipovencimiento='S'  AND (DATEPART(wk,de.Vencimiento)< DATEPART(wk,@Fecha) or year(de.Vencimiento) < year(@Fecha)) then de.Saldo else 0 end) as Anterior,�T �N Sum(case when cn.tipovencimiento='D'  AND de.Vencimiento=@Fecha then de.Saldo �} �w 	WHEN cn.tipovencimiento='S'  AND DATEPART(wk,de.Vencimiento)= DATEPART(wk,@Fecha) then de.Saldo else 0 end) as Actual,� � count(*) as Cuotas,�& �  max(de.Importe) as ImporteCuota,�C �= Sum(case when de.Saldo=0 then 1 else 0 end) as CuotasPagadas,� � Pago=0�/ �) FROM         vt_clientes AS cl INNER JOIN�v �p                       vt_factura AS fa ON cl.IdEmpresa = fa.IdEmpresa AND cl.IdCliente = fa.IdCliente INNER JOIN�Y �S                       vt_forma_pago AS de ON fa.IdFactura = de.IdFactura INNER JOIN�q �k                       vt_Condicion AS cn ON fa.IdEmpresa = cn.IdEmpresa AND fa.IdCondicion = cn.IdCondicion�/ �) where cn.tipovencimiento in('D','S') and �6 �0 cl.IdEmpresa=?oApp.Empresa                      �_ �Y group by cl.IdCliente, cl.RazSocial, cl.Telefono, cl.Celular, cn.Descripcion,fa.IdFactura�* �$ order by cn.Descripcion,cl.IdCliente� � ��C � �
 vt_rrecibo� �� F� � U  SUCURSAL CMDSQL SQL
 VT_RRECIBO
  �  � U  SETEO Init,     �� BeforeOpenTables     ��1 � A � ��a !�Q�
A��a1� �a��a��A �q 6 q 1                       1        X  `  *    )   �                                                                 %ORIENTATION=1
PAPERSIZE=9
COLOR=2
                         Arial                                                         Cobrador                                                      ""Planilla de Gesti�n de Cobranzas"                            Arial                                                         oApp.NombreEmpresa                                            Arial                                                         
"Cliente"                                                    Arial                                                         "Fecha:"                                                      Arial                                                         m.Fecha                                                       Arial                                                         9IdCliente,' ',alltrim(RazSocial),' ',Telefono,' ',Celular                                                                     Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         (iif(isnull(m.sucursal),'Todos',sucursal)                      Arial                                                         
"Sucursal"                                                    Arial                                                         cobrador                                                                                                                    Arial                                                         
"Cobrador"                                                    Arial                                                         "O.P."                                                        Arial                                                         ImporteCuota                                                  "999,999,999"                                                 Arial                                                         
"Producto"                                                    Arial                                                         Facturas                                                      Arial                                                         "Cuota"                                                       Arial                                                         Cuotas                                                        "999"                                                         Arial                                                         "Plazo"                                                       Arial                                                         Saldo                                                         "999,999,999"                                                 Arial                                                         "Saldo Ant."                                                  Arial                                                         Anterior                                                      "999,999,999"                                                 Arial                                                         "Meta Dia Ant."                                               Arial                                                         Actual                                                        "999,999,999"                                                 Arial                                                         
"Meta Hoy"                                                    Arial                                                         Pago                                                          "999,999,999"                                                 Arial                                                         
"Pag� Hoy"                                                    Arial                                                         "Boleta No."                                                  Arial                                                         Actual-Pago                                                   "999,999,999"                                                 Arial                                                         "Saldo Dia"                                                   Arial                                                         Saldo                                                         "999,999,999"                                                 Arial                                                         "Saldo Actual"                                                Arial                                                         CuotasPagadas                                                 "999"                                                         Arial                                                         "Cuotas Cob."                                                 Arial                                                         Cuotas-CuotasPagadas                                          "999"                                                         Arial                                                         "Cuotas Pend."                                                Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 62
Left = 4
Width = 759
Height = 448
InitialSelectedAlias = "vt_rdiariocontrol"
DataSource = .NULL.
Name = "Dataenvironment"
                                                   tPROCEDURE BeforeOpenTables
Do seteo
ENDPROC
PROCEDURE Init


If Empty(m.idcobrador)
	Store null To m.idcobrador
ENDIF
If Empty(m.sucursal)
	Store null To m.sucursal
ENDIF


TEXT TO cmdSQL noshow
	select a.idpago,a.sucursal,a.num_recibo,a.fecha, 
	rtrim(a.idcliente)+'-'+c.razsocial cliente,
	a.idcobrador,rtrim(a.idcobrador)+'-'+rtrim(e.nombre)+' '+rtrim(e.apellido) cobrador, 
	SUM(case when IdTipoValor = 2 then v.importe else 0 end) as Cheque,
	SUM(case when IdTipoValor = 1 then v.importe else 0 end) as Efectivo,
	SUM(case when IdTipoValor = 5 then v.importe else 0 end) as Retencion,
	totalValores as Importe, 
	Valores = dbo.ts_DescripcionValores(a.IdPago,'C'),
	Facturas = dbo.ts_DescripcionValores(a.IdPago,'F'),a.Comision
	from vt_pagos a left join ts_valores_Base v on a.IdPAgo = v.IdCobro  
	and a.idempresa=?oApp.empresa 
	left join vt_clientes c on a.idcliente=c.idcliente and a.IdEmpresa= c.idempresa
	left join vt_cobradores d on a.idcobrador=d.idcobrador  and a.IdEmpresa= d.idempresa
	left join bs_personas e on d.idpersona=e.idpersona 
	where a.fecha between ?m.dfecha and ?m.hfecha and
    A.IdEmpresa=?oApp.Empresa and  
	(a.idcobrador=?m.idcobrador or ?m.idcobrador is null)
	and (a.Sucursal=?m.Sucursal or ?m.sucursal is null)
	group by a.idpago,a.sucursal,a.num_recibo,a.fecha,a.idcliente,c.razsocial,
	a.idcobrador,a.idcobrador,e.nombre,e.apellido, TotalValores,a.Comision
	order by a.IdCobrador,a.fecha,a.num_recibo
ENDTEXT
	
*	sql('exec vt_recibocobrador ?oapp.empresa,?m.dFecha,?m.hFecha,?m.idcobrador','vt_rrecibo')
=	sql(cmdSQL,'vt_rrecibo')
	SELECT vt_rrecibo
	
	
	

ENDPROC
         ���    �  �                        `   %   2      �  #   Z          �  U  
  �  � U  SETEO� %�C��  ��� � J���(��  � � %�C�� ���@ � J���(�� � �	 M(� ��8 �2 	select a.idpago,a.sucursal,a.num_recibo,a.fecha, �2 �, 	rtrim(a.idcliente)+'-'+c.razsocial cliente,�\ �V 	a.idcobrador,rtrim(a.idcobrador)+'-'+rtrim(e.nombre)+' '+rtrim(e.apellido) cobrador, �J �D 	SUM(case when IdTipoValor = 2 then v.importe else 0 end) as Cheque,�L �F 	SUM(case when IdTipoValor = 1 then v.importe else 0 end) as Efectivo,�M �G 	SUM(case when IdTipoValor = 5 then v.importe else 0 end) as Retencion,�  � 	totalValores as Importe, �9 �3 	Valores = dbo.ts_DescripcionValores(a.IdPago,'C'),�D �> 	Facturas = dbo.ts_DescripcionValores(a.IdPago,'F'),a.Comision�L �F 	from vt_pagos a left join ts_valores_Base v on a.IdPAgo = v.IdCobro  �% � 	and a.idempresa=?oApp.empresa �V �P 	left join vt_clientes c on a.idcliente=c.idcliente and a.IdEmpresa= c.idempresa�[ �U 	left join vt_cobradores d on a.idcobrador=d.idcobrador  and a.IdEmpresa= d.idempresa�: �4 	left join bs_personas e on d.idpersona=e.idpersona �8 �2 	where a.fecha between ?m.dfecha and ?m.hfecha and�) �#     A.IdEmpresa=?oApp.Empresa and  �< �6 	(a.idcobrador=?m.idcobrador or ?m.idcobrador is null)�: �4 	and (a.Sucursal=?m.Sucursal or ?m.sucursal is null)�Q �K 	group by a.idpago,a.sucursal,a.num_recibo,a.fecha,a.idcliente,c.razsocial,�M �G 	a.idcobrador,a.idcobrador,e.nombre,e.apellido, TotalValores,a.Comision�1 �+ 	order by a.IdCobrador,a.fecha,a.num_recibo� � ��C � �
 vt_rrecibo� �� F� � U 
 IDCOBRADOR SUCURSAL CMDSQL SQL
 VT_RRECIBO BeforeOpenTables,     �� InitA     ��1 q 2 � A � A � �!�����A�Qa�������A �q 5                       $         ?   i      )   �                                                        