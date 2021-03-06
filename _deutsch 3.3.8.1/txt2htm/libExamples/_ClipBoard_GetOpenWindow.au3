#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Zwischenablage", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; &Ouml;ffnet die Zwischenablage
	If Not _ClipBoard_Open($hGUI) Then _WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")

	ShowData($hGUI)

	; Schlie&szlig;t die Zwischenablage
	_ClipBoard_Close()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Zeigt Informationen &uuml;ber die Zwischenablage
Func ShowData($hGUI)
	MemoWrite("GUI Handle ...............: " & $hGUI)
	MemoWrite("Clipboard Besitzer .......: " & _ClipBoard_GetOwner())
	MemoWrite("Clipboard Fenster offen ..: " & _ClipBoard_GetOpenWindow())
	MemoWrite("Clipboard Sequenz-Nr. ....: " & _ClipBoard_GetSequenceNumber())
	MemoWrite()
EndFunc   ;==>ShowData

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
