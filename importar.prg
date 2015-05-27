PARAMETERS lcIDEmpresa
SET PROCEDURE TO main, utility ADDITIVE 
DO setPath
OPEN DATABASE datos SHARED
SET DATABASE TO DATOS 
SET STEP ON

sql("SElect MAX(fecha) as Fecha from cn_importarIVA where IdEmpresa=?lcIdEmpresa",'cFecha')

InputFecha = cFecha.Fecha

lfecha=right('0'+ALLTRIM(STR(DAY(InputFecha ))),2)
lfecha= lfecha+ right('0'+ALLTRIM(STR(month(InputFecha ))),2)
lfecha= lfecha+ right('0'+ALLTRIM(STR(year(InputFecha ))),4)
lfecha= lfecha+ right('0'+ALLTRIM(STR(hour(InputFecha ))),2)
lfecha= lfecha+ right('0'+ALLTRIM(STR(minute(InputFecha ))),2)
lfecha= lfecha+ right('0'+ALLTRIM(STR(sec(InputFecha ))),2)

*MESSAGEBOX(lFecha)

*RETURN


lcmd="! aGeneraTXTFutura.exe " + lFecha
&lcmd

archivo=lfecha + 'V.TXT'
procesar(Archivo,'V')

archivo=lfecha + 'C.TXT'
procesar(Archivo,'C')

*MESSAGEBOX("Proceso Finalizado")


QUIT 


FUNCTION Procesar()
LPARAMETERS Archivo, lOrigen



		hnd= FOPEN(archivo)
		IF !EMPTY(hnd)
			resultado=FGETS(hnd,300)	&&Leemos la primera linea de cabecera
			resultado=FGETS(hnd,300)	&&Leemos la segunda linea de datos
			TEXT TO cmdSQL NOSHOW
				INSERT INTO [cn_ImportarIVA]
	           ([Nro]
	           ,[Fecha]
	           ,[IdCliente]
	           ,[Cliente]
	           ,[IdSucursal]
	           ,[Sucursal]
	           ,[IdCondicion]
	           ,[IdProducto]
	           ,[Producto]
	           ,[Iva]
	           ,[Importe]
	           ,[FechaRegistro]
	           ,[Tipo]
	           ,[AuditFecha],
	           Origen)
	     		VALUES
				(?m.Nro,
				?m.Fecha,
				?m.IdCliente,
				?m.Cliente,
				?m.IdSucursal,
				?m.Sucursal,
				?m.IdCondicion,
				?m.IdProducto,
				?m.Producto,
				?m.Iva,
				?m.Importe,
				?m.FechaRegistro,
				?m.Tipo,
				getdate(),lOrigen)

			ENDTEXT 
			
			DO while !EMPTY(resultado) AND ASC(resultado)<>12
				*Analizar y Procesar
				m.Nro=SUBSTR(resultado,1,17)
				m.Fecha=SUBSTR(resultado,18,10)
				m.IdCliente=allTRIM(SUBSTR(resultado,29,20))
				m.Cliente=allTRIM(SUBSTR(resultado,50,50))
				m.IdSucursal=allTRIM(SUBSTR(resultado,100,3))
				m.Sucursal=allTRIM(SUBSTR(resultado,104,50))
				m.IdCondicion=SUBSTR(resultado,155,1)
				m.IdProducto=allTRIM(SUBSTR(resultado,159,20))
				m.Producto=allTRIM(SUBSTR(resultado,180,48))
				m.Iva=allTRIM(SUBSTR(resultado,229,3))
				m.Importe=STRTRAN(SUBSTR(resultado,233,20),".","")
				m.FechaRegistro=SUBSTR(resultado,254,20)
				m.Tipo=SUBSTR(resultado,274,4)	
						
				sql(cmdsql,"")
				*WAIT windows LEFT(resultado,255) 
				resultado=FGETS(hnd,300)
			ENDDO

			FCLOSE(hnd)
			
			
			
		 ENDIF  
		 
		 TEXT TO cmdSQL NOSHOW 
		 		SELECT Id,Nro FROM cn_ImportarIVA
		 		where Procesado is null 
		 ENDTEXT 
		 IF sql(cmdSQL,'cIVA')>0
			 SELECT cIVA
			 m.lNro = "" 
			 m.IdIva=0
			 SCAN
			 	IF m.lNro<> cIVA.Nro		&&Corte de Nro
			 			IF lOrigen='V'
			 				sql('exec cn_ImportarVenta ?cIva.Id,?oapp.Empresa,?@m.IdIVA','')
			 			ELSE
			 				sql('exec cn_ImportarCompra ?cIva.Id,?oapp.Empresa,?@m.IdIVA','')			 			
			 			ENDIF
			 			
			 	ELSE
			 			sql('exec cn_ImportarVentaDet ?cIva.Id,?oapp.Empresa,?m.IdIVA','')
			 	ENDIF
			 m.lNro=cIVA.Nro
			 ENDSCAN 
		 ENDIF
		 
ENDFUNC 

