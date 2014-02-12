#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Sendet einen Befehl an das Edit-Control des Editors um die Anzahl der Zeilen zuu ermitteln. Dabei wird f&uuml;r den "title" Parameter von ControlCommand das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	Local $iCount = ControlCommand($hWnd, "", "Edit1", "GetLineCount", "")

	; Zeigt die Anzahl von Zeilen
	MsgBox($MB_SYSTEMMODAL, "", "Die Anzahl von Zeilen im Editor sind: " & $iCount)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
