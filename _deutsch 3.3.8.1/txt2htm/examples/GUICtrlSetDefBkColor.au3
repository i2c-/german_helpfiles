#include <GUIConstantsEx.au3>

Beispiel()

Func Beispiel()
	Local $msg

	GUICreate("Test GUISetTextColor", 100, 100) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlSetDefBkColor(0xFF0000) ; &Auml;ndert die Hintergrundfarbe f&uuml;r alle definierten Controls

	GUICtrlCreateLabel("Label", 10, 5)

	GUICtrlCreateRadio("Radio", 10, 25, 50)
	GUICtrlSetBkColor(-1, 0x0000FF) ; &Auml;ndert die Hintergrundfarbe f&uuml;r das zuletzt definierte Control

	GUICtrlCreateButton("Button", 10, 55)

	GUISetState() ; Zeigt eine leere Dialogbox

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Beispiel
