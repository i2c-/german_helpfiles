; Listet alle Prozesse
Local $list = ProcessList()
For $i = 1 To $list[0][0]
	MsgBox(0, $list[$i][0], $list[$i][1])
Next

; Listet nur Prozesse von notepad.exe
$list = ProcessList("notepad.exe")
For $i = 1 To $list[0][0]
	MsgBox(0, $list[$i][0], $list[$i][1])
Next
