   A   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=9
COLOR=2
                         Courier New                                                   0left(rtrim(depositante) + replicate("-",57) ,57)              "@!"                                                                                                                        Courier New                                                   mletras1                                                      "@!"                                                          Courier New                                                   SALLTRIM(TRANSFORM(monto,iif(Decimales=0, '999,999,999,999','999,999,999.99')))+'.-'                                           Courier New                                                   
DAY(fecha)                                                    "@ 99"                                                                                                                      Courier New                                                   CMONTH(fecha)                                                 "@!"                                                                                                                        Courier New                                                   year(fecha)                                                   "@ 9999"                                                                                                                    Courier New                                                   DAY(fechadiferida)                                            "@ 99"                                                         Dia                                                          Courier New                                                   CMONTH(fechadiferida)                                         "@!"                                                                                                                        Courier New                                                   year(fechadiferida)                                           "@ 9999"                                                                                                                    Courier New                                                   mletras2                                                      "@!"                                                          Courier New                                                   Courier New                                                   Courier New                                                   dataenvironment                                               aTop = 166
Left = 135
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                            �PROCEDURE Init
*PUBLIC mLetras, mLetras1, mLetras2 

*Set Step On 
SELECT rtraercheque


*!*	mLetras= ALLTRIM(numeral(monto))
*!*	IF Decimales > 0
*!*		mLetras = mLetras + ' CON ' + SUBSTR(STR(Monto - INT(monto),3,2),2) + '/100'
*!*	ENDIF

*!*	mletras= mletras + REPLICATE('-',130)
*!*	mletras1 = LEFT(mletras,57)
*!*	mletras2 = substr(mletras,58,65)









ENDPROC
PROCEDURE Destroy
RELEASE mLetras, mLetras1, mLetras2 
ENDPROC
                                                  ���    �   �                         ]\   %   {       �      �           �  U  
  F�  � U  RTRAERCHEQUE  <�  � � � U  MLETRAS MLETRAS1 MLETRAS2 Init,     �� DestroyH     ��1 t @1 � 1                       ~        �  �      )   �                   a.idasiento = d.idasiento
	WHER