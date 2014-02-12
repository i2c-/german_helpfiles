#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Erstellt ein Checkbox-Control.
	Local $iCheckbox = GUICtrlCreateCheckbox("Standard Checkbox", 10, 10, 185, 25)
	Local $iClose = GUICtrlCreateButton("Close", 210, 170, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

			Case $iCheckbox
				If _IsChecked($iCheckbox) Then
					MsgBox($MB_SYSTEMMODAL, "", "Die Checkbox ist angehakt.", 0, $hGUI)
				Else
					MsgBox($MB_SYSTEMMODAL, "", "Die Checkbox ist nicht angehakt.", 0, $hGUI)
				EndIf

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example

Func _IsChecked($iControlID)
	Return BitAND(GUICtrlRead($iControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked
