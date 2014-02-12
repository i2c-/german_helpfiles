Example()

Func Example()
	; Startet den Editor
	Local $iPID = Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 10 Sekunden
	Sleep(2000)

	; Schlie&szlig;t den Editorprozessf durch die Verwendung der von Run zur&uuml;ckgegebenen PID.
	ProcessClose($iPID)
EndFunc   ;==>Example
