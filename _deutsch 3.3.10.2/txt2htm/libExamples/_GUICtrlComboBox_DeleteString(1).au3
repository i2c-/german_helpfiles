#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: L&ouml;scht einen String", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Add drives
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	; L&ouml;scht einen String
	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;scht den String bei Index 1")
	_GUICtrlComboBox_DeleteString($hCombo, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
