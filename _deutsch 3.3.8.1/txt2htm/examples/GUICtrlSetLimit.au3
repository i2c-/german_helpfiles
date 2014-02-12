#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI mit einer Eingabebegrenzung von 3 Zeichen", 450) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateInput("", 10, 20)
	GUICtrlSetLimit(-1, 3) ; Um die Eingabe auf 3 Zeichen zu begrenzen

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
