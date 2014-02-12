#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Benutzerdefinierte Msgbox", 270, 80)

	GUICtrlCreateLabel("Bitte klicke einen Button an!", 70, 10)
	Local $iYesID = GUICtrlCreateButton("Ja", 40, 50, 50, 20)
	Local $iNoID = GUICtrlCreateButton("Nein", 110, 50, 50, 20)
	Local $iExitID = GUICtrlCreateButton("Beenden", 180, 50, 50, 20)

	; Weist bestimmten Buttons Schnellzugriffstasten zu (f&uuml;r Strg+y und Strg+n)
	Local $aAccelKeys[2][2] = [["^y", $iYesID],["^n", $iNoID]]
	GUISetAccelerators($aAccelKeys)

	GUISetState(@SW_SHOW) ; Zeigt die GUI an


		While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "Bet&auml;tigter Button", "Schlie&szlig;en")
				ExitLoop

			Case $iYesID
				MsgBox($MB_SYSTEMMODAL, "Bet&auml;tigter Button", "Ja") ; Erscheint wenn der button ausgew&auml;hlt wurde oder der Hotkey Ctrl + y gedr&uuml;ckt w&uuml;rde

			Case $iNoID
				MsgBox($MB_SYSTEMMODAL, "Bet&auml;tigter Button", "Nein") ; rscheint wenn der button ausgew&auml;hlt wurde oder der Hotkey Ctrl + n gedr&uuml;ckt w&uuml;rde

			Case $iExitID
				MsgBox($MB_SYSTEMMODAL, "Bet&auml;tigter Button", "Beenden")
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete() ; L&ouml;scht die GUI
EndFunc   ;==>Example
