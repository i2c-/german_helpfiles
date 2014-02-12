OnAutoItExitRegister("MyTestFunc")
OnAutoItExitRegister("MyTestFunc2")

Sleep(1000)

Func MyTestFunc()
	MsgBox(64, "Exit Ergebnis 1", 'Exit Nachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc

Func MyTestFunc2()
	MsgBox(64, "Exit Ergebnis 2", 'Exit Nachricht von MyTestFunc2()')
EndFunc   ;==>MyTestFunc2
