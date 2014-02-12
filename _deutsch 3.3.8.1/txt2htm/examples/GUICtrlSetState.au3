#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Mein GUI Status") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateLabel("Mein deaktiviertes Label", 10, 20)
	GUICtrlSetState(-1, $GUI_DISABLE) ; Das Label ist deaktiviert

	GUICtrlCreateButton("Mein Button", 50, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus ist auf diesem Button

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
