   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    6     winspool HP DeskJet 400 LPT1:                          �HP DeskJet 400                   � 0C�  �4d   ,  ,  A4                                                            ����                DINU"   0  <a�w                            	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        �DRIVER=winspool
DEVICE=HP DeskJet 400
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
ASCII=1
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=300
COLOR=2
YRESOLUTION=300
TTOPTION=1
COLLATE=1
           rsuelsiml.centro_pag           DATE()                                                        Courier New                    TIME()                                                        Courier New                    Arial                          4"Planilla de Sueldos Simplificada (preliquidaci�n)"            Courier New                    "Pag."                         _pageno                                                       Courier New                    "999"                          Arial                          	"Haberes"                      Arial                          "Nombre"                       Arial                          "Basico"                       Arial                          "Legajo"                       Arial                          
"Concepto"                     Arial                          "Deducciones"                  rSuelsiml.idempleado                                          Arial                          rsuelsiml.ocupacion                                           Arial                          rsuelsiml.nombre                                              Arial                          rSuelsiml.th                                                  Arial                          "999,999,999"                  rSuelsiml.td                                                  Arial                          "999,999,999"                  rSuelsiml.tn                                                  Arial                          "999,999,999"                  Arial                          "Neto"                         rsuelsiml.sueldo_bas                                          Arial                          "999,999,999"                  rSuelsiml.centro_pag                                          Arial                          rsuelsiml.centro                                              Arial                          rSuelsiml.th                                                  Arial                          "999,999,999"                  rSuelsiml.td                                                  Arial                          "999,999,999"                  rSuelsiml.tn                                                  Arial                          "999,999,999"                  Arial                          "Total del Centro de Pago"                                      total                                                         Arial                          "999"                          rSuelsiml.th                                                  Arial                          "999,999,999"                  rSuelsiml.td                                                  Arial                          "999,999,999"                  rSuelsiml.tn                                                  Arial                          "999,999,999"                  Arial                          "Total de la Empresa"          totalgen                                                      Arial                          "999"                          Arial                                                         
"Periodo:"                     <letrames(rSuelsiml.mes)+' de '+ alltrim(Str( rSuelsiml.a�o))                                                                    Arial                          total                          0                              0                              totalgen                       0                              0                              Courier New                    Arial                          Arial                          Arial                          Arial                          dataenvironment                oLeft = 222
Top = 53
Width = 520
Height = 219
InitialSelectedAlias = "rSuelsiml"
Name = "Dataenvironment"
                   /PROCEDURE BeforeOpenTables
do seteo
ENDPROC
                 ����    �   �                         ��   %   A       a      [           �  U  
  �  � U  SETEO BeforeOpenTables,     ��1 q 1                       $       )   �                                                     cursor                         �Left = 10
Top = 20
Width = 96
Height = 90
Alias = "rsuelsiml"
Database = ..\data\datos.dbc
CursorSource = "presuldsim"
Name = "Cursor1"
                                                                                      