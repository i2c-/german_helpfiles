Local $x = "   " & @LF & Chr(11) & @TAB & " " & @CRLF
If StringIsSpace($x) Then
	MsgBox(0, "", "Der String enth&auml;lt nur 'Leer'-Zeichen.")
EndIf
