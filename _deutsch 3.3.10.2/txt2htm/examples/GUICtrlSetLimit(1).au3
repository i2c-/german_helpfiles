#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("Meine GUI mit einer Eingabebegrenzung von 3 Zeichen", 450) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUICtrlCreateInput("", 10, 20)
	GUICtrlSetLimit(-1, 3) ; Um die Eingabe auf 3 Zeichen zu begrenzen

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
EndFunc   ;==>Example
