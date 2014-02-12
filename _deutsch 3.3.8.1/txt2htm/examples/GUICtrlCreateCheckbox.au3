#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg
	GUICreate("Meine GUI Checkbox") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateCheckbox("Checkbox 1", 10, 10, 120, 20)

	GUISetState() ; Zeigt eine Dialogbox mit 1 Checkbox an

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
