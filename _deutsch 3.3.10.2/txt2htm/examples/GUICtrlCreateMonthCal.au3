#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $Date, $msg
	GUICreate("Datum erhalten", 210, 190)

	$Date = GUICtrlCreateMonthCal("1953/03/25", 10, 10)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st oder ein Timeout vorliegt
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $Date
				MsgBox($MB_SYSTEMMODAL, "Fehlerbeseitigung", "Kalender angeklickt")
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, $msg, GUICtrlRead($Date), 2)
EndFunc   ;==>Example
