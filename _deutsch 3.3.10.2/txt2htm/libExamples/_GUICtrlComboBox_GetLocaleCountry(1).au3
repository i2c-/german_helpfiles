#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt das Gebietsschema", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Zeigt Gebietsschema, L&auml;ndercode und diverse Sprachen-Identifizierer an
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema .....: " & _GUICtrlComboBox_GetLocale($hCombo) & @CRLF & _
			"L&auml;ndercode ........: " & _GUICtrlComboBox_GetLocaleCountry($hCombo) & @CRLF & _
			"Sprachen-ID .......: " & _GUICtrlComboBox_GetLocaleLang($hCombo) & @CRLF & _
			"Prim&auml;re Sprachen-ID: " & _GUICtrlComboBox_GetLocalePrimLang($hCombo) & @CRLF & _
			"Sub-Sprachen-ID ...: " & _GUICtrlComboBox_GetLocaleSubLang($hCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
