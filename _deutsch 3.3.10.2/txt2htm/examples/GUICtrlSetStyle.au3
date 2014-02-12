#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Mein GUI-Stil") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("Mein deaktiviertes Label", 10, 20, 150, 100)
	GUICtrlSetStyle(-1, $GUI_DISABLE) ; Das Label befindet sich im deaktivierten Status

	GUICtrlCreateButton("Mein Button", 30, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus wird auf den Button gesetzt

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
