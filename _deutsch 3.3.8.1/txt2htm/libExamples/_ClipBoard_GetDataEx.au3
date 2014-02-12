#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $btn_SetData, $btn_GetData, $hMemory, $tData

	; Erstellt eine GUI
	$hGUI = GUICreate("Zwischenablage", 600, 450)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	$btn_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				_ClipBoard_SetData("ClipBoard Testdaten")
			Case $btn_GetData
				; &Ouml;ffnet die Zwischenablage
				If Not _ClipBoard_Open($hGUI) Then _WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")

				; Liest Text aus der Zwischenablage
				$hMemory = _ClipBoard_GetDataEx($CF_TEXT)
				If $hMemory = 0 Then _WinAPI_ShowError("_ClipBoard_GetDataEx fehlgeschlagen!")
				; Schlie&szlig;t die Zwischenablage
				_ClipBoard_Close()
				$tData = DllStructCreate("char Text[8192]", $hMemory)
				MemoWrite(DllStructGetData($tData, "Text"))
		EndSwitch
	WEnd

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
