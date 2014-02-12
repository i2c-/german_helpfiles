#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tInfo, $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Informationen ermitteln", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	If _GUICtrlComboBox_GetComboBoxInfo($hCombo, $tInfo) Then
		MemoWrite("Handle der ComboBox ........: " & DllStructGetData($tInfo, "hCombo"))
		MemoWrite("Handle der EditBox .........: " & DllStructGetData($tInfo, "hEdit"))
		MemoWrite('Handle der "Drop-down"-Liste: ' & DllStructGetData($tInfo, "hList"))
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
