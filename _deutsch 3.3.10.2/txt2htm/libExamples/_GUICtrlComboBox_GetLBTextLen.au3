#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Textl&auml;nge eines ListBox-Eintrags", 450, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 446, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Ermittelt die Text-L&auml;nge des 3. Eintrags in der Listbox
	MsgBox($MB_SYSTEMMODAL, "Information", "L&auml;nge des Textes im 3. ListBox-Eintrag: " & _GUICtrlComboBox_GetLBTextLen($hCombo, 2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
