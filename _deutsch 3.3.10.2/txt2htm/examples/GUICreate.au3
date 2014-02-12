#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel")
	Local $iOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iOK
				ExitLoop

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
