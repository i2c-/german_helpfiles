#include <GuiConstantsEx.au3>
#include <GuiReBar.au3>
#include <GuiToolBar.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Global $iMemo

Example()

Func Example()
	Local $hgui, $btnExit, $hReBar, $hToolbar, $hInput, $tBorders
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	$hgui = GUICreate("Rebar", 400, 500, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	$iMemo = GUICtrlCreateEdit("", 2, 40, 396, 410, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")

	; Erstellt eine Toolbar in der Rebar
	$hToolbar = _GUICtrlToolbar_Create($hgui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; F&uuml;gt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Erstellt eine Inputbox in der Rebar
	$hInput = GUICtrlCreateInput("Input-Control", 0, 0, 120, 20)

	; F&uuml;gt eine Gruppe mit dem Control hinzu
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($hInput), 120, 200, "Name:")

	; F&uuml;gt eine Gruppe mit dem Control am Anfang der Rebar hinzu
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	_GUICtrlRebar_SetBandBackColor($hReBar, 1, Int(0x00008B))
	_GUICtrlRebar_SetBandForeColor($hReBar, 1, Int(0xFFFFFF))

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		$tBorders = _GUICtrlRebar_GetBandBordersEx($hReBar, $x)
		MemoWrite("******** Gruppenindex " & $x & " ********")
		MemoWrite("====== R&auml;nder der Gruppe =======")
		MemoWrite("Links..: " & DllStructGetData($tBorders, "Left"))
		MemoWrite("Oben...: " & DllStructGetData($tBorders, "Top"))
		MemoWrite("Rechts.: " & DllStructGetData($tBorders, "Right"))
		MemoWrite("Unten..: " & DllStructGetData($tBorders, "Bottom"))
		$tBorders = _GUICtrlRebar_GetBandRectEx($hReBar, $x)
		MemoWrite("====== Rechteck der Gruppe =====")
		MemoWrite("Links..: " & DllStructGetData($tBorders, "Left"))
		MemoWrite("Oben...: " & DllStructGetData($tBorders, "Top"))
		MemoWrite("Rechts.: " & DllStructGetData($tBorders, "Right"))
		MemoWrite("Unten..: " & DllStructGetData($tBorders, "Bottom"))
		MemoWrite("================================" & @CRLF)
	Next

	$btnExit = GUICtrlCreateButton("Beenden", 150, 460, 100, 25)
	GUICtrlSetState($btnExit, $GUI_DEFBUTTON)
	GUICtrlSetState($btnExit, $GUI_FOCUS)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $btnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
