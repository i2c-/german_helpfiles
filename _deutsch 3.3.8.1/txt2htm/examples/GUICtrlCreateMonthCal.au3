#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $Date, $msg
	GUICreate("Datum erhalten", 210, 190)

	$Date = GUICtrlCreateMonthCal("1953/03/25", 10, 10)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st oder ein Timeout vorliegt

	Do
		$msg = GUIGetMsg()
		If $msg = $Date Then MsgBox(0, "Fehlerbeseitigung", "Kalender angeklickt")
	Until $msg = $GUI_EVENT_CLOSE

	MsgBox(0, $msg, GUICtrlRead($Date), 2)
EndFunc   ;==>Example
