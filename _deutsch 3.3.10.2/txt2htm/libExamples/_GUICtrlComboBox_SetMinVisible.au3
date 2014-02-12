#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt die minimale Anzahl sichtbarer Items", 440, 450)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 436, 426)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.*")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die minimale Anzahl sichtbarer Items der aufgeklappten Liste
	MsgBox(8256, "Information", "Standardm&auml;&szlig;ig Sichtbar:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 2.5)

	; Zeigt die ListBox der ComboBox
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(3000)

	; Versteckt die ListBox der ComboBox
	_GUICtrlComboBox_ShowDropDown($hCombo)

	; Setzt die minimale Anzahl sichtbarer Items
	_GUICtrlComboBox_SetMinVisible($hCombo, 40)

	; Ermittelt die minimale Anzahl sichtbarer Items
	MsgBox(8256, "Information", "Anzahl jetzt sichtbarer Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(3000)

	; Versteckt die ListBox der ComboBox
	_GUICtrlComboBox_ShowDropDown($hCombo)
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
