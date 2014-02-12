#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; &Ouml;ffnet die Zwischenablage
	If _ClipBoard_Open($hGUI) Then

		ShowData($hGUI)

		; Leert die Zwischenablage
		If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty fehlgeschlagen")

		; Schlie&szlig;t die Zwischenablage
		_ClipBoard_Close()
	Else
		_WinAPI_ShowError("_ClipBoard_Open failed")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Zeigt die Statistik der Zwischenablage
Func ShowData($hGUI)
	MemoWrite("GUI Handle ................: " & $hGUI)
	MemoWrite("Clipboard Besitzer ........: " & _ClipBoard_GetOwner())
	MemoWrite("F&uuml;r Clipboard ge&ouml;ffnetes Fenster .: " & _ClipBoard_GetOpenWindow())
	MemoWrite("Clipboard Sequenz .........: " & _ClipBoard_GetSequenceNumber())
	MemoWrite()
EndFunc   ;==>ShowData

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
