#include <GUIConstantsEx.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <GuiComboBox.au3>
#include <GuiEdit.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hgui, $btnExit, $hReBar, $hToolbar, $hCombo, $hInput
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	$hgui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
;~ 	$hReBar = _GUICtrlReBar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))
	$hReBar = _GUICtrlRebar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_BANDBORDERS))

	$iMemo = GUICtrlCreateEdit("", 2, 100, 396, 250, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")

	; Erstellt eine Combobox in der Rebar
	$hCombo = _GUICtrlComboBox_Create($hgui, "", 0, 0, 90, 120)
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

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
	$hInput = GUICtrlCreateInput("Input-Control", 0, 0, 90, 20)

	; F&uuml;gt eine Gruppe mit dem Control am Anfang der Rebar hinzu
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar)

	; F&uuml;gt eine Gruppe mit dem Control hinzu
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 100, 120, "Dir *.exe:")

	; F&uuml;gt eine Gruppe mit dem Control hinzu
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($hInput), 100, 100, "Name:")

	_GUICtrlRebar_SetBandBackColor($hReBar, 1, Int(0x00008B))
	_GUICtrlRebar_SetBandForeColor($hReBar, 1, Int(0xFFFFFF))

	GUISetState(@SW_SHOW)

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		MemoWrite("Index der Gruppe " & $x & @TAB & "L&auml;nge: " & _GUICtrlRebar_GetBandLength($hReBar, $x))
	Next

	MemoWrite("============================================")

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt die Breite der Gruppe")

	_GUICtrlRebar_SetBandLength($hReBar, 0, 200)

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		MemoWrite("Index der Gruppe " & $x & @TAB & "L&auml;nge: " & _GUICtrlRebar_GetBandLength($hReBar, $x))
	Next

	$btnExit = GUICtrlCreateButton("Beenden", 150, 360, 100, 25)
	GUICtrlSetState($btnExit, $GUI_DEFBUTTON)
	GUICtrlSetState($btnExit, $GUI_FOCUS)


	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $btnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	_GUICtrlEdit_AppendText($iMemo, $sMessage & @CRLF)
EndFunc   ;==>MemoWrite
