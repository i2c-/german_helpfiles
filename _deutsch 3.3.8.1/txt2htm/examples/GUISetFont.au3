#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $font, $msg

	GUICreate("Meine GUI mit der Standard Schriftart") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$font = "Comic Sans MS"
	GUISetFont(9, 400, 4, $font) ; Schrift wird unterstrichen
	GUICtrlCreateLabel("Unterschrichenes Label", 10, 20)

	GUISetFont(9, 400, 2, $font) ; Schrift wird kursiv geschrieben
	GUICtrlCreateLabel("Kursives Label", 10, 40)

	GUISetFont(9, 400, 8, $font) ; Schrift wird durchgestrichen
	GUICtrlCreateLabel("Durchgestrichenes Label", 10, 60)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
