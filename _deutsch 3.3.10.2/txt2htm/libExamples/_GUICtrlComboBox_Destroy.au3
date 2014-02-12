#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("(UDF) ComboBox: Zerst&ouml;ren", 400, 296)
	$hCombo = _GUICtrlComboBox_Create($hGUI, "", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Zerst&ouml;rt die ComboBox
	MsgBox($MB_SYSTEMMODAL, "Information", "ComboBox zerst&ouml;ren")
	MsgBox($MB_SYSTEMMODAL, "Information", "Zers&ouml;rt: " & _GUICtrlComboBox_Destroy($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
