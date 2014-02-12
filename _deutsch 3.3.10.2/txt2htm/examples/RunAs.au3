Example()

Func Example()
	; Hier den Benutzername und Passwort eingeben, die dem System entsprechen.
	Local $sUserName = "Benutzername"
	Local $sPassword = "Passwort"

	; Startet den Editor mit einem maximierten Fenster. Der Editor l&auml;uft unter dem obigen Benutzer.
	Local $iPID = RunAs($sUserName, @ComputerName, $sPassword, 0, "notepad.exe", "", @SW_SHOWMAXIMIZED)

	; Wartet 10 Sekunden bis das Editorfenster erscheint.
	WinWait("[CLASS:Notepad]", "", 10)

	; Wartet 2 Sekunden.
	Sleep(2000)

	; Schlie&szlig;t den Editor Prozess mit Hilfe der PID die durch RunAs zur&uuml;ckgegeben wurde.
	ProcessClose($iPID)
EndFunc   ;==>Example
