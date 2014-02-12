WinMove("[active]", "", Default, Default, 200, 300) ; Nur die Gr&ouml;sse des aktiven Fensters &auml;ndern (kein Bewegen)

MyFunc2(Default, Default)

Func MyFunc2($Param1 = Default, $Param2 = 'Zwei', $Param3 = Default)
	If $Param1 = Default Then $Param1 = 'Eins'
	If $Param3 = Default Then $Param3 = 'Drei'

	MsgBox(0, 'Parameter', '1 = ' & $Param1 & @LF & _
			'2 = ' & $Param2 & @LF & _
			'3 = ' & $Param3)
EndFunc   ;==>MyFunc2
