*-----------------------------------------
* Add to the top  of simplepreview.prg
*-----------------------------------------
LPARAMETER loPreviewContainerRef
* parameter is passed by reference
loPreviewContainerRef = CREATEOBJECT("SimplePreview")
RETURN


DEFINE CLASS SimplePreview AS Form
    Caption     = "Click for next page"
    ListenerRef = .NULL.
    PageNo      = 1
    AllowOutput = .F.

    ADD OBJECT Canvas AS Shape WITH ;
        Top = 12, Left = 8, ;
        Height = 252, Width = 209, ;
        Name = "Canvas"

    PROCEDURE Canvas.Click
        WITH THISFORM
            IF .PageNo < .ListenerRef.OutputPageCount
                .PageNo = .PageNo + 1
                .Refresh()
            ENDIF
        ENDWITH
    ENDPROC

    PROCEDURE SetReport
        LPARAMETER oListenerRef
        THIS.ListenerRef = oListenerRef
    ENDPROC

    PROCEDURE QueryUnload
        IF NOT ISNULL( THIS.ListenerRef )
            THIS.ListenerRef.OnPreviewClose(.F.)
            THIS.ListenerRef = .NULL.
        ENDIF
        THIS.Hide()
        NODEFAULT
    ENDPROC

    PROCEDURE Paint
        IF NOT ISNULL( THIS.ListenerRef )
            THIS.ListenerRef.OutputPage( THIS.PageNo, THIS.Canvas, 2 )
        ENDIF
    ENDPROC
 PROCEDURE Show
        LPARAMETER iMode
        IF NOT ISNULL( THIS.ListenerRef )
            LOCAL nWidthInches, nHeightInches
            nWidthInches  = THIS.ListenerRef.GetPageWidth()/960
            nHeightInches = THIS.ListenerRef.GetPageHeight()/960
            * Assume: Scale by 50% on a 96 DPI screen:
            THIS.Canvas.Height = INT( nHeightInches * 96 * 1 )
            THIS.Canvas.Width  = INT( nWidthInches * 96 * 1 )
        ENDIF
        DODEFAULT( iMode )
    ENDPROC
ENDDEFINE
