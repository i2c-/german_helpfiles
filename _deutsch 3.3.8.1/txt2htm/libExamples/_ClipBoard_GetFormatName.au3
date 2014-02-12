#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $iFormat

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Registriere ein neues Clipboard-Format
	$iFormat = _ClipBoard_RegisterFormat("AutoIt-Bibliothek Text")
	If $iFormat = 0 Then _WinAPI_ShowError("_ClipBoard_RegisterFormat fehlgeschlagen!")

	; Zeigt das neue Format an
	MemoWrite(_ClipBoard_GetFormatName($iFormat))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
