   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    8  !  winspool HP DeskJet Plus LPT1:                          �HP DeskJet Plus                  � @ f   o    ,  ,                                                                                 @ MSUDHP DeskJet Plus                 �             d                      �DRIVER=winspool
DEVICE=HP DeskJet Plus
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
PAPERLENGTH=1300
PAPERWIDTH=2159
DEFAULTSOURCE=7
PRINTQUALITY=300
YRESOLUTION=300
TTOPTION=1
              
centro_pag                     DATE()                                                        Courier New                    TIME()                                                        Courier New                    Arial                          @"Planilla de Sueldos y Aguinaldo Simplificada (preliquidaci�n)"                                 Courier New                    "Pag."                         _pageno                                                       Courier New                    "999"                          Courier New                    	"Haberes"                      Courier New                    "Nombre"                       Courier New                    "Basico"                       Courier New                    "Legajo"                       Courier New                    
"Concepto"                     Courier New                    "Deducciones"                  
idempleado                                                    Courier New                    	ocupacion                                                     Courier New                    nombre                                                        Courier New                    th                                                            Courier New                    "999,999,999"                  td                                                            Courier New                    "999,999,999"                  tn+(tsueldo/12)                                               Courier New                    "999,999,999"                  Courier New                    "Neto"                         
sueldo_bas                                                    Courier New                    "999,999,999"                  
centro_pag                                                    Arial                          centro                                                        Arial                          th                                                            Courier New                    "999,999,999"                  td                                                            Courier New                    "999,999,999"                  tn+(tsueldo/12)                                               Courier New                    "999,999,999"                  Courier New                    "Total del Centro de Pago"                                      total                                                         Courier New                    "99,999"                       th                                                            Courier New                    "999,999,999"                  td                                                            Courier New                    "999,999,999"                  tn+(tsueldo/12)                                               Courier New                    "999,999,999"                  Courier New                    "Total de la Empresa"          totalgen                                                      Courier New                    "999"                          Arial                                                         
"Periodo:"                     (letrames(mes)+' de '+ alltrim(Str( a�o))                                                       Arial                          Courier New                    "Aguinaldo"                    
tsueldo/12                                                    Courier New                    "999,999,999"                  
tsueldo/12                                                    Courier New                    "999,999,999"                  
tsueldo/12                                                    Courier New                    "999,999,999"                  total                          0                              0                              totalgen                       0                              0                              Courier New                    Arial                          Courier New                    Arial                          dataenvironment                oLeft = 112
Top = 79
Width = 520
Height = 219
InitialSelectedAlias = "rSuelsiml"
Name = "Dataenvironment"
                  oPROCEDURE BeforeOpenTables
do seteo
ENDPROC
PROCEDURE Init
*!*	select sum(thi) as tsueldo,idempleado;
*!*	from rhistorico ;
*!*	group by 2;
*!*	into cursor xxaguinaldo


*!*	select sue.*,  tsueldo;
*!*	from rsuelsiml sue, xxaguinaldo rA;
*!*	where sue.idempleado = ra.idempleado;
*!*	order by centro_pag,sue.idempleado;
*!*	into cursor xaguinaldo


select aguinaldo

select idempleado,fecha,fechaini,fechafin,mes,a�o,total,thi,;
thn,th,td,tn,nombre,ocupacion,sueldo_bas,centro,centro_pag,;
iif(isnull(tsueldo),(sueldo_bas/12)*11,tsueldo) as tsueldo;
from aguinaldo into cursor  xaguinaldo

ENDPROC
                                  >���    %  %                        ��   %   �      �     �          �  U  
  �  � U  SETEO�  F�  �� o�	 aguinaldo�� ��� ��� ��� ��� ��� ��� ��� ���	 ���
 ��� ��� ��� ��� ��� ��� ��� ��CC� �� � ��� � 6�Q� ���
 xaguinaldo� U 	 AGUINALDO
 IDEMPLEADO FECHA FECHAINI FECHAFIN MES A�O TOTAL THI THN TH TD TN NOMBRE	 OCUPACION
 SUELDO_BAS CENTRO
 CENTRO_PAG TSUELDO
 XAGUINALDO BeforeOpenTables,     �� InitA     ��1 q 2 ~ �
2                       $         ?   d      )   %                                    cursor                        Left = 150
Top = 20
Width = 96
Height = 90
Alias = "rhistorico"
Database = ..\data\datos.dbc
CursorSource = "rhistorico"
Name = "Cursor2"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    cursor                         �Left = 290
Top = 20
Width = 96
Height = 90
Alias = "aguinaldo"
Database = ..\data\datos.dbc
CursorSource = "sueldo_agui"
Name = "Cursor3"
                 cursor                         �Left = 21
Top = 30
Width = 96
Height = 90
Alias = "rsuelsiml"
Database = ..\data\datos.dbc
CursorSource = "rsuelsiml"
Name = "Cursor4"
                     select sum(thi) as tsueldo,idempleado;
from rhistorico ;
group by 2;
into cursor xxaguinaldo


select sue.*,  tsueldo;
from rsuelsiml sue, xxaguinaldo rA;
where sue.idempleado = ra.idempleado;
order by centro_pag,sue.idempleado;
into cursor xaguinaldo
brow

*!*	select aguinaldo

*!*	select idempleado,fecha,fechaini,fechafin,mes,a�o,total,thi,;
*!*	thn,th,td,tn,nombre,ocupacion,sueldo_bas,centro,centro_pag,;
*!*	iif(isnull(tsueldo),(sueldo_bas/12)*11,tsueldo) as tsueldo;
*!*	from aguinaldo into cursor  xaguinaldo
