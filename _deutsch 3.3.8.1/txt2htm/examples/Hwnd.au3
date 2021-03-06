Example()

Func Example()
	; Startet Notepad
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Notepad-Fenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Konvertiert das Handle in einen String.
	Local $sHWnd = String($hWnd)

	; Minimiert das Notepad-Fenster und wartet 2 Sekunden.
	WinSetState(HWnd($sHWnd), "", @SW_MINIMIZE)
	Sleep(2000)

	; Macht eine Fensterminimierung des Notepad-Fensters wieder r&uuml;ckg&auml;ngig und wartet 2 Sekunden.
	WinSetState(HWnd($sHWnd), "", @SW_RESTORE)
	Sleep(2000)

	WinClose(HWnd($sHWnd)) ; Schlie&szlig;t das Notepad-Fenster.
EndFunc   ;==>Example
