#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Stellt sicher, dass ein bestimmtes Item sichtbar ist", 600, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100, $CBS_SIMPLE)
	GUISetState(@SW_SHOW)

	_GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Stellt sicher, dass ein bestimmtes Item sichtbar ist
	MsgBox($MB_SYSTEMMODAL, "Information", "Stellt sicher, dass ein bestimmtes Item sichtbar ist: " & _GUICtrlComboBoxEx_SetTopIndex($hCombo, Random(50, 149, 1)))
	MsgBox($MB_SYSTEMMODAL, "Information", "Ermittelt das erste sichtbare Item: " & _GUICtrlComboBoxEx_GetTopIndex($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
