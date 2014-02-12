Local $var = 0
Local $var2 = ""

Select
	Case $var = 1
		MsgBox(0, "", "Der erste Case-Ausdruck ist wahr")
	Case $var2 = "test"
		MsgBox(0, "", "Der zweite Case-Ausdruck ist wahr")
	Case Else
		MsgBox(0, "", "Kein vorheriger Case-Ausdruck war wahr!")
EndSelect
