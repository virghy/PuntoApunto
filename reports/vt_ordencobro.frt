  8   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=1
                         Arial                                                         Corte                                                         	"Cliente"                                                     Arial                                                         IdCliente,' ', RazSocial                                      Arial                                                         Vence                                                         Arial                                                         Numero,'-',Cuota                                              Arial                                                         
"Factura"                                                    "@I"                                                          Arial                                                         "Vence"                                                      "@I"                                                          Arial                                                         GastoAdm                                                      "@Z 999,999,999.99"                                           Arial                                                         "Mora"                                                       "@I"                                                          Arial                                                         	"TOTAL "                                                     "@I"                                                          Arial                                                         Valorizado + IntMora + GastoAdm                               "9,999,999,999.99"                                            Arial                                                         "TOTAL"                                                      Arial                                                         Valorizado + IntMora + GastoAdm                               "@Z 9,999,999,999.99"                                         Arial                                                         "N�"                                                          Arial                                                         NroOC                                                         Arial                                                         "Direccion:"                                                  Arial                                                         direccion, Barrio, Ciudad                                     Arial                                                         "Telefono:"                                                   Arial                                                         telefono,' ',Celular                                          Arial                                                         " ORDEN DE COBRO"                                             Arial                                                         
Valorizado                                                    "9,999,999,999.99"                                            Arial                                                         
"Importe"                                                    "@I"                                                          Arial                                                         "Fecha Cobro:"                                                Arial                                                         "Notas o Comentarios"                                         Arial                                                         Obs                                                           Arial                                                         #"Futura Software www.futura.com.py"                           Arial                                                         
FechaCobro                                                    "@ZYS"                                                        Arial                                                         "Fecha Llamada:"                                              Arial                                                         Fecha                                                         "@EZYS"                                                       Arial                                                         "Telemarketer"                                                Arial                                                         Audit_Usuario                                                 Arial                                                         B"..\..\casalatina\futura9\bitmaps\superior verdadeiro simbolo.jpg"                                                            "Gastos Adm."                                                "@I"                                                          Arial                                                         IntMora                                                       "@Z 999,999,999.99"                                           Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 30
Left = -55
Width = 1016
Height = 634
DataSource = .NULL.
Name = "Dataenvironment"
                            =PROCEDURE BeforeOpenTables
Do seteo
ENDPROC
PROCEDURE Init


TEXT TO cmdSQL noshow
SELECT     o.NroOC, o.Fecha, o.IdCliente, o.IdCobrador, o.TotalFacturas, o.Obs, od.numero, od.IntMora, od.GastoAdm, od.Vence, p.Nombre, p.Apellido, cl.RazSocial, cl.Direccion, 
                      cl.Barrio, cl.Ciudad, cl.Telefono, cl.Celular, cl.CI, o.FechaPago, o.Audit_Usuario, od.cuota, od.Valorizado
FROM         vt_clientes AS cl INNER JOIN
                      Vt_OrdenCobro AS o INNER JOIN
                      vt_OrdenCobroDet AS od ON o.IdOC = od.IdOC ON cl.IdEmpresa = o.idempresa AND cl.IdCliente = o.IdCliente LEFT OUTER JOIN
                      BS_Personas AS p INNER JOIN
                      vt_cobradores AS cb ON p.IdPersona = cb.idpersona ON o.idempresa = cb.idempresa AND o.Sucursal = cb.idcobrador
where o.IdEmpresa=?oApp.Empresa and o.NroOC= ?m.NroOC                      
ENDTEXT

sql(cmdSQL,'rpedido')
SELECT rpedido
SCATTER MEMVAR memo
FOR i=1 TO 5-RECCOUNT()
	APPEND BLANK
	GATHER MEMVAR memo
	replace numero WITH 0,cuota WITH 0, Valorizado WITH 0, IntMora WITH 0, GastoAdm WITH 0, Linea WITH i + 1
ENDFOR 




SELECT *, '1' as Corte FROM force rPedido;
union ; 
SELECT *, '2' as Corte FROM force rPedido ORDER BY Corte,Linea INTO CURSOR rP 
SELECT rP


*Sum Importe To m.Total

ENDPROC
                                                                ����    �  �                        <   %   �      4               �  U  
  �  � U  SETEO>	 M(�  ��� �� SELECT     o.NroOC, o.Fecha, o.IdCliente, o.IdCobrador, o.TotalFacturas, o.Obs, od.numero, od.IntMora, od.GastoAdm, od.Vence, p.Nombre, p.Apellido, cl.RazSocial, cl.Direccion, �� ��                       cl.Barrio, cl.Ciudad, cl.Telefono, cl.Celular, cl.CI, o.FechaPago, o.Audit_Usuario, od.cuota, od.Valorizado�/ �) FROM         vt_clientes AS cl INNER JOIN�9 �3                       Vt_OrdenCobro AS o INNER JOIN�� ��                       vt_OrdenCobroDet AS od ON o.IdOC = od.IdOC ON cl.IdEmpresa = o.idempresa AND cl.IdCliente = o.IdCliente LEFT OUTER JOIN�7 �1                       BS_Personas AS p INNER JOIN�� ��                       vt_cobradores AS cb ON p.IdPersona = cb.idpersona ON o.idempresa = cb.idempresa AND o.Sucursal = cb.idcobrador�Q �K where o.IdEmpresa=?oApp.Empresa and o.NroOC= ?m.NroOC                      � � ��C �  � rpedido� �� F� � ^�� �� ���(��CN���� � _��C >� ��� �� ��� �� ��� �� ��� �� ��� ��	 ��� ��� ��L o��  �� rPedido��� 2�Q�
 �� rPedido��� 1�Q�
 ���
 ���	 ���� rP� F� � U  CMDSQL SQL RPEDIDO I NUMERO CUOTA
 VALORIZADO INTMORA GASTOADM LINEA CORTE RP BeforeOpenTables,     �� InitA     ��1 q 2 � aq��1	q�A �q a �Q a 1A �q 5                       $         ?   2      )   �                                          %ORIENTATION=0
PAPERSIZE=9
COLOR=1
                         Arial                                                         Corte                                                         	"Cliente"                                                     Arial                                                         IdCliente,' ', RazSocial                                      Arial                                                         Vence                                                         Arial                                                         Numero,'-',Cuota                                              Arial                                                         
"Factura"                                                    "@I"                                                          Arial                                                         "Vence"                                                      "@I"                                                          Arial                                                         GastoAdm                                                      "@Z 999,999,999.99"                                           Arial                                                         "Mora"                                                       "@I"                                                          Arial                                                         	"TOTAL "                                                     "@I"                                                          Arial                                                         Valorizado + IntMora + GastoAdm                               "9,999,999,999.99"                                            Arial                                                         "TOTAL"                                                      Arial                                                         Valorizado + IntMora + GastoAdm                               "@Z 9,999,999,999.99"                                         Arial                                                         "N�"                                                          Arial                                                         NroOC                                                         Arial                                                         "Direccion:"                                                  Arial                                                         direccion, Barrio, Ciudad                                     Arial                                                         "Telefono:"                                                   Arial                                                         telefono,' ',Celular                                          Arial                                                         " ORDEN DE COBRO"                                             Arial                                                         
Valorizado                                                    "9,999,999,999.99"                                            Arial                                                         
"Importe"                                                    "@I"                                                          Arial                                                         "Fecha Cobro:"                                                Arial                                                         "Notas o Comentarios"                                         Arial                                                         Obs                                                           Arial                                                         #"Futura Software www.futura.com.py"                           Arial                                                         
FechaCobro                                                    "@ZYS"                                                        Arial                                                         "Fecha Llamada:"                                              Arial                                                         Fecha                                                         "@EZYS"                                                       Arial                                                         "Telemarketer"                                                Arial                                                         Audit_Usuario                                                 Arial                                                         B"..\..\casalatina\futura9\bitmaps\superior verdadeiro simbolo.jpg"                                                            "Gastos Adm."                                                "@I"                                                          Arial                                                         IntMora                                                       "@Z 999,999,999.99"                                           Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 30
Left = -55
Width = 1016
Height = 634
DataSource = .NULL.
Name = "Dataenvironment"
                            �PROCEDURE Init


TEXT TO cmdSQL noshow
SELECT     os.NroOrden, os.Fecha_Elaboracion as Fecha, os.contacto_cliente as Contacto, os.IdDireccion as Direccion, 
os.problemas_reportados, os.Descripcion_Servicio, os.NroContrato, 
					 os.Idcliente,cl.RazSocial, cn.IdBarrio, cn.IdCiudad, 
                      osd.idproducto, osd.cantidad, osd.descripcion, bs_Ciudades.Descripcion AS Ciudad, 
                      bs_Barrios.Descripcion AS Barrio, tc.TipoCobertura, osd.Precio,
                      cl.Telefono,cl.Celular, cn.Obs, os.Audit_Usuario,
					 os.idvendedor, RTRIM(BS_Personas.Nombre) + ' ' + BS_Personas.Apellido as Vendedor,Linea=1                     
FROM         OS_OrdenServicio AS os left JOIN
                      OS_DetalleServicio AS osd ON os.idorden = osd.idorden and osd.Tipo='SR' INNER JOIN
                      vt_clientes AS cl ON os.idempresa = cl.IdEmpresa AND os.idcliente = cl.IdCliente LEFT OUTER JOIN
                      sas_TipoCobertura AS tc ON os.idempresa = tc.IdEmpresa AND os.tipo = tc.IdTipoCobertura LEFT OUTER JOIN
                      bs_Ciudades RIGHT OUTER JOIN
                      bs_Barrios RIGHT OUTER JOIN
                      sas_Contrato AS cn ON bs_Barrios.IdBarrio = cn.IdBarrio AND bs_Barrios.IdCiudad = cn.IdCiudad ON bs_Ciudades.IdCiudad = cn.IdCiudad ON 
                      os.idempresa = cn.IdEmpresa AND os.NroContrato = cn.NroContrato
					 left JOIN
                      VT_Repartidor ON os.idempresa = VT_Repartidor.IdEmpresa AND os.idvendedor = VT_Repartidor.IdRepartidor left JOIN
                      BS_Personas ON VT_Repartidor.IdPersona = BS_Personas.IdPersona                      
where os.IdEmpresa=?oApp.Empresa and os.NroOrden = ?m.NroOrden
                      
ENDTEXT

sql(cmdSQL,'rpedido')
SELECT rpedido
SCATTER MEMVAR memo
FOR i=1 TO 5-RECCOUNT()
	APPEND BLANK
	GATHER MEMVAR memo
	replace Cantidad WITH 0,IdProducto WITH "", descripcion WITH "", Precio WITH 0, Linea WITH i + 1
ENDFOR 




SELECT *, '1' as Corte FROM force rPedido;
union ; 
SELECT *, '2' as Corte FROM force rPedido ORDER BY Corte,Linea INTO CURSOR rP 
SELECT rP


*Sum Importe To m.Total

ENDPROC
PROCEDURE BeforeOpenTables
Do seteo
ENDPROC
                                                	y���    `	  `	                        �
   %   �      	  $   �          �  U  �	 M(�  ��{ �u SELECT     os.NroOrden, os.Fecha_Elaboracion as Fecha, os.contacto_cliente as Contacto, os.IdDireccion as Direccion, �H �B os.problemas_reportados, os.Descripcion_Servicio, os.NroContrato, �A �; 					 os.Idcliente,cl.RazSocial, cn.IdBarrio, cn.IdCiudad, �n �h                       osd.idproducto, osd.cantidad, osd.descripcion, bs_Ciudades.Descripcion AS Ciudad, �[ �U                       bs_Barrios.Descripcion AS Barrio, tc.TipoCobertura, osd.Precio,�M �G                       cl.Telefono,cl.Celular, cn.Obs, os.Audit_Usuario,�z �t 					 os.idvendedor, RTRIM(BS_Personas.Nombre) + ' ' + BS_Personas.Apellido as Vendedor,Linea=1                     �3 �- FROM         OS_OrdenServicio AS os left JOIN�n �h                       OS_DetalleServicio AS osd ON os.idorden = osd.idorden and osd.Tipo='SR' INNER JOIN�| �v                       vt_clientes AS cl ON os.idempresa = cl.IdEmpresa AND os.idcliente = cl.IdCliente LEFT OUTER JOIN�� �}                       sas_TipoCobertura AS tc ON os.idempresa = tc.IdEmpresa AND os.tipo = tc.IdTipoCobertura LEFT OUTER JOIN�8 �2                       bs_Ciudades RIGHT OUTER JOIN�7 �1                       bs_Barrios RIGHT OUTER JOIN�� ��                       sas_Contrato AS cn ON bs_Barrios.IdBarrio = cn.IdBarrio AND bs_Barrios.IdCiudad = cn.IdCiudad ON bs_Ciudades.IdCiudad = cn.IdCiudad ON �[ �U                       os.idempresa = cn.IdEmpresa AND os.NroContrato = cn.NroContrato� � 					 left JOIN�� ��                       VT_Repartidor ON os.idempresa = VT_Repartidor.IdEmpresa AND os.idvendedor = VT_Repartidor.IdRepartidor left JOIN�p �j                       BS_Personas ON VT_Repartidor.IdPersona = BS_Personas.IdPersona                      �D �> where os.IdEmpresa=?oApp.Empresa and os.NroOrden = ?m.NroOrden� �                       � � ��C �  � rpedido� �� F� � ^�� �� ���(��CN���� � _��9 >� ��� �� ���  �� ���  �� ��� �� ��� ��� ��L o��  �� rPedido��� 2�Q�	 �� rPedido��� 1�Q�	 ���	 ��� ���� rP� F�
 � U  CMDSQL SQL RPEDIDO I CANTIDAD
 IDPRODUCTO DESCRIPCION PRECIO LINEA CORTE RP
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 � ������1��1�q1
�Q�A�A �q a �Q a �A �q 6 q 1                       �     "   �  �  0    )   `	                                                                                 