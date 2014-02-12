#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $tInfo, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt Informationen &uuml;ber die festgelegte ComboBox", 550, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	If _GUICtrlComboBoxEx_GetComboBoxInfo($hCombo, $tInfo) Then _
			MsgBox(4160, "Information", StringFormat("Rechteck des Edit-Controls [%d][%d][%d][%d]", _
			DllStructGetData($tInfo, "EditLeft"), DllStructGetData($tInfo, "EditTop"), _
			DllStructGetData($tInfo, "EditRight"), DllStructGetData($tInfo, "EditBottom")))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
