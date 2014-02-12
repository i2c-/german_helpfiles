#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt den horizontalen Scrollbereich", 450, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Setzt den horizontalen Scrollbereich
	_GUICtrlComboBox_SetHorizontalExtent($hCombo, 500)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
