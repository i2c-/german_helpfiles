#OnAutoItStartRegister "MyTestFunc"
#OnAutoItStartRegister "MyTestFunc2"

Sleep(1000)

Func MyTestFunc()
	MsgBox(64, "Start Ergebnis 2", 'Startnachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc

Func MyTestFunc2()
	MsgBox(64, "Start Ergebnis 3", 'Startnachricht  von MyTestFunc()')
EndFunc   ;==>MyTestFunc2
