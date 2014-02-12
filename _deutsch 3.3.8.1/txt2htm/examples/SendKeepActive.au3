Run("notepad.exe")
WinWait("[CLASS:Notepad]")

SendKeepActive("[CLASS:Notepad]")


; Zum Testen sollte w&auml;hrend der Pausen das aktive Fenster gewechselt werden. Ist die Pause fertig, wird automatisch wieder das richtige Fenster ausgew&auml;hlt.
For $i = 1 To 10
	Sleep(1000)
	Send("Hallo")
Next
