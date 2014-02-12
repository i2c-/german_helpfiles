#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ersetzt den Text im Input-Control", 450, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Schreibt einen Text in das Input-Control
	_GUICtrlComboBox_SetEditText($hCombo, "Alter Text im Input-Control")

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	Sleep(750)

	; Setzt den neuen Text in dem Input-Control
	_GUICtrlComboBox_SetEditSel($hCombo, 0, -1)

	Sleep(750)

	; Begrenze den Text in dem Input-Control
	_GUICtrlComboBox_ReplaceEditSel($hCombo, "Neuer Text im Input-Control")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
