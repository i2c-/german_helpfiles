#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die Position und Gr&ouml;&szlig;e des Notepad-Fensters durch &Uuml;bergabe des Handles an WinGetPos.
	Local $aPos = WinGetPos($hWnd)

	; Pr&uuml;ft, ob die Variable ein Array ist.
	If IsArray($aPos) Then
		MsgBox($MB_SYSTEMMODAL, "Erfolg", "Fensterh&ouml;he: " & $aPos[3])
	Else
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Es trat ein Fehler auf.")
	EndIf

	; Schlie&szlig;t das Editor-Fenster mit Hilfe eines Handles, zur&uuml;ckgegeben durch WinWait.
	WinClose($hWnd)
EndFunc   ;==>Example
