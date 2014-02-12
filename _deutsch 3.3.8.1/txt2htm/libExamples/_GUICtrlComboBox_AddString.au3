#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: String hinzuf&uuml;gen", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	; String hinzuf&uuml;gen
	_GUICtrlComboBox_AddString($hCombo, "Dieser String wurde hinzugef&uuml;gt")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
