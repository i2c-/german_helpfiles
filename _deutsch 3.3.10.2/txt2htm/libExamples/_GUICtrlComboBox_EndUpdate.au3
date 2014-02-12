#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Update beenden", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
