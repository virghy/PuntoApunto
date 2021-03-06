   ^   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              %ORIENTATION=0
PAPERSIZE=9
COLOR=2
ice Document Image       _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                               dataenvironment                                               Courier New                                                   Courier New                                                   Courier New                                                   	SERVICIOS                                                     Courier New                                                   Z1                                                            Courier New                                                   Z2                                                            Courier New                                                   Z3                                                            Courier New                                                   Z4                                                            Courier New                                                   Z5                                                            Courier New                                                   RAZON                                                        kPROCEDURE Init
DO SETEO

TEXT TO CMDSQL NOSHOW
SELECT	DATENAME(dd, a.fechaAgenda) AS DIA,
	
		b.descripcion AS SERVICIOS,
		c.razonsocial AS RAZON,
		DATENAME(mm, a.fechaAgenda) AS MES,
		SUM(CASE WHEN d.idzona = 1 THEN 1 ELSE 0 END) AS Z1,
		sum(CASE WHEN d.idzona = 2 THEN 1 ELSE 0 END) AS Z2,
		SUM(CASE WHEN d.idzona = 3 THEN 1 ELSE 0 END) AS Z3,
		SUM(CASE WHEN d.idzona = 4 THEN 1 ELSE 0 END) AS Z4,
		SUM(CASE WHEN d.idzona = 5 THEN 1 ELSE 0 END) AS Z5,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (6, 7) THEN 1 ELSE 0 END) AS H6,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (8, 9) THEN 1 ELSE 0 END) AS H8,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (10,11) THEN 1 ELSE 0 END) AS H10,
        SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (12,13) THEN 1 ELSE 0 END) AS H12,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (14,15) THEN 1 ELSE 0 END) AS H14,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (16,18) THEN 1 ELSE 0 END) AS H16,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (19, 20) THEN 1 ELSE 0 END) AS H19,
		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (21, 23) THEN 1 ELSE 0 END) AS H21,
        SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (0, 5) THEN 1 ELSE 0 END) AS H24

FROM         sas_SolicitudServ AS a INNER JOIN
             sas_Seguro AS c ON a.idSeguro = c.idSeguro INNER JOIN
	         sas_Zona AS d ON a.idZona = d.idZona INNER JOIN
             sas_Tiposervicios AS b ON a.idTipoServicio = b.idtiposervicio and a.idEmpresa = b.idEmpresa

WHERE		a.idempresa = ?oApp.empresa and
			a.edad > 15 and
			YEAR(a.fechaagenda) = ?m.a�o and
			MONTH(a.fechaagenda) = ?m.mes and
			a.idseguro = ?m.seguro


GROUP BY	DATEPART(hh, a.fechaAgenda),
			DATENAME(dd, a.fechaAgenda),
			DATENAME(mm, a.fechaAgenda),
			b.descripcion,
			c.razonsocial,
			d.idzona
		
ENDTEXT

sql (cmdsql, "consulta")
SELECT CONSULTA


ENDPROC
                  ����    �  �                        ��   %         �  .   $          �  U  � �  �	 M(� ��0 �* SELECT	DATENAME(dd, a.fechaAgenda) AS DIA,� � 	�# � 		b.descripcion AS SERVICIOS,� � 		c.razonsocial AS RAZON,�+ �% 		DATENAME(mm, a.fechaAgenda) AS MES,�< �6 		SUM(CASE WHEN d.idzona = 1 THEN 1 ELSE 0 END) AS Z1,�< �6 		sum(CASE WHEN d.idzona = 2 THEN 1 ELSE 0 END) AS Z2,�< �6 		SUM(CASE WHEN d.idzona = 3 THEN 1 ELSE 0 END) AS Z3,�< �6 		SUM(CASE WHEN d.idzona = 4 THEN 1 ELSE 0 END) AS Z4,�< �6 		SUM(CASE WHEN d.idzona = 5 THEN 1 ELSE 0 END) AS Z5,�T �N 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (6, 7) THEN 1 ELSE 0 END) AS H6,�T �N 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (8, 9) THEN 1 ELSE 0 END) AS H8,�V �P 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (10,11) THEN 1 ELSE 0 END) AS H10,�\ �V         SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (12,13) THEN 1 ELSE 0 END) AS H12,�V �P 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (14,15) THEN 1 ELSE 0 END) AS H14,�V �P 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (16,18) THEN 1 ELSE 0 END) AS H16,�W �Q 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (19, 20) THEN 1 ELSE 0 END) AS H19,�W �Q 		SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (21, 23) THEN 1 ELSE 0 END) AS H21,�Z �T         SUM(CASE WHEN datepart(hh,a.fechaagenda) IN (0, 5) THEN 1 ELSE 0 END) AS H24� �  �4 �. FROM         sas_SolicitudServ AS a INNER JOIN�H �B              sas_Seguro AS c ON a.idSeguro = c.idSeguro INNER JOIN�? �9 	         sas_Zona AS d ON a.idZona = d.idZona INNER JOIN�n �h              sas_Tiposervicios AS b ON a.idTipoServicio = b.idtiposervicio and a.idEmpresa = b.idEmpresa� �  �, �& WHERE		a.idempresa = ?oApp.empresa and� � 			a.edad > 15 and�) �# 			YEAR(a.fechaagenda) = ?m.a�o and�* �$ 			MONTH(a.fechaagenda) = ?m.mes and� � 			a.idseguro = ?m.seguro� �  � �  �+ �% GROUP BY	DATEPART(hh, a.fechaAgenda),�% � 			DATENAME(dd, a.fechaAgenda),�% � 			DATENAME(mm, a.fechaAgenda),� � 			b.descripcion,� � 			c.razonsocial,� � 			d.idzona� � 		� � ��C � � consulta� �� F� � U  SETEO CMDSQL SQL CONSULTA Init,     ��1 q � q 1�������AAa�aaqq�a A���a �����a a �QQqq� A �q 3                       `      )   �                                        