#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $font, $msg

	GUICreate("Meine GUI mit der Standard Schriftart") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$font = "Comic Sans MS"
	GUICtrlCreateLabel("unterstrichenes Label", 10, 20)
	GUICtrlSetFont(-1, 9, 400, 4, $font) ; Schrift wird unterstrichen

	GUICtrlCreateLabel("kursives Label", 10, 40)
	GUICtrlSetFont(-1, 9, 400, 2, $font) ; Schrift wird kursiv geschrieben

	GUISetFont(9, 400, 8, $font) ; Schrift wird durchgestrichen
	GUICtrlCreateLabel("durchgestrichenes Label", 10, 60)

	GUISetState() ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
