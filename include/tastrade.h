*-- (c) Microsoft Corporation 1996

*-- Archivo include com�n
#INCLUDE "FOXPRO.H"
#INCLUDE "STRINGS.H"

*-- T�tulos de cuadro de mensajes
#DEFINE ERRORTITLE_LOC      "Ha ocurrido un error"
#DEFINE TASTRADE_LOC        "Futura Software"
#DEFINE RAZON_SOCIAL		"Futura"
#DEFINE ICONO_DEFAULT		"DEFAULT.ICO"
#DEFINE APLICACION			"futura.EXE"
#DEFINE LOGIN_APP			"FuturaApp"
#DEFINE PWD_APP				"AppFutura"
#DEFINE SUCURSAL_BASE		"SUCURSAL_BASE"
#DEFINE MONEDA_BASE			"MONEDA_BASE"	
#DEFINE BORDER_COLOR		"13875625"


#DEFINE DEBUGMODE	.F.
#DEFINE INIFILE		"FUTURA.INI"
#DEFINE CRLF		CHR(13) + CHR(10)
#DEFINE CR			CHR(13)
#DEFINE TAB			CHR(9)

#DEFINE CURRENCY	"$"
#DEFINE AERRORARRAY	7

*-- Estas constantes se usan en tsbaseform para
*-- indicar el estado del alias actual
#DEFINE FILE_OK		0
#DEFINE FILE_BOF	1
#DEFINE FILE_EOF	2
#DEFINE FILE_CANCEL	3

*-- Constantes para identificar qu� desencadenante fall�
*-- usando el elemento 5 de la matriz devuelta por
*-- AERROR(), as� como para hacer referencia al elemento de
*-- matriz apropiado en la matriz de mensajes de error: aErrorMsg[]
#DEFINE INSERTTRIG  1
#DEFINE UPDATETRIG  2
#DEFINE DELETETRIG  3

*-- Constantes usadas para leer el registro del sistema
#DEFINE HKEY_LOCAL_MACHINE			-2147483646  
#DEFINE KEY_SHARED_TOOLS_LOCATION	"Software\Microsoft\Shared Tools Location"
#DEFINE KEY_NTCURRENTVERSION		"Software\Microsoft\Windows NT\CurrentVersion"
#DEFINE KEY_WIN4CURRENTVERSION		"Software\Microsoft\Windows\CurrentVersion"
#DEFINE KEY_WIN4_MSINFO				"Software\Microsoft\Shared Tools\MSInfo"
#DEFINE KEY_QUERY_VALUE				1
#DEFINE ERROR_SUCCESS				0

#DEFINE ADMINBAR_LOC "Administraci�n"
#DEFINE ALL_LOC "Todo"

#DEFINE USER_APPDEV_LOC "PROGRAMADOR DE APLICACIONES"
#DEFINE USER_OPSMGR_LOC "DIRECTOR DE OPERACIONES"

#DEFINE DOLLAR_FORMAT1_LOC ": $"
#DEFINE DOLLAR_FORMAT2_LOC ""
#DEFINE DOLLAR_FORMAT3_LOC "$"
#DEFINE SEEKVALUE_LOC	"*Supuesto pr�ctico"

#DEFINE SYS2011_EXCLUSIVE_LOC 	"EXCLUSIVE"
#DEFINE SYS2011_RECLOCK_LOC 	"RECORD LOCKED"
#DEFINE SYS2011_RECUNLOCK_LOC 	"RECORD UNLOCKED"

#DEFINE	I_SHPMIN	111			&& a d�nde puede llegar el divisor de Informaci�n t�cnica por la izquierda? 
#DEFINE I_SHPMAX	303			&& a d�nde puede llegar el divisor de Informaci�n t�cnica por la derecha? 
