#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $n, $msg

	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	$n = GUICtrlCreateDate("", 10, 10, 100, 20, $DTS_SHORTDATEFORMAT)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Datum", GUICtrlRead($n))
	GUIDelete()
EndFunc   ;==>Example
