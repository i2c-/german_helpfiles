#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tRect, $hMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt die minimale Gr&ouml;&szlig;e um einen kompletten Monat darzustellen", 650, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Gr&ouml;&szlig;e um einen kompletten Monat darzustellen
	$tRect = _GUICtrlMonthCal_GetMinReqRect($hMonthCal)
	MemoWrite("Mindesth&ouml;he  : " & DllStructGetData($tRect, "Bottom"))
	MemoWrite("Mindestbreite: " & DllStructGetData($tRect, "Right"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
