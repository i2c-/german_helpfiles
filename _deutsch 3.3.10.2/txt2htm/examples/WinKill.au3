Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Skeunden bevor die WinKill-Funktion aufgerufen wird.
	Sleep(2000)

	; Erzwingt die Schlie&szlig;ung des Fensters durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinKill($hWnd, "")
EndFunc   ;==>Example
