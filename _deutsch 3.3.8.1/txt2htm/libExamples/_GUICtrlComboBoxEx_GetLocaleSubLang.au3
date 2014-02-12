#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Extrahiert die Sub-Sprachen-ID von einer Sprachen-ID", 550, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Zeigt: Gebietsschema, L&auml;ndercode, Sprach-ID, prim&auml;re Sprach-ID, Sub-Sprachen-ID
	MsgBox(4160, "Information", _
			"Gebietsschema .....: " & _GUICtrlComboBoxEx_GetLocale($hCombo) & @LF & _
			"L&auml;ndercode .........: " & _GUICtrlComboBoxEx_GetLocaleCountry($hCombo) & @LF & _
			"Sprach-ID............: " & _GUICtrlComboBoxEx_GetLocaleLang($hCombo) & @LF & _
			"prim&auml;re Sprach-ID..: " & _GUICtrlComboBoxEx_GetLocalePrimLang($hCombo) & @LF & _
			"Sub-Sprachen-ID....: " & _GUICtrlComboBoxEx_GetLocaleSubLang($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
