#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt den oberen begrenzten Datumsbereich", 520, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt den oberen begrenzten Datumsbereich
	_GUICtrlMonthCal_SetRange($hMonthCal, @YEAR, 1, 1, @YEAR, 12, 31)
	MemoWrite("Minimal ausw&auml;hlbares Datum: " & _GUICtrlMonthCal_GetRangeMinStr($hMonthCal))
	MemoWrite("Maximal ausw&auml;hlbares Datum: " & _GUICtrlMonthCal_GetRangeMaxStr($hMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
