#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $aSel, $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt Zeichen im Input-Control einer ComboBox", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; W&auml;hlt ein Item aus
	_GUICtrlComboBox_SetCurSel($hCombo, 2)

	; W&auml;hlt Zeichen im Input-Control einer ComboBox aus
	_GUICtrlComboBox_SetEditSel($hCombo, 0, 4)

	; Ermittelt Zeichen im Input-Control einer ComboBox
	$aSel = _GUICtrlComboBox_GetEditSel($hCombo)
	MemoWrite(StringFormat("Ermittelt Zeichen im Input-Control einer ComboBox: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
