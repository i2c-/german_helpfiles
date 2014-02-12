#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die Gr&ouml;&szlig;e des Clientbereichs des Editorfensters durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	Local $aClientSize = WinGetClientSize($hWnd)

	; Zeigt die H&ouml;he und Breite des Clientbereichs an.
	MsgBox($MB_SYSTEMMODAL, "", "Width: " & $aClientSize[0] & @CRLF & "Height: " & $aClientSize[1])

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
