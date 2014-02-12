#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $date, $del, $msg

	GUICreate("GUI Control l&ouml;schen", 200, 200, 800, 200)
	$date = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
	$del = GUICtrlCreateButton("Control l&ouml;schen", 50, 50, -1, 20)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
		$msg = GUIGetMsg()
		If $msg = $del Then
			GUICtrlDelete($date)
			GUICtrlDelete($del)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
