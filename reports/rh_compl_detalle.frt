   �   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=1
COLOR=2
                         Courier New                                                   rh_rcompl_detalle.idcomplemento                               "Nro. Liq."                                                   Arial                                                         "Empleado:"                                                   Arial                                                         "Monto"                                                       Arial                                                          rh_rcompl_detalle.nroliquidacion                                                                                            Arial                                                         rh_rcompl_detalle.idempleado                                                                                                Arial                                                         rh_rcompl_detalle.total                                       "@Z 999,999,999"                                                                                                            Arial                                                         rh_rcompl_detalle.concepto                                                                                                  Arial                                                         Balltrim(rh_rcompl_detalle.apellido) +" "+ rh_rcompl_detalle.nombre                                                                                                                          Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         ;"Detalle de Aplicaci�n de Deduc. y Beneficios por Empleado"                                                                                                                                 Arial                                                         empresa                                                                                                                     Arial                                                         
"Periodo:"                                                                                                                  Arial                                                         m.dfecha, ' al ' , m.hfecha                                                                                                 Arial                                                         "Fecha"                                                       Arial                                                         rh_rcompl_detalle.fechaliq                                                                                                  Arial                                                         
"Aplicado"                                                    Arial                                                         "Saldo"                                                       Arial                                                         rh_rcompl_detalle.cuota                                       "999,999,999"                                                                                                               Arial                                                         rh_rcompl_detalle.aplicado                                    "999,999,999"                                                                                                               Arial                                                         rh_rcompl_detalle.saldo                                       "999,999,999"                                                                                                               Arial                                                         rh_rcompl_detalle.total>0                                     	"Importe"                                                     Arial                                                         "Cuota"                                                       Arial                                                         "Total "                                                      Arial                                                         "Fecha"                                                       Arial                                                         rh_rcompl_detalle.fecha                                                                                                     Arial                                                         "Nro.:"                                                       Arial                                                         rh_rcompl_detalle.nro                                                                                                       Arial                                                         rh_rcompl_detalle.monto                                       "@Z 999,999,999"                                                                                                            Arial                                                         rh_rcompl_detalle.monto                                       "@Z 999,999,999"                                                                                                            Arial                                                         Courier New                                                   Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 53
Left = 222
Width = 520
Height = 219
InitialSelectedAlias = "rsueldos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          �PROCEDURE Init
DO seteo

TEXT TO cmdSQL noshow
SELECT Rh_complemento.idempresa,
  Rh_complemento.idcomplemento, Rh_complemento.fecha,
  Rh_complemento.nro, Rh_complemento.idempleado,
  Rh_complemento.idconcepto, Rh_complemento.total,
  Rh_complemento.saldo, Rh_complemento.cuota,
  Rh_complemento.cancelado, Rh_complemento.tipo,
  Rh_complemento.aplicado, Rh_empleado.nombre,
  Rh_empleado.apellido, Rh_conceptos.concepto,
  Rh_liquidet.idliquidet, Rh_liquidacion.fecha AS fechaliq,
  Rh_liquidacion.nroliquidacion, Rh_liquida_conceptos.monto
 FROM 
     Rh_complemento,
    Rh_empleado,
    rh_conceptos,
    rh_liquida_conceptos,
    rh_liquidet,
    Rh_liquidacion
 WHERE Rh_complemento.idempleado = Rh_empleado.idempleado
 and  Rh_complemento.IdEmpresa= Rh_empleado.IdEmpresa
   AND  Rh_complemento.idconcepto = Rh_conceptos.idconcepto
   AND  Rh_complemento.IdEmpresa= Rh_conceptos.IdEmpresa
   AND  Rh_complemento.idcomplemento = Rh_liquida_conceptos.idcomplemento
   AND  Rh_liquida_conceptos.idliquidet = Rh_liquidet.idliquidet
   AND  Rh_liquidet.idliquidacion = Rh_liquidacion.idliquidacion
   AND  Rh_complemento.idempresa = ?oApp.Empresa 
   AND  Rh_complemento.nro = ?m.nroCompl
   AND  Rh_complemento.fecha BETWEEN ?m.dfecha AND ?m.hfecha
 ORDER BY Rh_complemento.idcomplemento,
  Rh_liquidacion.fecha, Rh_liquidacion.nroliquidacion

ENDTEXT

sql(cmdsql,'rh_rcompl_detalle')
SELECT rh_rcompl_detalle



ENDPROC
                                                                  ����    �  �                        ��   %   B      �  %   P          �  U  � �  �	 M(� ��& �  SELECT Rh_complemento.idempresa,�; �5   Rh_complemento.idcomplemento, Rh_complemento.fecha,�6 �0   Rh_complemento.nro, Rh_complemento.idempleado,�8 �2   Rh_complemento.idconcepto, Rh_complemento.total,�3 �-   Rh_complemento.saldo, Rh_complemento.cuota,�6 �0   Rh_complemento.cancelado, Rh_complemento.tipo,�4 �.   Rh_complemento.aplicado, Rh_empleado.nombre,�4 �.   Rh_empleado.apellido, Rh_conceptos.concepto,�A �;   Rh_liquidet.idliquidet, Rh_liquidacion.fecha AS fechaliq,�A �;   Rh_liquidacion.nroliquidacion, Rh_liquida_conceptos.monto� �  FROM � �      Rh_complemento,� �     Rh_empleado,� �     rh_conceptos,� �     rh_liquida_conceptos,� �     rh_liquidet,� �     Rh_liquidacion�? �9  WHERE Rh_complemento.idempleado = Rh_empleado.idempleado�; �5  and  Rh_complemento.IdEmpresa= Rh_empleado.IdEmpresa�A �;    AND  Rh_complemento.idconcepto = Rh_conceptos.idconcepto�> �8    AND  Rh_complemento.IdEmpresa= Rh_conceptos.IdEmpresa�O �I    AND  Rh_complemento.idcomplemento = Rh_liquida_conceptos.idcomplemento�F �@    AND  Rh_liquida_conceptos.idliquidet = Rh_liquidet.idliquidet�F �@    AND  Rh_liquidet.idliquidacion = Rh_liquidacion.idliquidacion�7 �1    AND  Rh_complemento.idempresa = ?oApp.Empresa �. �(    AND  Rh_complemento.nro = ?m.nroCompl�B �<    AND  Rh_complemento.fecha BETWEEN ?m.dfecha AND ?m.hfecha�- �'  ORDER BY Rh_complemento.idcomplemento,�; �5   Rh_liquidacion.fecha, Rh_liquidacion.nroliquidacion� �  � �" ��C � � rh_rcompl_detalle� �� F� � U  SETEO CMDSQL SQL RH_RCOMPL_DETALLE Init,     ��1 q � a�a�1aAA� �aq�a�����aaq�!��a A "q 4                       �      )   �                   U  SQL SETEO
 CENTROPAGO CMDSQL RSUELDOS
  �  � U 