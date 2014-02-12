#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hToolbar, $fStyle
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 550, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 36, 546, 262, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

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

	; &Auml;ndert den Stil des Controls
	$fStyle = _GUICtrlToolbar_GetStyleCustomErase($hToolbar)
	MemoWrite("Das Control erzeugt NM_CUSTOMDRAW Nachrichten .: " & $fStyle)
	_GUICtrlToolbar_SetStyleCustomErase($hToolbar, Not $fStyle)
	MemoWrite("Das Control erzeugt NM_CUSTOMDRAW Nachrichten .: " & _GUICtrlToolbar_GetStyleCustomErase($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
