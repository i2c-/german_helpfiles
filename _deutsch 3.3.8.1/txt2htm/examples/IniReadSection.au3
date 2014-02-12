Local $var = IniReadSection("C:\Temp\meineDatei.ini", "sektion2")
If @error Then
	MsgBox(4096, "", "Es ist ein Fehler aufgetreten. Warscheinlich keine INI Datei vorhanden.")
Else
	For $i = 1 To $var[0][0]
		MsgBox(4096, "", "Schl&uuml;ssel: " & $var[$i][0] & @CRLF & "Wert: " & $var[$i][1])
	Next
EndIf
