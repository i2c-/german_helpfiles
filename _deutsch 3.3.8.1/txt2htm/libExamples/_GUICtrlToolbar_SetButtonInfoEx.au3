#include <GuiToolbar.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.
Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hToolbar, $tButton
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")
	GUISetState()

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

	; Setzt Informationen des 'Speichern-Buttons'
	$tButton = DllStructCreate($tagTBBUTTONINFO)
	DllStructSetData($tButton, "Mask", BitOR($TBIF_IMAGE, $TBIF_STATE, $TBIF_SIZE, $TBIF_LPARAM))
	DllStructSetData($tButton, "State", BitOR($TBSTATE_PRESSED, $TBSTATE_ENABLED))
	DllStructSetData($tButton, "Image", $STD_PRINT)
	DllStructSetData($tButton, "CX", 100)
	DllStructSetData($tButton, "Param", 1234)
	_GUICtrlToolbar_SetButtonInfoEx($hToolbar, $idSave, $tButton)

	; Zeigt Informationen des 'Speichern-Buttons'
	$tButton = _GUICtrlToolbar_GetButtonInfoEx($hToolbar, $idSave)
	MemoWrite("Bilderindex ....: " & DllStructGetData($tButton, "Image"))
	MemoWrite("Statusflag .....: " & DllStructGetData($tButton, "State"))
	MemoWrite("Buttonbreite ...: " & DllStructGetData($tButton, "CX"))
	MemoWrite("Parameter ......: " & DllStructGetData($tButton, "Param"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
