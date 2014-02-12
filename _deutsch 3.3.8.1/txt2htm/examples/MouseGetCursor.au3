Sleep(2000) ; Zeit, um die Maus zu bewegen, bevor die ID abgefragt wird

; Erstellt ein Array mit einer Zuordnung zwischen der Zeigerart und der ID Nummer
Local $IDs = StringSplit("AppStarting|Arrow|Cross|Help|IBeam|Icon|No|" & _
		"Size|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait|Hand", "|")
$IDs[0] = "Unknown"

Local $cursor = MouseGetCursor()
MsgBox(4096, "ID = " & $cursor, "Dies bedeutet: " & $IDs[$cursor])
