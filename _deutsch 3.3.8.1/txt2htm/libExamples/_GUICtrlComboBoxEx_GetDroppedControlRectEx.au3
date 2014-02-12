#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $tRect, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand", 650, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand
	$tRect = _GUICtrlComboBoxEx_GetDroppedControlRectEx($hCombo)
	MsgBox(4160, "Information", "Bildschirmkoordinaten: " & _
			StringFormat("[%d][%d][%d][%d]", DllStructGetData($tRect, "Left"), DllStructGetData($tRect, "Top"), _
			DllStructGetData($tRect, "Right"), DllStructGetData($tRect, "Bottom")))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
