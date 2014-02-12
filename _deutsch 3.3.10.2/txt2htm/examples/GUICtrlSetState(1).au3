#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Beispiel", 420, 200, -1, -1, -1, $WS_EX_ACCEPTFILES)

	; Erstellt ein Label und setzt den Status "Drop"-Aktionen annehmen.
	Local $iLabel = GUICtrlCreateLabel("Ziehe eine Datei auf dieses Label.", 10, 10, 400, 40, $WS_BORDER)
	GUICtrlSetState($iLabel, $GUI_DROPACCEPTED)

	; Erstellt ein Input und setzt den Status "Drop"-Aktionen annehmen.
	Local $iInput = GUICtrlCreateInput("", 10, 60, 400, 22)
	GUICtrlSetState($iInput, $GUI_DROPACCEPTED)

	Local $iOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iOK
				ExitLoop

			Case $GUI_EVENT_DROPPED
				; Falls der Wert von @GUI_DropId $iLabel ist, so wird der Pfad und Dateiname in das Label geschrieben.
				If @GUI_DropId = $iLabel Then GUICtrlSetData($iLabel, @GUI_DragFile)

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
