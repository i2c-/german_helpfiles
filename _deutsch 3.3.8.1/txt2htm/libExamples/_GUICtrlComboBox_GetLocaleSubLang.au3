#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Sub-Sprach-ID", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Zeigt die Gebietsschema-Einstellung, den L&auml;ndercode und die Sprach-Identifizierer an
	MsgBox(4160, "Information", _
			"Gebietsschema ...: " & _GUICtrlComboBox_GetLocale($hCombo) & @LF & _
			"L&auml;ndercode ......: " & _GUICtrlComboBox_GetLocaleCountry($hCombo) & @LF & _
			"Sprach-ID........: " & _GUICtrlComboBox_GetLocaleLang($hCombo) & @LF & _
			"Prim&auml;re Sprach-ID: " & _GUICtrlComboBox_GetLocalePrimLang($hCombo) & @LF & _
			"Sub-Sprach-ID ...: " & _GUICtrlComboBox_GetLocaleSubLang($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
