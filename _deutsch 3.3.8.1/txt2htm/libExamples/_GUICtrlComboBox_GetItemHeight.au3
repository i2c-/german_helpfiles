#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die H&ouml;he eines Items", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die H&ouml;he des Items (Auswahlfeld)
	MemoWrite("Item H&ouml;he (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Ermittelt die H&ouml;he des Items (in der Liste)
	MemoWrite("Item H&ouml;he (in der Liste): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Setzt die H&ouml;he des Items (Auswahlfeld)
	_GUICtrlComboBox_SetItemHeight($hCombo, 18)

	; Setzt die H&ouml;he des Items (in der Liste)
	_GUICtrlComboBox_SetItemHeight($hCombo, 20, 0)

	; Ermittelt die H&ouml;he des Items (Auswahlfeld)
	MemoWrite("Item H&ouml;he (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($hCombo))

	; Ermittelt die H&ouml;he des Items (in der Liste)
	MemoWrite("Item H&ouml;he (in der Liste): " & _GUICtrlComboBox_GetItemHeight($hCombo, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
