#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Einen String ausw&auml;hlen", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	; F&uuml;gt einen String hinzu
	_GUICtrlComboBox_AddString($hCombo, "Dieser String wurde hinzugef&uuml;gt")
	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($hCombo)

	; W&auml;hlt einen String aus
	_GUICtrlComboBox_SelectString($hCombo, "Dieser")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
