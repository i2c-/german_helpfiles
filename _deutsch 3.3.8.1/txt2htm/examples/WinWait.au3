; Wartet bis das Fenster "[CLASS:Notepad]" existiert

Run("notepad.exe")
WinWait("[CLASS:Notepad]")

; Wartet maximal 5 Sekunden bis das Fenster existiert
WinWait("[CLASS:Notepad]", "", 5)
