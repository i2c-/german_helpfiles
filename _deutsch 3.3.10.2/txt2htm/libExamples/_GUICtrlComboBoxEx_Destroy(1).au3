#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hCombo

	; Erstellt ein GUI
	$hGUI = GUICreate("ComboBoxEx: Control zerst&ouml;ren", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlComboBoxEx_AddString($hCombo, "Noch mehr Text")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Eingef&uuml;gter Text", 1)

	; Zerst&ouml;rt das Control
	MsgBox(266256, "Information", "Zerst&ouml;rt das Control")
	_GUICtrlComboBoxEx_Destroy($hCombo)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
