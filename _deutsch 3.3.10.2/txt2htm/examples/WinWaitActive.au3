Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	WinWaitActive("[CLASS:Notepad]", "", 10)

	; Wartet 2 Skeunden um das Editorfenster darzustellen.
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des Klassennamens (classname) vom Editor.
	WinClose("[CLASS:Notepad]")
EndFunc   ;==>Example
