Local $msg = ""
Local $szName = InputBox(Default, "Bitte ein Wort eingeben.", "", " M", Default, Default, Default, Default, 10)
Switch @error
	Case 2
		$msg = "Timeout "
		ContinueCase
	Case 1; Vorigen Case-Tree fortsetzen
		$msg &= "Abbruch"
	Case 0
		Switch $szName
			Case "a", "e", "i", "o", "u"
				$msg = "Vokal"
			Case "QP"
				$msg = "Mathematik"
			Case "Q" To "QZ"
				$msg = "Wissenschaft"
			Case Else
				$msg = "Sonstiges"
		EndSwitch
	Case Else
		$msg = "Irgendwas ging v&ouml;llig schief."
EndSwitch

MsgBox(0, Default, $msg)
