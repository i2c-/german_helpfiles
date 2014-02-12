OnAutoItExitRegister("MyTestFunc")
OnAutoItExitRegister("MyTestFunc2")

Sleep(1000)

OnAutoItExitUnregister("MyTestFunc")

Func MyTestFunc()
	MsgBox(64, "Exit Code 1", 'Exit Nachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc

Func MyTestFunc2()
	MsgBox(64, "Exit Code 2", 'Exit Nachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc2
