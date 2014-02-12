Local $msg
Switch @HOUR
	Case 6 To 11
		$msg = "Guten Morgen"
	Case 12 To 17
		$msg = "Guten Tag"
	Case 18 To 21
		$msg = "Guten Abend"
	Case Else
		$msg = "Warum bist du noch wach?"
EndSwitch

MsgBox(0, Default, $msg)
