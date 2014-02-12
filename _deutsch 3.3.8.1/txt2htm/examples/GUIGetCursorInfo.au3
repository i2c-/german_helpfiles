#include <GUIConstantsEx.au3>

Global $x, $y

Example()

Func Example()
	Local $msg

	HotKeySet("{Esc}", "GetPos")

	GUICreate("Esc dr&uuml;cken um die Position zu erhalten", 400, 400)
	$x = GUICtrlCreateLabel("0", 10, 10, 50)
	$y = GUICtrlCreateLabel("0", 10, 30, 50)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func GetPos()
	Local $a

	$a = GUIGetCursorInfo()
	GUICtrlSetData($x, $a[0])
	GUICtrlSetData($y, $a[1])
EndFunc   ;==>GetPos
