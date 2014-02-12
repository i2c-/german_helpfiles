#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: L&ouml;scht alle Items", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Setzt den Text des Edit-Controls
	_GUICtrlComboBox_SetEditText($hCombo, "Text des Edit-Controls")

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	Sleep(500)

	; L&ouml;scht alle Items
	_GUICtrlComboBox_ResetContent($hCombo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
