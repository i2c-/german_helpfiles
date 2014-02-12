Local $result = myDiv(5, 0)
If @error Then
	MsgBox(4096, "Fehler", "Teilung durch Null")
Else
	MsgBox(4096, "Ergebnis", $result)
EndIf
Exit

Func myDiv($dividend, $divisor)
	If $dividend = 0 And $divisor = 0 Then
		SetError(2) ; Nicht ermittelbare Form 0/0
	ElseIf $divisor = 0 Then
		SetError(1) ; Teilung durch Null
	EndIf
	Return $dividend / $divisor
EndFunc   ;==>myDiv
