#include <GUIConstantsEx.au3>

Example()

Func Example()

	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetHelp("notepad") ; Startet den Editor falls F1 gedr&uuml;ckt wird

	GUISetState(@SW_SHOW) ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
