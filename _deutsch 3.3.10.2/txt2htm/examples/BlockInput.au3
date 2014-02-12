Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Wartet maximal 10 Sekunden bis das Editorfenster erscheint.
	Local $hWnd = WinWait("[CLASS:Notepad]", "", 10)

	; Deaktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput(1)

	; Wartet 2 Sekunden
	Sleep(2000)

	; Sendet die 'F5'-Taste an das Edit-Control des Editors um das Datum und die Uhrzeit anzuzeigen. Das Handle welches durch WinWait zur&uuml;ckgegeben wurde, wird f&uuml;r den "title" Parameter von ControlSend verwendet.
	ControlSend($hWnd, "", "Edit1", "{F5}")

	; Aktiviert die Benutzereingaben durch die Maus und Tastatur.
	BlockInput(0)

	; Wartet 2 Sekunden
	Sleep(2000)

	; Schlie&szlig;t das Editorfenster durch die Verwendung des von WinWait zur&uuml;ckgegebenen Handles.
	WinClose($hWnd)

	; Nun erscheint eine Meldung mit der Frage, ob die &Auml;nderungen gespeichert werden sollen.
	; Der Klassenname (classname) des Fenster lautet "#32770".
	; Anschlie&szlig;end wird die "TAB"-Taste gedr&uuml;ckt um zum zweiten Button zu wechseln. Dieser wird automatisch durch dr&uuml;cken der "ENTER"-Taste bet&auml;tigt, so dass die Datei nicht gespeichert wird.
	WinWaitActive("[CLASS:#32770]")
	Sleep(500)
	Send("{TAB}{ENTER}")
EndFunc   ;==>Example
