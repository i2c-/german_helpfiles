#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel", 300, 200)

	; Erstellt ein Label-Control.
	Local $iLabel = GUICtrlCreateLabel("Ein Textstring", 10, 10, 185, 17)
	Local $iClose = GUICtrlCreateButton("Schlie&szlig;en", 210, 170, 85, 25)

	; Setzt die Farbe des Label-Controls.
	GUICtrlSetColor($iLabel, $COLOR_RED)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
