#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ComboBox/ComboBoxEx-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $aList, $hCombo
	Opt("GUIDataSeparatorChar", ",") ; Gib als zweiten Parameter den Separator (Trennzeichen) an, der verwendet werden soll

	; Erstellt eine GUI
	GUICreate("ComboBox: Liste ermitteln", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt alle vorhandenen Laufwerke zur Liste hinzu
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Inhalt der Liste separieren und ausgeben
	$aList = StringSplit(_GUICtrlComboBox_GetList($hCombo), ",")
	For $x = 1 To $aList[0]
		MemoWrite($aList[$x])
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
