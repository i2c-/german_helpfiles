Local $sum = 0
While 1 ; Endlosschleife bis ExitLoop aufgerufen wird
	Local $ans = InputBox("Summe=" & $sum, _
			"	Bitte eine positive Zahl eingeben.  (Durch die Eingabe einer negativen Zahl wird die InputBox beendet)")
	If $ans < 0 Then ExitLoop
	$sum = $sum + $ans
WEnd
MsgBox(0, "Die Summe betr&auml;gt", $sum)
