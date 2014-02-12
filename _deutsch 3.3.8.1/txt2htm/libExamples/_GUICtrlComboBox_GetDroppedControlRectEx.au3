#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $tRect, $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand", 650, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand
	$tRect = _GUICtrlComboBox_GetDroppedControlRectEx($hCombo)

	MemoWrite("X-Koordinate der oberen linken Ecke .......: " & DllStructGetData($tRect, "Left"))
	MemoWrite("Y-Koordinate der oberen linken Ecke .......: " & DllStructGetData($tRect, "Top"))
	MemoWrite("X-Koordinate der unteren rechten Ecke .....: " & DllStructGetData($tRect, "Right"))
	MemoWrite("Y-Koordinate der unteren rechten Ecke .....: " & DllStructGetData($tRect, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
