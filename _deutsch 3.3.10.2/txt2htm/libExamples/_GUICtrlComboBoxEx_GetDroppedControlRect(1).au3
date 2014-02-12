#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $aRect, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand", 650, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand
	$aRect = _GUICtrlComboBoxEx_GetDroppedControlRect($hCombo)
	MsgBox($MB_SYSTEMMODAL, "Information", "Bildschirmkoordinaten: " & StringFormat("[%d][%d][%d][%d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3]))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
