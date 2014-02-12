#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateButton("Mein Bild-Button", 10, 20, 40, 40, $BS_ICON)
	GUICtrlSetImage(-1, "shell32.dll", 22)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
