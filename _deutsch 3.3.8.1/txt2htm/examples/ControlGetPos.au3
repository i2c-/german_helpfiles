Run("notepad.exe")
WinWait("[CLASS:Notepad]")
Local $pos = ControlGetPos("[CLASS:Notepad]", "", "Edit1")
MsgBox(0, "Fenster Statistiken:", "Position: " & $pos[0] & "," & $pos[1] & " Gr&ouml;&szlig;e: " & $pos[2] & "," & $pos[3])
