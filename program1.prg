FUNCTION Convertir
LPARAMETERS vActual,vLleno,vVacio

IF vLleno>vVacio
	Y=vLleno-vVacio
ELSE
	Y=vVacio-vLleno
ENDIF

W=(vActual*100)/(Y)

IF vLleno<vVacio
	Z = 100-W
ELSE
	Z = W	
ENDIF


RETURN Z

