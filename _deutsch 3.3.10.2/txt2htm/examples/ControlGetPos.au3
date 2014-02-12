#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die X-Position, Y-Position und Gr&ouml;&szlig;e (Breite und H&ouml;he) des Edit-Controls im Editor. Dabei wird f&uuml;r den "title" Parameter von ControlGetPos das von WinWait zur&uuml;ckgegebenen Handle verwendet.
	Local $aPos = ControlGetPos($hWnd, "", "Edit1")

	; Zeigt die Position und Gr&ouml;&szlig;e des Edit-Controls.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & $aPos[0] & ", " & $aPos[1] & @CRLF & "Size: " & $aPos[2] & ", " & $aPos[3])

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
