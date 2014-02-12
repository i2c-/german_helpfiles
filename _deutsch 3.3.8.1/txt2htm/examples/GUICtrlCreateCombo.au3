#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg
	GUICreate("Meine GUI combo") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateCombo("item1", 10, 10) ; Erstellt das erste Item
	GUICtrlSetData(-1, "item2|item3", "item3") ; F&uuml;gt andere Items hinzu und setzt einen neuen Standard

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
