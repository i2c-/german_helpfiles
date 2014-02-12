#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt den horizontalen Scrollbereich", 450, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox(4160, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Setzt den horizontalen Scrollbereich
	_GUICtrlComboBox_SetHorizontalExtent($hCombo, 500)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox(4160, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
