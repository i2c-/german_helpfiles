AdlibRegister("MyAdlib")
;...
Exit

Func MyAdlib()
	;... die Ausf&uuml;hrung darf nicht blockiert werden. Die Verwendung der ...Wait(), MsgBox(), InputBox() Funktionen ist daher zu vermeiden.
	If WinActive("Fehler") Then
		;...
	EndIf
EndFunc   ;==>MyAdlib
