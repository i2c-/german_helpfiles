#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Verzeichnis hinzuf&uuml;gen", 400, 300, -1, -1, -1)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUICtrlCreateInput("Input control", 2, 30, 120)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien eines Verzeichnisses mittels _GUICtrlComboBoxEx_AddDir hinzu
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
