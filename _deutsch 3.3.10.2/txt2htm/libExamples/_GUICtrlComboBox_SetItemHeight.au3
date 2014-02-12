#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt die Itemh&ouml;he", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die Itemh&ouml;he (Auswahlfeld)
	MemoWrite("Itemh&ouml;he (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Ermittelt die Itemh&ouml;he (Listitems)
	MemoWrite("Itemh&ouml;he (Listitems): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Setzt die Itemh&ouml;he (Auswahlfeld)
	_GUICtrlComboBox_SetItemHeight($hCombo, 18)

	; Setzt die Itemh&ouml;he (Listitems)
	_GUICtrlComboBox_SetItemHeight($hCombo, 20, 0)

	; Ermittelt die Itemh&ouml;he (Auswahlfeld)
	MemoWrite("Itemh&ouml;he (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Ermittelt die Itemh&ouml;he (Listitems)
	MemoWrite("Itemh&ouml;he (Listitems): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
