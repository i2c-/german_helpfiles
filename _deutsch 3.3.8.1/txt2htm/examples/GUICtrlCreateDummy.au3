#include <GUIConstantsEx.au3>

Example1()
Example2()

Func Example1()
	Local $gui, $user, $button, $cancel, $msg

	$gui = GUICreate("GUICtrlCreateDummy", 250, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe

	$user = GUICtrlCreateDummy()
	$button = GUICtrlCreateButton("OK", 75, 170, 70, 20)
	$cancel = GUICtrlCreateButton("Abbrechen", 150, 170, 70, 20)
	GUISetState()

	Do
		$msg = GUIGetMsg()

		Select
			Case $msg = $button
				GUICtrlSendToDummy($user)
			Case $msg = $cancel
				GUICtrlSendToDummy($user)
			Case $msg = $user
				; Besondere Anweisungen vor Skriptende
				; ...
				WinClose($gui)
		EndSelect
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example1



Func Example2()
	Local $gui, $CheckboxesStart, $CheckboxesStop, $CheckAll, $UnCheckAll, $msg

	$gui = GUICreate("Dummy-Control", 200, 850)

	$CheckboxesStart = GUICtrlCreateDummy() ; ==> Merkt sich den Start
	For $i = 0 To 49
		GUICtrlCreateCheckbox("Checkbox " & $i + 1, 0, 0 + ($i * 17))
	Next
	$CheckboxesStop = GUICtrlCreateDummy() ; ==> Merkt sich den Stopp

	$CheckAll = GUICtrlCreateButton("alle markieren", 100, 100)
	$UnCheckAll = GUICtrlCreateButton("alle demarkieren", 100, 130)

	GUISetState()

	While 1
		$msg = GUIGetMsg()

		Switch $msg
			Case $CheckAll
				For $i = $CheckboxesStart To $CheckboxesStop
					GUICtrlSetState($i, $GUI_CHECKED)
				Next
			Case $UnCheckAll
				For $i = $CheckboxesStart To $CheckboxesStop
					GUICtrlSetState($i, $GUI_UNCHECKED)
				Next
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example2
