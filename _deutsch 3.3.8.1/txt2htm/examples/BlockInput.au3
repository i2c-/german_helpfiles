BlockInput(1)

Run("notepad.exe")
WinWaitActive("[CLASS:Notepad]")
Send("{F5}") ; F&uuml;gt das Datum und die Zeit ein

BlockInput(0)
