#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $aItem, $hCombo

	; Erstellt eine GUI
	$hGUI = GUICreate("ComboBoxEx: Ermittelt alle Items", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 100)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Ermittelt alle Items
	$aItem = _GUICtrlComboBoxEx_GetListArray($hCombo)

	For $x = 1 To $aItem[0]
		MemoWrite($aItem[$x])
	Next

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
