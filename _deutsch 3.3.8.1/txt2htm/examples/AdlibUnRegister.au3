AdlibRegister("MyAdlib")
;...
AdlibUnRegister("MyAdlib")

Func MyAdlib()
	;... die Ausf&uuml;hrung darf nicht blockiert werden. Funktionen wie ...Wait(), MsgBox(), InputBox() sind zu vermeiden
EndFunc   ;==>MyAdlib
