Run("notepad.exe")
WinWait("[CLASS:Notepad]")
WinSetTitle("[CLASS:Notepad]", "", "Mein neuer Editor")
