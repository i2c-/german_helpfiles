Run("notepad.exe")
WinWait("[CLASS:Notepad]")
Local $pid = WinGetProcess("[CLASS:Notepad]")
MsgBox(0, "PID des Notepads", $pid)
