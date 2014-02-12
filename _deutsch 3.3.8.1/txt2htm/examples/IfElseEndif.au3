If $var > 0 Then
	MsgBox(4096, "", "Der Wert ist positiv")
ElseIf $var < 0 Then
	MsgBox(4096, "", "Der Wert ist negativ")
Else
	If StringIsXDigit($var) Then
		MsgBox(4096, "", "Der Wert k&ouml;nnte hexadezimal sein!")
	Else
		MsgBox(4096, "", "Der Wert ist ein String ")
	EndIf
EndIf
