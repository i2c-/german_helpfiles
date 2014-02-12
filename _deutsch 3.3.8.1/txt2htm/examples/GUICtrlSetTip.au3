#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI mit dem Hinweis-Control") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("mein Label", 10, 20)
	GUICtrlSetTip(-1, "Hinweis meines Labels")

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
