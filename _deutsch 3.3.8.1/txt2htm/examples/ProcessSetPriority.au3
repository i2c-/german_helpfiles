Run("notepad.exe")
WinWait("[CLASS:Notepad]")
ProcessSetPriority("notepad.exe", 0)
; Der Editor sollte nun geringe bzw. keine Priorit&auml;t mehr haben
