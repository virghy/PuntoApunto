   V   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=1
PAPERSIZE=5
COLOR=2
95\HP Deskjet 1000 J110 series
OUTPUT=USB002
ORIENTATION=1
PAPERSIZE=5
ASCII=0
COPIES=1
DEFAULTSOURCE=257
PRINTQUALITY=300
COLOR=2
YRESOLUTION=300
TTOPTION=2
COLLATE=0
                                     W  ?  winspool  \\192.168.0.195\HP Deskjet 1000 J110 series  USB002                                                         Arial                                                         Nro                                                           alltrim(cEmpresa.Raz�n)                                       Arial                                                         "RUC:",alltrim(cEmpresa.RUC)                                  Arial                                                         alltrim(str(Nro))                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 220
Left = 1
Width = 520
Height = 200
InitialSelectedAlias = "rasientos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          �PROCEDURE Init

IF EMPTY(m.dnumero ) then
	m.dnumero  = 1
ENDIF 
IF EMPTY(m.hnumero ) then
	m.hnumero  = 1000
ENDIF 


TEXT TO cmdsql noshow
	SELECT * FROM empresa WHERE idempresa=?oApp.Empresa

ENDTEXT

=sql(cmdsql,'cEmpresa')



CREATE CURSOR Indice(Nro int)

FOR i=m.dnumero TO m.hnumero  
	INSERT INTO Indice(Nro) VALUES (i)
ENDFOR

SELECT Indice


ENDPROC
PROCEDURE BeforeOpenTables
DO seteo
ENDPROC
        B���    )  )                        I   %   �      �     �          �  U   %�C��  ���  � T��  ���� � %�C�� ���E � T�� ����� �	 M(� ��: �4 	SELECT * FROM empresa WHERE idempresa=?oApp.Empresa� �  � � ��C � � cEmpresa� �� h�� Indice� � INT� �� ���  �(��� ��� � r�� Indice� ��� �� �� F� � U  DNUMERO HNUMERO CMDSQL SQL INDICE NRO I
  �  � U  SETEO Init,     �� BeforeOpenTablesk    ��1 � A A � �a A ����A r 4 q 1                       {        �  �      )   )                                                                              �DRIVER=winspool
DEVICE=\\192.168.0.195\HP Deskjet 1000 J110 series
OUTPUT=USB002
ORIENTATION=1
PAPERSIZE=5
ASCII=0
COPIES=1
DEFAULTSOURCE=257
PRINTQUALITY=300
COLOR=2
YRESOLUTION=300
TTOPTION=2
COLLATE=0
                                     W  ?  winspool  \\192.168.0.195\HP Deskjet 1000 J110 series  USB002                                                         Arial                                                         Nro                                                           alltrim(cEmpresa.Raz�n)                                       Arial                                                         "RUC:",alltrim(cEmpresa.RUC)                                  Arial                                                         alltrim(str(Nro))                                             Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 220
Left = 1
Width = 520
Height = 200
InitialSelectedAlias = "rasientos"
DataSource = .NULL.
Name = "Dataenvironment"
                                                          �PROCEDURE BeforeOpenTables
DO seteo
ENDPROC
PROCEDURE Init

IF EMPTY(m.dnumero ) then
	m.dnumero  = 1
ENDIF 
IF EMPTY(m.hnumero ) then
	m.hnumero  = 1000
ENDIF 


TEXT TO cmdsql noshow
	SELECT * FROM empresa WHERE idempresa=?oApp.Empresa

ENDTEXT

=sql(cmdsql,'cEmpresa')



CREATE CURSOR Indice(Nro int)

FOR i=m.dnumero TO m.hnumero  
	INSERT INTO Indice(Nro) VALUES (i)
ENDFOR

SELECT Indice


ENDPROC
        B���    )  )                        I   %   �      �     �          �  U  
  �  � U  SETEO %�C��  ���  � T��  ���� � %�C�� ���E � T�� ����� �	 M(� ��: �4 	SELECT * FROM empresa WHERE idempresa=?oApp.Empresa� �  � � ��C � � cEmpresa� �� h�� Indice� � INT� �� ���  �(��� ��� � r�� Indice� ��� �� �� F� � U  DNUMERO HNUMERO CMDSQL SQL INDICE NRO I BeforeOpenTables,     �� InitA     ��1 q 2 � A A � �a A ����A r 3                       $         ?   �      )   )                                                                        