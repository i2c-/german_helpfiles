Run("notepad.exe")
WinWait("[CLASS:Notepad]")
ControlSetText("[CLASS:Notepad]", "", "Edit1", "Den neuen Text hier eingeben")
