Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Ermittelt die Position als auch die H&ouml;he und Breite des aktiven Fensters. Dies wird verwendet wenn das Fenster wieder in die urspr&uuml;ngliche Position zur&uuml;ckverschoben werden soll.
	Local $aPos = WinGetPos($hWnd)

	; Verschiebt den Editor auf die X-Position von 0 und Y-Position von 0 und setzt die H&ouml;he auf 200 und Breite auf 200.
	WinMove($hWnd, "", 0, 0, 200, 200)

	; Wartet 2 Sekunden um neue Position des Editorfensters darzustellen.
	Sleep(2000)

	; Verschiebt das Editorfenster zur&uuml;ck auf die urspr&uuml;ngliche Position durch die Verwendung des von WinGetPos zur&uuml;ckgegebenen Arrays.
	WinMove($hWnd, "", $aPos[0], $aPos[1], $aPos[2], $aPos[3])

	; Wartet 2 Sekunden um urspr&uuml;ngliche Position des Editorfensters darzustellen.
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)
EndFunc   ;==>Example
