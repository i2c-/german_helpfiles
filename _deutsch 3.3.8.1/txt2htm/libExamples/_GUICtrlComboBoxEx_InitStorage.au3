#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Weist den ListBox-Items Speicher zu", 450, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 446, 296, $CBS_SIMPLE)
	GUISetState()

	MsgBox(8256, "Information", "Es wurde Speicher f&uuml;r: " & _GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300) & " Items bereitgestellt!")
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
