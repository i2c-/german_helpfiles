#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Extrahiert die prim&auml;re Sprach-ID von einer Sprach-ID", 550, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Zeigt: Gebietsschema, L&auml;ndercode, Sprach-ID, prim&auml;re Sprach-ID, Sub-Sprachen-ID
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema .....: " & _GUICtrlComboBoxEx_GetLocale($hCombo) & @CRLF & _
			"L&auml;ndercode .........: " & _GUICtrlComboBoxEx_GetLocaleCountry($hCombo) & @CRLF & _
			"Sprach-ID............: " & _GUICtrlComboBoxEx_GetLocaleLang($hCombo) & @CRLF & _
			"prim&auml;re Sprach-ID..: " & _GUICtrlComboBoxEx_GetLocalePrimLang($hCombo) & @CRLF & _
			"Sub-Sprachen-ID....: " & _GUICtrlComboBoxEx_GetLocaleSubLang($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
