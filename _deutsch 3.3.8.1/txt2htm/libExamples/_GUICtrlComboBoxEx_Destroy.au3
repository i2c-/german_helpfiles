#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hCombo

	; Erstellt ein GUI
	$hGUI = GUICreate("ComboBoxEx: Control zerst&ouml;ren", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlComboBoxEx_AddString($hCombo, "Noch mehr Text")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Eingef&uuml;gter Text", 1)

	; Zerst&ouml;rt das Control
	MsgBox(266256, "Information", "Zerst&ouml;rt das Control")
	_GUICtrlComboBoxEx_Destroy($hCombo)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
