Local $var = Ping("www.AutoIt.de", 250)
If $var Then; Es geht auch  If @error = 0 Then ...
	MsgBox(0, "Status", "Online, Antwortzeit war:" & $var)
Else
	MsgBox(0, "Status", "Es ist ein Fehler mit der Nummer " & @error & " aufgetreten.")
EndIf
