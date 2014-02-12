#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $aFormats[3] = [2, $CF_TEXT, $CF_OEMTEXT]

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Schau nach, ob irgendein Text in der Zwischenablage ist
	MemoWrite("Bevorzugte Formate .:. " & _ClipBoard_GetPriorityFormat($aFormats))
	MemoWrite("Unicode-Text verf&uuml;gbar .: " & _ClipBoard_IsFormatAvailable($CF_UNICODETEXT))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
