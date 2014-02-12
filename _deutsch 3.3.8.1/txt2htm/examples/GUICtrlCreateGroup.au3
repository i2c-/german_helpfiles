#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit der Gruppierfunktion") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateGroup("Gruppe 1", 190, 60, 90, 140)
	GUICtrlCreateRadio("Radio 1", 210, 90, 60, 20)
	GUICtrlCreateRadio("Radio 2", 210, 110, 60, 50)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ; Gruppe schliessen

	GUISetState() ; Zeigt eine leere Dialogbox an

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Local $msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
