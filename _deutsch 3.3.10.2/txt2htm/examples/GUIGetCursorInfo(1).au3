#include <GUIConstantsEx.au3>

Global $x = 0, $y = 0

Example()

Func Example()
	Local $msg
	GUICreate("Esc dr&uuml;cken um die Position zu erhalten", 400, 400)
	$x = GUICtrlCreateLabel("0", 10, 10, 50)
	$y = GUICtrlCreateLabel("0", 10, 30, 50)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example

Func GetPos()
	Local $a = 0

	$a = GUIGetCursorInfo()
	GUICtrlSetData($x, $a[0])
	GUICtrlSetData($y, $a[1])
EndFunc   ;==>GetPos
