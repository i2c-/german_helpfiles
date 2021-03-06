#include <GuiConstantsEx.au3>
#include <Misc.au3>

Example()

Func Example()
	Local $GUI, $coords[4]

	$GUI = GUICreate("Beispiel Mausefalle", 392, 323)
	GUISetBkColor(0xff0000, $GUI)

	GUISetState(@SW_SHOW)

	While 1
		$coords = WinGetPos($GUI)
		_MouseTrap($coords[0], $coords[1], $coords[0] + $coords[2], $coords[1] + $coords[3])
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case Else
				;;;
		EndSwitch
	WEnd
	_MouseTrap()
	Exit
EndFunc   ;==>Example
