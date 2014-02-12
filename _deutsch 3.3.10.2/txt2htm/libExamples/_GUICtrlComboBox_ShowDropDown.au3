#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Zeigt die ListBox", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt, ob die ListBox der ComboBox aufgeklappt ist
	MemoWrite("Status des Dropdowns......: " & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; Zeigt die ListBox
	_GUICtrlComboBox_ShowDropDown($hCombo, True)

	Sleep(500)

	; Ermittelt, ob die ListBox der ComboBox aufgeklappt ist
	MemoWrite("Status des Dropdowns......: " & _GUICtrlComboBox_GetDroppedState($hCombo))

	Sleep(500)

	; Versteckt die ListBox
	_GUICtrlComboBox_ShowDropDown($hCombo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
