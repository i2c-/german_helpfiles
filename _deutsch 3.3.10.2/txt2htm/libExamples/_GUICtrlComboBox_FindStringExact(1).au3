#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Finde den exakten String", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_AddString($hCombo, "Dies ist ein Test")
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBox_AddString($hCombo, "Dies ist der exakte String")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; String finden
	MsgBox($MB_SYSTEMMODAL, "Information", "String gefunden: " & _GUICtrlComboBox_FindStringExact($hCombo, "Dies ist der exakte String"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
