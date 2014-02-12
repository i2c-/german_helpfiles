#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

Global $iMemo

Example()

Func Example()
	Local $aSel, $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: W&auml;hlt Zeichen im Edit-Control aus", 450, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Item ausw&auml;hlen
	_GUICtrlComboBox_SetCurSel($hCombo, 2)

	; W&auml;hlt Zeichen im Edit-Control
	_GUICtrlComboBox_SetEditSel($hCombo, 0, 4)

	; Ermittelt Zeichen im Edit-Control
	$aSel = _GUICtrlComboBox_GetEditSel($hCombo)
	MemoWrite(StringFormat("Markierung: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
