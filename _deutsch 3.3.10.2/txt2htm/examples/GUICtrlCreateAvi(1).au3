#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel", 300, 200)

	; Erstellt ein Animationscontrol.
	Local $iAnimation = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 165, 15, 0, 300)
	Local $iStart = GUICtrlCreateButton("Start", 60, 150, 85, 25)
	Local $iStop = GUICtrlCreateButton("Stop", 160, 150, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $iStart ; Startet die Animation.
				GUICtrlSetState($iAnimation, $GUI_AVISTART)

			Case $iStop ; Beendet die Animation.
				GUICtrlSetState($iAnimation, $GUI_AVISTOP)

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
