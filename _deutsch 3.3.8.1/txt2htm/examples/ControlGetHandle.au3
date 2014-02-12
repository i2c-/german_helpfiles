Run("notepad.exe")
WinWait("[CLASS:Notepad]")
Local $handle = ControlGetHandle("[CLASS:Notepad]", "", "Edit1")
MsgBox(8256, 'Information', 'Handle des Editorfensters: ' & $handle)
