#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI Hintergrundfarbe") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("Mein Label", 10, 20)
	GUICtrlSetBkColor(-1, 0x00ff00) ; Gr&uuml;n

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
