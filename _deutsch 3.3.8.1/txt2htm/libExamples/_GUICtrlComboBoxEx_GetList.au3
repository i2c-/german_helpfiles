#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $aItem, $Delimiter = ";", $hCombo

	Opt("GUIDataSeparatorChar", $Delimiter)

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt alle Items", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Ermittelt alle Items
	$aItem = StringSplit(_GUICtrlComboBoxEx_GetList($hCombo), $Delimiter)

	For $x = 1 To $aItem[0]
		MemoWrite($aItem[$x])
	Next

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
