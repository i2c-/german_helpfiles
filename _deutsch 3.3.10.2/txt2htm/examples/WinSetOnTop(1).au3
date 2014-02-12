Example()

Func Example()
	; Ermittelt das Handle des aktiven Fensters
	Local $hWnd = WinGetHandle("[ACTIVE]")

	; Setzt das aktive Fenster durch die Verwendung des von WinGetHandle zur&uuml;ckgegebenen Handles in den Vordergrund.
	WinSetOnTop($hWnd, "", 1)

	; Wartet 2 Sekunden um die &Auml;nderung darzustellen
	Sleep(2000)

	; Enfernt den "topmost" Status von dem aktiven Fenster wieder.
	WinSetOnTop($hWnd, "", 0)
EndFunc   ;==>Example
