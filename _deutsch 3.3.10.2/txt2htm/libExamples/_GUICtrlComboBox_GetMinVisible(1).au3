#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die minimale Anzahl von sichtbaren Items", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die minimale Anzahl von sichtbaren Items
	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl von sichtbaren Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; Zeigt das Dropdown
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; Setzt die minimale Anzahl von sichtbaren Items
	_GUICtrlComboBox_SetMinVisible($hCombo, 50)

	; Zeigt die Aufklappliste
	_GUICtrlComboBox_ShowDropDown($hCombo)

	Sleep(500)

	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; Ermittelt die minimale Anzahl von sichtbaren Items
	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl von sichtbaren Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($hCombo), 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
