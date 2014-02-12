Local $val = RunWait(@WindowsDir & "\Notepad.exe", @WindowsDir, @SW_MAXIMIZE)
; Skript wartet bis der Editor wieder beendet wurde
MsgBox(0, "Programm gab folgenden Exitcode zur&uuml;ck:", $val)
