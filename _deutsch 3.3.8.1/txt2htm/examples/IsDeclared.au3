If Not IsDeclared("a") Then
	MsgBox(0, "", "$a ist NICHT deklariert") ; $a wurde nie zugewiesen
EndIf

Local $a = 1

If IsDeclared("a") Then
	MsgBox(0, "", "$a IST deklariert") ; Wenn vorher z.B. $a=1 zugewiesen wurde
EndIf
