Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Setzt die Priorit&auml;t des Editorprozesses auf "Idle/Low".
	ProcessSetPriority("notepad.exe", 0)

	; Wartet 10 Sekunden
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
