#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Verwendete Schriftart der Controls.
	Local Const $sFont = "Comic Sans Ms"

	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel", 300, 200)

	; Erstellt Label-Controls.
	GUICtrlCreateLabel("Ein unterstrichener Textstring", 10, 10, 185, 17)
	GUICtrlSetFont(-1, 9, 400, 4, $sFont) ; Setzt die Schrift des vorherigen Controls.

	Local $iLabel2 = GUICtrlCreateLabel("Ein kursiver Textstring", 10, 30, 185, 17)
	GUICtrlSetFont($iLabel2, 9, 400, 2, $sFont) ; Setzt die Schrift der ControlID die in $iLabel2 gespeichert wurde.

	Local $iLabel3 = GUICtrlCreateLabel("Ein durchgestrichenerr Textstring", 10, 50, 290, 17)
	GUICtrlSetFont($iLabel3, 9, 400, 8, $sFont) ; Setzt die Schrift der ControlID die in $iLabel3 gespeichert wurde.

	Local $iClose = GUICtrlCreateButton("Schlie&szlig;en", 210, 170, 85, 25)

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
