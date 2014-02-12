#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Erstellt ein Combobox-Control.
	Local $iComboBox = GUICtrlCreateCombo("Item 1", 10, 10, 185, 20)
	Local $iClose = GUICtrlCreateButton("Schlie&szlig;en", 210, 170, 85, 25)

	; F&uuml;gt der Combobox zus&auml;tzliche Items hinzu.
	GUICtrlSetData($iComboBox, "Item 2|Item 3", "Item 2")

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	Local $sComboRead = ""

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

			Case $iComboBox
				$sComboRead = GUICtrlRead($iComboBox)
				MsgBox($MB_SYSTEMMODAL, "", "Die Combobox zeigt momentan folgendes an: " & $sComboRead, 0, $hGUI)

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
