#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateCombo("", 10, 10)

	GUICtrlSetData(-1, "Eintrag1|Eintrag2|Eintrag3", "Eintrag3")

	GUISetState() ; Zeigt das leere GUI-Fenster mit einem Bezug auf das Combo-Control

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
