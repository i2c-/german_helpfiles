#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $btn_SetData, $btn_GetData

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 450)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	$btn_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				_ClipBoard_SetData("ClipBoard Testdaten")
			Case $btn_GetData
				MemoWrite(_ClipBoard_GetData())
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
