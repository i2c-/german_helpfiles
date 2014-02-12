#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI Textfarbe") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("Mein rotes Label", 10, 20)
	GUICtrlSetColor(-1, 0xff0000) ; Rot

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
