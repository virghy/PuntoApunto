   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=PrimoPDF
OUTPUT=PrimoPort:
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=3
COLLATE=1
                                                          T    winspool  PrimoPDF  PrimoPort:                  3C  USB001                                                           `PrimoPDF                        � �S� 	 �
od   X  X  Letter                                                                            PRIV�0                                                                                       '''  '          �                                  \K hC                             �{��      � �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Courier New                                                   Fecha                                                         	tipovalor                                                     Arial                                                         Fecha                                                         Arial                                                         importe * Operacion                                           "999,999,999,999.99"                                          Arial                                                         importe * Operacion                                           "999,999,999,999.99"                                          Arial                                                         "TOTAL"                                                       Arial                                                         importe * Operacion                                           "999,999,999,999.99"                                          Arial                                                         "Resumen de Valores Recibidos"                                Arial                                                         empresa                                                                                                                     Arial                                                         
"Per�odo:"                                                    Arial                                                         m.dfecha,  ' al ', m.hfecha                                   Arial                                                         
datetime()                                                    Arial                                                         'P�g. '+alltrim(Str(_pageno))                                 Arial                                                         "Fecha"                                                      Arial                                                         	"Importe"                                                     Arial                                                         "Tipo Pago"                                                   Arial                                                         "TOTAL GENERAL"                                               Arial                                                         "Sucursal:"                                                   Arial                                                         (iif(isnull(m.sucursal),'Todos',Sucursal)                      Arial                                                         "Total a Depositar"                                           Arial                                                         TotalEfectivo - TotalGasto                                    "999,999,999,999.99"                                          Arial                                                         TotalEfectivo                                                 #iif(TipoValor='Efectivo',Importe,0)                           0                                                             
TotalGasto                                                    )iif(TipoValor='Gastos del Dia',Importe,0)                     0                                                             Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               aTop = 219
Left = 361
Width = 518
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                            
�PROCEDURE Init
If Empty(m.sucursal)
	Store null To sucursal
ENDIF


* SQL Original
* Errores:  
* 1) Tabla Sucursal en Gastos no tiene filtro de empresa, esto hara que si otra empresa tenga la misma sucursal repita los registro proporcionalmente
* 2) Condicion or de Sucursal no esta aislado entre parentesis, esto hara que si deja la sucursal como null, no tenga en cuenta el filtro de empresa.
* VG 23/12/2008



*!*	(SELECT   F.Fecha, tv.tipovalor, sum(v.importe) as importe, s.Sucursal + '-'+s.Descripci�n as Sucursal
*!*	FROM     vt_factura AS F INNER JOIN
*!*	                      ts_valores_base AS v ON F.IdFactura = v.IdFactura INNER JOIN
*!*	                      ts_tipovalor AS tv ON v.idtipovalor = tv.idtipovalor INNER JOIN
*!*	                      sucursal As s on F.sucursal = s.sucursal and F.idempresa = s.idempresa
*!*	where F.idempresa=?oApp.Empresa and F.Fecha between ?m.dfecha and ?m.hfecha and F.sucursal = ?m.sucursal or ?m.Sucursal is null 
*!*	group by F.Fecha, tv.tipovalor,s.Sucursal + '-'+s.Descripci�n)
*!*	UNION
*!*	(SELECT G.fecha, 'Gastos del Dia', sum(F.total) as importe, G.Sucursal + '-'+s.Descripci�n as Sucursal
*!*	        FROM cp_gastos AS G inner join
*!*				 cp_factura as F ON G.idgasto=F.idgasto inner join
*!*				 sucursal as s on G.sucursal= s.sucursal
*!*		    WHERE G.idempresa=?oApp.Empresa and G.Fecha between ?m.dfecha and ?m.hfecha and G.sucursal = ?m.sucursal or ?m.Sucursal is null 
*!*			group by G.Fecha, 'Gastos del Dia',G.sucursal + '-'+s.Descripci�n)





DO SETEO
TEXT TO CMDSQL NOSHOW
(SELECT   F.Fecha, tv.tipovalor, sum(v.importe) as importe, s.Sucursal + '-'+s.Descripci�n as Sucursal, Operacion = 1
FROM     vt_factura AS F INNER JOIN
                      ts_valores_base AS v ON F.IdFactura = v.IdFactura INNER JOIN
                      ts_tipovalor AS tv ON v.idtipovalor = tv.idtipovalor INNER JOIN
                      sucursal As s on F.sucursal = s.sucursal and F.idempresa = s.idempresa
where F.idempresa=?oApp.Empresa and F.Fecha between ?m.dfecha and ?m.hfecha and (F.sucursal = ?m.sucursal or ?m.Sucursal is null )
group by F.Fecha, tv.tipovalor,s.Sucursal + '-'+s.Descripci�n)
UNION
(SELECT G.fecha, 'Gastos del Dia', sum(F.total) as importe, G.Sucursal + '-'+s.Descripci�n as Sucursal, Operacion=-1
        FROM cp_gastos AS G inner join
			 cp_factura as F ON G.idgasto=F.idgasto inner join
			 sucursal as s on G.sucursal= s.sucursal and G.IdEmpresa=s.IdEmpresa
	    WHERE G.idempresa=?oApp.Empresa and G.Fecha between ?m.dfecha and ?m.hfecha and (G.sucursal = ?m.sucursal or ?m.Sucursal is null )
		group by G.Fecha,G.sucursal + '-'+s.Descripci�n)

ENDTEXT
sql (cmdsql, "consulta")
SELECT CONSULTA
ENDPROC
                                                                   ����    �  �                        �T   %   8      z     F          �  U  � %�C��  ��� � J���(�  � � � �	 M(� ��{ �u (SELECT   F.Fecha, tv.tipovalor, sum(v.importe) as importe, s.Sucursal + '-'+s.Descripci�n as Sucursal, Operacion = 1�) �# FROM     vt_factura AS F INNER JOIN�X �R                       ts_valores_base AS v ON F.IdFactura = v.IdFactura INNER JOIN�[ �U                       ts_tipovalor AS tv ON v.idtipovalor = tv.idtipovalor INNER JOIN�b �\                       sucursal As s on F.sucursal = s.sucursal and F.idempresa = s.idempresa�� �� where F.idempresa=?oApp.Empresa and F.Fecha between ?m.dfecha and ?m.hfecha and (F.sucursal = ?m.sucursal or ?m.Sucursal is null )�D �> group by F.Fecha, tv.tipovalor,s.Sucursal + '-'+s.Descripci�n)� � UNION�z �t (SELECT G.fecha, 'Gastos del Dia', sum(F.total) as importe, G.Sucursal + '-'+s.Descripci�n as Sucursal, Operacion=-1�, �&         FROM cp_gastos AS G inner join�; �5 			 cp_factura as F ON G.idgasto=F.idgasto inner join�M �G 			 sucursal as s on G.sucursal= s.sucursal and G.IdEmpresa=s.IdEmpresa�� �� 	    WHERE G.idempresa=?oApp.Empresa and G.Fecha between ?m.dfecha and ?m.hfecha and (G.sucursal = ?m.sucursal or ?m.Sucursal is null )�8 �2 		group by G.Fecha,G.sucursal + '-'+s.Descripci�n)� �  � � ��C � � consulta� �� F� � U  SUCURSAL SETEO CMDSQL SQL CONSULTA Init,     ��1 � A �q � ����!�A� ������a A �q 1                       �
      )   �                            � �  � � ��C �