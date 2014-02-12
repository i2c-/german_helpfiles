#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>

Example1()
Example2()
Example3()
Example4()

; Beispiel1
Func Example1()
	Local $date, $msg

	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	$date = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE

	MsgBox(0, "Datum", GUICtrlRead($date))
	GUIDelete()
EndFunc   ;==>Example1

; Beispiel2
Func Example2()
	Local $n, $msg

	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	$n = GUICtrlCreateDate("", 10, 10, 100, 20, $DTS_SHORTDATEFORMAT)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE

	MsgBox(0, "Datum", GUICtrlRead($n))
	GUIDelete()
EndFunc   ;==>Example2

; Beispiel3
Func Example3()
	Local $date, $DTM_SETFORMAT_, $style

	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	$date = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)

	; Um ein bestimmtes Standardformat auszuw&auml;hlen
	$DTM_SETFORMAT_ = 0x1032 ; $DTM_SETFORMATW
	$style = "yyyy/MM/dd HH:mm:ss"
	GUICtrlSendMsg($date, $DTM_SETFORMAT_, 0, $style)

	GUISetState()
	While GUIGetMsg() <> $GUI_EVENT_CLOSE
	WEnd

	MsgBox(0, "Zeit", GUICtrlRead($date))
EndFunc   ;==>Example3

; example4
Func Example4()
	Local $n, $msg

	GUICreate("Meine GUI ermittelt die Zeit", 200, 200, 800, 200)
	$n = GUICtrlCreateDate("", 20, 20, 100, 20, $DTS_TIMEFORMAT)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE

	MsgBox(0, "Zeit", GUICtrlRead($n))
	GUIDelete()
EndFunc   ;==>Example4
