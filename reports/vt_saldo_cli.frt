   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
PUT=PrimoPort:
ORI      aTop = 114
Left = 162
Width = 381
Height = 301
DataSource = .NULL.
Name = "Dataenvironment"
                             dataenvironment                                               Arial                                                         Arial                                                         	DesMoneda                                                     	IdCliente                                                     
datetime()                                                                                                                  Arial                                                         "P�g. " + str( _pageno,3 )                                                                                                  Arial                                                         5allt(IdComprobante) + " - " + allt( str(nrocomprob) )                                                                       Arial                                                         	"Factura"                                                                                                                   Arial                                                         !soloresumen                                                  "Per�odo Ventas:"                                             Arial                                                         "Saldos de Clientes "                                                                                                       Arial                                                         empresa                                                                                                                     Arial                                                         &dtoc(m.dfecha)+ " al " +dtoc(m.hfecha)                                                                                      Arial                                                         )iif(empty(m.sucursal),'Todos',m.sucursal)                                                                                   Arial                                                         
"Sucursal"                                                    Arial                                                         IdCliente,razsocial                                                                                                         Arial                                                         !SoloResumen                                                  	"Cliente"                                                     Arial                                                         ttod( fecha )                                                                                                               Arial                                                         "Fecha"                                                                                                                     Arial                                                         !soloresumen                                                  IdCliente,razsocial                                                                                                         Arial                                                         SoloResumen                                                   "Per�odo Vto.:"                                               Arial                                                         &dtoc(m.dvence)+ " al " +dtoc(m.hVence)                                                                                      Arial                                                         saldo                                                         "99,999,999,999.99"                                           Arial                                                         "Total",DesMoneda                                             Arial                                                         ttod( Vencimiento )                                                                                                         Arial                                                         "Vence"                                                                                                                     Arial                                                         !soloresumen                                                  saldo                                                         "99,999,999,999.99"                                                                                                         Arial                                                         "Saldo"                                                       Arial                                                         saldo                                                         "99,999,999,999.99"                                           Arial                                                         "Total"                                                       Arial                                                         Importe                                                       "99,999,999,999.99"                                           Arial                                                         	"Importe"                                                     Arial                                                         descripcion                                                   Arial                                                         "Descripcion"                                                 Arial                                                         !soloresumen                                                  	DesMoneda                                                     Arial                                                         !SoloResumen                                                  4telefono,"("+alltrim(NomContacto)+")", " ",Direccion          Arial                                                         Arial                                                         !SoloResumen                                                  
"Telefono"                                                    Arial                                                         
"Contacto"                                                    Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         PROCEDURE BeforeOpenTables
DO seteo
ENDPROC
PROCEDURE Init
Local sSQL

*--- agar 04/10/05

IF EMPTY(m.IdCliente)
	m.IdCliente = null
ENDIF
IF EMPTY(m.Sucursal)
	m.sucursal=null
ENDIF
	
	

*!*	sSQL = "select c.IdCliente, c.RazSocial, " + ;
*!*	              "f.IdComprobante, " + ;
*!*	              "f.Numero as NroComprob, " + ;
*!*	              "f.Fecha,fp.Vencimiento, " + ;
*!*	              "mo.Descripcion as DesMoneda, " + ;
*!*	              "sum( fp.Saldo ) as Saldo " + ;             
*!*	        "from vt_Forma_Pago fp, vt_factura f, vt_Clientes c, bs_monedas mo " + ;
*!*	       "where fp.IdFactura = f.IdFactura and fp.IdEmpresa = f.IdEmpresa " + ;
*!*	          "and f.IdCliente = c.IdCliente and f.IdEmpresa = c.IdEmpresa " + ;
*!*	          "and fp.IdMoneda = mo.IdMoneda " + ;
*!*	          " and f.IdEmpresa = ?oApp.Empresa " +;       
*!*	          "and ( '" + m.Sucursal + "' = '' or f.Sucursal = '" + m.Sucursal + "' ) " + ;
*!*	          "and f.fecha between ?m.dfecha and ?m.hfecha " + ;
*!*	          "and fp.vencimiento between ?m.dvence and ?m.hvence " + ;
*!*	          "and ( ?m.IdCliente is null or f.IdCliente = ?m.IdCliente) " + ;
*!*	        "group by c.IdCliente, c.RazSocial, f.IdComprobante, f.Numero, f.Fecha, fp.Vencimiento, mo.Descripcion " + ;
*!*	        " Having sum(fp.Saldo) <> 0 " + ;
*!*	        "order by 1, 2 ,3 ,4"

TEXT TO cmdSQL noshow
select c.IdCliente, c.RazSocial,c.Telefono,c.NomContacto,c.Direccion,  
              f.IdComprobante,  
              f.Numero as NroComprob,  
              f.Fecha,fp.Vencimiento,  
              mo.Descripcion as DesMoneda,  
              sum( fp.Saldo ) as Saldo,SUM(Importe) as Importe,
              Descripcion=(Select top 1 Descripcion from st_movimiento_Det m where m.IdFactura = f.IdFactura order by IdDetalle)               
--              Descripcion=dbo.vt_Descripcion(f.IdFactura)               
        from vt_Forma_Pago fp, vt_factura f, vt_Clientes c, bs_monedas mo  
       where fp.IdFactura = f.IdFactura and fp.IdEmpresa = f.IdEmpresa  
          and f.IdCliente = c.IdCliente and f.IdEmpresa = c.IdEmpresa  
          and fp.IdMoneda = mo.IdMoneda  
           and f.IdEmpresa = ?oApp.Empresa       
          and ( ?m.Sucursal is null or f.Sucursal = ?m.Sucursal )  
          and f.fecha between ?m.dfecha and ?m.hfecha  
          and fp.vencimiento between ?m.dvence and ?m.hvence  
          and ( ?m.IdCliente is null or f.IdCliente = ?m.IdCliente)  
        group by mo.Descripcion  ,c.IdCliente, c.RazSocial,f.IdFactura, f.IdComprobante, f.Numero, f.Fecha, fp.Vencimiento,c.Telefono,c.NomContacto,c.Direccion
         Having sum(fp.Saldo) <> 0  
        order by mo.Descripcion ,1, f.fecha


ENDTEXT

sql( cmdSQL, 'xxSaldoCli' )

Select xxSaldoCli



ENDPROC
                             x���    _  _                        t   %   �        &   �          �  U  
  �  � U  SETEO ��  � %�C�� ���% � T�� ���� � %�C�� ���G � T�� ���� �	 M(� ��M �G select c.IdCliente, c.RazSocial,c.Telefono,c.NomContacto,c.Direccion,  �& �                f.IdComprobante,  �- �'               f.Numero as NroComprob,  �- �'               f.Fecha,fp.Vencimiento,  �2 �,               mo.Descripcion as DesMoneda,  �E �?               sum( fp.Saldo ) as Saldo,SUM(Importe) as Importe,�� ��               Descripcion=(Select top 1 Descripcion from st_movimiento_Det m where m.IdFactura = f.IdFactura order by IdDetalle)               �P �J --              Descripcion=dbo.vt_Descripcion(f.IdFactura)               �Q �K         from vt_Forma_Pago fp, vt_factura f, vt_Clientes c, bs_monedas mo  �N �H        where fp.IdFactura = f.IdFactura and fp.IdEmpresa = f.IdEmpresa  �M �G           and f.IdCliente = c.IdCliente and f.IdEmpresa = c.IdEmpresa  �/ �)           and fp.IdMoneda = mo.IdMoneda  �7 �1            and f.IdEmpresa = ?oApp.Empresa       �I �C           and ( ?m.Sucursal is null or f.Sucursal = ?m.Sucursal )  �= �7           and f.fecha between ?m.dfecha and ?m.hfecha  �D �>           and fp.vencimiento between ?m.dvence and ?m.hvence  �K �E           and ( ?m.IdCliente is null or f.IdCliente = ?m.IdCliente)  �� ��         group by mo.Descripcion  ,c.IdCliente, c.RazSocial,f.IdFactura, f.IdComprobante, f.Numero, f.Fecha, fp.Vencimiento,c.Telefono,c.NomContacto,c.Direccion�* �$          Having sum(fp.Saldo) <> 0  �1 �+         order by mo.Descripcion ,1, f.fecha� �  � �  � � ��C � �
 xxSaldoCli� �� F� � U  SSQL	 IDCLIENTE SUCURSAL CMDSQL SQL
 XXSALDOCLI BeforeOpenTables,     �� InitA     ��1 q 2 q � A � A `� �a��!QQ	���q��A�Q
�a a A �r 4                       $         ?         )   _                  