#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $aRect, $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Bildschirmkoordinaten im ausgeklappten Zustand", 530, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 526, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 526, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die Bildschirmkoordinaten der Combobox mit ausgeklappter Listbox
	$aRect = _GUICtrlComboBox_GetDroppedControlRect($hCombo)
	MemoWrite("X-Koordinate der oberen linken Ecke ......: " & $aRect[0])
	MemoWrite("Y-Koordinate der oberen linken Ecke ......: " & $aRect[1])
	MemoWrite("X-Koordinate der unteren rechten Ecke ....: " & $aRect[2])
	MemoWrite("Y-Koordinate der unteren rechten Ecke ....: " & $aRect[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
