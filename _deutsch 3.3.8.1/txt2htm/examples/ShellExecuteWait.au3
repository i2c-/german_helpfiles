Local $val = ShellExecuteWait("notepad.exe")

; Skript wartet bis Notepad beendet ist.
MsgBox(0, 'Programm beendete mit dem "exit code":', $val)
