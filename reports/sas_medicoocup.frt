   Z   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              HORIENTATION=1
PAPERSIZE=1
PAPERLENGTH=2794
PAPERWIDTH=2159
COLOR=2
ORIENTATION=1
PAPERSIZE=1
PAPERLENGTH=2794
PA      _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                               dataenvironment                                               Arial                                                         Courier New                                                   Paciente                                                      Arial                                                         	"Nombre:"                                                     Arial                                                         "Edad:"                                                       Arial                                                         "Ant. Personales:"                                            Arial                                                         "Ant. Familiares:"                                            Arial                                                         "Orientaci�n M�dica:"                                         Arial                                                         alltrim(str(Edad)) + " A�OS"                                  Arial                                                         AntPersonales,' '+Otros                                       "@!"                                                          Arial                                                         AntFamiliares                                                 Arial                                                         Orientacion                                                   Arial                                                         "Nro. Servicio:"                                              Arial                                                         NroSolicitud                                                  Arial                                                         "Transcripci�n de Informe"                                    Arial                                                         /"TEM Myriam Gim�nezDpto. Operativo GEMA S.A."               "@I"                                                          Arial                                                         n"Asunci�n, " , alltrim(str(day(fecha))) + "  de "+ nombremes(month(fecha)) + " de " +alltrim(str(year(fecha)))                Arial                                                         "..\bitmaps\logogema.jpg"futura9\bitmaps\logogema.jpg"        Courier New                                                   Arial                                                        �PROCEDURE Destroy

Release AntPersonales 

ENDPROC
PROCEDURE Init
DO SETEO


TEXT TO CMDSQL NOSHOW
SELECT     idSolicitud, NroSolicitud, ISNULL(fechaLlamada,FechaAgenda) as Fecha, Paciente, edad, 
			Hipertenso, Cardiaco, Diabetico, Alergico, AlergicoA, Asmatico, Tabaco, Epilepsia, Acv, epoc, 
            hallazgo_exfisico as Orientacion, tratAdministrado, resp_tratam, epicrisis, dx_presuntivo as AntFamiliares,Otros
FROM         sas_Servicios
where IdSolicitud=?m.IdSolicitud
ENDTEXT


sql (cmdsql, "consulta")
SELECT CONSULTA

PUBLIC AntPersonales
AntPersonales=""
IF Hipertenso
	AntPersonales = AntPersonales + "HTA, " 
ENDIF
	
IF Diabetico
	AntPersonales = AntPersonales + "DBT, " 
ENDIF

IF Asmatico
	AntPersonales = AntPersonales + "Asma, " 
ENDIF
	
IF Epilepsia
	AntPersonales = AntPersonales + "CONV., " 
ENDIF

IF Cardiaco
	AntPersonales = AntPersonales + "CARD., " 
ENDIF

IF ACV
	AntPersonales = AntPersonales + "ACV, " 
ENDIF


AntPersonales = AntPersonales + NVL("ALERGICO A: "+ ALLTRIM(ALERGICOA) + ', ','')

IF LEN(ALLTRIM(ANTPERSONALES))>0
	ANTPERSONALES=LEFT(ANTPERSONALES,LEN(ALLTRIM(ANTPERSONALES))-1)
ENDIF

ENDPROC
                   ����    �  �                        �   %   �      \  &             �  U  
  <�  � U  ANTPERSONALES1 �  �	 M(� ��g �a SELECT     idSolicitud, NroSolicitud, ISNULL(fechaLlamada,FechaAgenda) as Fecha, Paciente, edad, �g �a 			Hipertenso, Cardiaco, Diabetico, Alergico, AlergicoA, Asmatico, Tabaco, Epilepsia, Acv, epoc, �� �|             hallazgo_exfisico as Orientacion, tratAdministrado, resp_tratam, epicrisis, dx_presuntivo as AntFamiliares,Otros�  � FROM         sas_Servicios�& �  where IdSolicitud=?m.IdSolicitud� � ��C � � consulta� �� F� � 7� � T� ��  �� %�� ��� T� �� � HTA, �� � %�� ��(� T� �� � DBT, �� � %�� ��P� T� �� � Asma, �� � %�� ��y� T� �� � CONV., �� � %��	 ���� T� �� � CARD., �� � %��
 ���� T� �� � ACV, �� �. T� �� C� ALERGICO A: C� �� , �  ��� %�CC� �>� ��*� T� �C� CC� �>�=�� � U  SETEO CMDSQL SQL CONSULTA ANTPERSONALES
 HIPERTENSO	 DIABETICO ASMATICO	 EPILEPSIA CARDIACO ACV	 ALERGICOA Destroy,     �� InitI     ��1 r 3 q � qq!aA �q r � � aA � aA � qA � �A � �A � aA �R�A 2                       -         H   �      )   �                  onas AS me ON m.idEmpresa = me.idEmpresa A