#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetBkColor(0xE0FFFF) ; &Auml;ndert die Hintergrundfarbe

	GUISetState() ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
