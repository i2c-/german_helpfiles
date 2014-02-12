#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

; Ben&ouml;tigt mindestens Windows Vista!

Global $iMemo
_Main()

Func _Main()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Hinweistext setzen und auslesen", 400, 296)
	$iMemo = GUICtrlCreateEdit("", 10, 50, 376, 234, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)

	; Setzt den "cue banner"-Hinweistext der Combobox
	_GUICtrlComboBox_SetCueBanner($hCombo, "W&auml;hle ein Item aus")
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Liest den Hinweistext aus und schreibt ihn ins Memo
	MemoWrite("Combobox-Hinweis: " & _GUICtrlComboBox_GetCueBanner($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
