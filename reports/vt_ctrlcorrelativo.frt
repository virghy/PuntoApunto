      @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=TOSHIBA e-STUDIO451c PS3
OUTPUT=192.168.0.17
ORIENTATION=0
PAPERSIZE=9
SCALE=100
ASCII=0
COPIES=1
DEFAULTSOURCE=7
PRINTQUALITY=300
COLOR=2
DUPLEX=1
YRESOLUTION=300
TTOPTION=3
COLLATE=0
                               J  ,  winspool  TOSHIBA e-STUDIO451c PS3  192.168.0.17                                                                     �TOSHIBA e-STUDIO451c PS3         � S�� 	 �
od   ,  ,   Letter                                                                            PRIV�0                                                                                       '''  '        @                                  \K hC                             x�d�      �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   @  SMTJ     0T O S H I B A   e - S T U D I O 4 5 1 c   P S 3   Resolution 600dpi PageSize Letter PageRegion  InputSlot Auto MediaType Plain Duplex None Collate True OutputBin Bin2 Stapling Off HolePunch Off PrintMode Normal DINDigit1 0 DINDigit2 0 DINDigit3 0 DINDigit4 0 DINDigit5 0 DeptCode False DCDigit1 0 DCDigit2 0 DCDigit3 0 DCDigit4 0 DCDigit5 0 ColorResType ColorLowGeneral DistinguishThinLines True BlackOverPrint True PureBlackGray BlackGrayAuto TonerSave False BlankPage False Smoothing True                                                                                    Arial                                                         cpbt                                                          cpbt                                                                                                                        Arial                                                         empresa                                                                                                                     Arial                                                         ?"Control de Correlatividad de Cpbt. de Venta (Nros. faltantes)"                                                                                                                             Arial                                                         "Comprobante/Nro"                                             Arial                                                         Nro                                                                                                                         Arial                                                         
datetime()                                                                                                                  Arial                                                         'P�g. '+alltrim(Str(_pageno))                                                                                               Arial                                                         ""Periodo: ", dFecha,' al ', hFecha                                                                                          Arial                                                         "Rango: ", dNro, ' al ' , hNro                                                                                              Arial                                                         empresa                                                                                                                     Arial                                                         Arial                                                         Arial                                                         Arial                                                         Arial                                                         dataenvironment                                               �Top = 104
Left = 2
Width = 520
Height = 200
InitialSelectedAlias = "cn_rivacompra"
DataSource = .NULL.
Name = "Dataenvironment"
                                                      YPROCEDURE Init
SET TEXTMERGE ON 

IF EMPTY(m.vt_cpbt)
	m.vt_cpbt=null
ENDIF
	
		      

TEXT TO cmdSQL noshow

Declare @dNro bigint, @hNro bigint, @dFecha datetime,@hFecha datetime,
	@Cpbt char(3), @Empresa char(3)

Select @dNro= ?m.dNro,@hNro =?m.hNro, @cpbt=?m.vt_cpbt, 
	@Empresa=?oApp.Empresa,
	@dFecha =?m.dFecha, @hFecha = ?m.hFecha

Declare @Nros table(Nro bigint)

IF @dNro = 0 AND NOT @cpbt is null
begin
		SELECT @dNro = MIN(numero) from vt_Factura where IdComprobante = @cpbt
			and IdEmpresa=@Empresa 
			and Fecha between @dFecha and @hFecha
	
END 

IF @hNro = 0 AND NOT @cpbt is null
begin
		SELECT @hNro = Max(numero) from vt_Factura where IdComprobante = @cpbt
			and IdEmpresa=@Empresa 
			and Fecha between @dFecha and @hFecha
	
END 



while @dNro <=@hNro
Begin
	Insert @Nros
	Select @dNro
	Set @dNro= @dNro + 1
end

SELECT TOP(1000) IdComprobante + '-' + Descripcion as Cpbt, a.Nro  from @Nros a ,vt_cpbt c
where not exists(Select * from vt_Factura f where f.IdComprobante = c.IdComprobante and f.IdEmpresa=c.IdEmpresa
		and f.Numero= a.Nro
		and Fecha between @dFecha and @hFecha)
and (c.IdComprobante = @cpbt or @cpbt is null)
and c.IdEmpresa = @Empresa
order by 1,2
ENDTEXT



sql(cmdSQL,'cn_rIvaVentas')

SELECT cn_rivaventas

ENDPROC
PROCEDURE BeforeOpenTables
DO seteo

ENDPROC
                                    ����    �  �                        x�   %   �      d  6   �          �  U  f G` � %�C��  ���$ � T��  ���� �	 M(� �� �  �L �F Declare @dNro bigint, @hNro bigint, @dFecha datetime,@hFecha datetime,�& �  	@Cpbt char(3), @Empresa char(3)� �  �> �8 Select @dNro= ?m.dNro,@hNro =?m.hNro, @cpbt=?m.vt_cpbt, � � 	@Empresa=?oApp.Empresa,�. �( 	@dFecha =?m.dFecha, @hFecha = ?m.hFecha� �  �% � Declare @Nros table(Nro bigint)� �  �( �" IF @dNro = 0 AND NOT @cpbt is null� � begin�N �H 		SELECT @dNro = MIN(numero) from vt_Factura where IdComprobante = @cpbt�  � 			and IdEmpresa=@Empresa �. �( 			and Fecha between @dFecha and @hFecha� � 	�
 � END � �  �( �" IF @hNro = 0 AND NOT @cpbt is null� � begin�N �H 		SELECT @hNro = Max(numero) from vt_Factura where IdComprobante = @cpbt�  � 			and IdEmpresa=@Empresa �. �( 			and Fecha between @dFecha and @hFecha� � 	�
 � END � �  � �  � �  � � while @dNro <=@hNro� � Begin� � 	Insert @Nros� � 	Select @dNro� � 	Set @dNro= @dNro + 1�	 � end� �  �` �Z SELECT TOP(1000) IdComprobante + '-' + Descripcion as Cpbt, a.Nro  from @Nros a ,vt_cpbt c�u �o where not exists(Select * from vt_Factura f where f.IdComprobante = c.IdComprobante and f.IdEmpresa=c.IdEmpresa� � 		and f.Numero= a.Nro�. �( 		and Fecha between @dFecha and @hFecha)�4 �. and (c.IdComprobante = @cpbt or @cpbt is null)�  � and c.IdEmpresa = @Empresa� � order by 1,2� � ��C � � cn_rIvaVentas� �� F� � U  VT_CPBT CMDSQL SQL CN_RIVAVENTAS
  �  � U  SETEO Init,     �� BeforeOpenTables�    ��1 a � A � a �aa ���a Qa �� ��q � a �� ��q � a a a �� 11�� a Q��A!A �r 3 q 2                            4   D  N  >    )   �                  a = ?m.idfrecuencia �< �6 			and (