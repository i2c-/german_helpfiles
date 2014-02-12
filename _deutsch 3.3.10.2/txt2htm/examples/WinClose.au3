Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden bis das Editorfenster dargestellt wird.
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des Klassennamens (classname) vom Editor.
	WinClose("[CLASS:Notepad]")
EndFunc   ;==>Example
