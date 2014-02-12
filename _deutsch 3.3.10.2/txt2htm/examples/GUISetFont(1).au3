#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $sFont = ""

	GUICreate("Meine GUI mit der Standard Schriftart") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$sFont = "Comic Sans MS"
	GUISetFont(9, 400, 4, $sFont) ; Schrift wird unterstrichen
	GUICtrlCreateLabel("Unterschrichenes Label", 10, 20)

	GUISetFont(9, 400, 2, $sFont) ; Schrift wird kursiv geschrieben
	GUICtrlCreateLabel("Kursives Label", 10, 40)

	GUISetFont(9, 400, 8, $sFont) ; Schrift wird durchgestrichen
	GUICtrlCreateLabel("Durchgestrichenes Label", 10, 60)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
