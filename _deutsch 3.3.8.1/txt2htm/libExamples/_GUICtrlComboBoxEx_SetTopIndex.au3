#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Stellt sicher, dass ein bestimmtes Item sichtbar ist", 600, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100, $CBS_SIMPLE)
	GUISetState()

	_GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Stellt sicher, dass ein bestimmtes Item sichtbar ist
	MsgBox(4160, "Information", "Stellt sicher, dass ein bestimmtes Item sichtbar ist: " & _GUICtrlComboBoxEx_SetTopIndex($hCombo, Random(50, 149, 1)))
	MsgBox(4160, "Information", "Ermittelt das erste sichtbare Item: " & _GUICtrlComboBoxEx_GetTopIndex($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
