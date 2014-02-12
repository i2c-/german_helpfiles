Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis der Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Aktiviert das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinActivate($hWnd)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
