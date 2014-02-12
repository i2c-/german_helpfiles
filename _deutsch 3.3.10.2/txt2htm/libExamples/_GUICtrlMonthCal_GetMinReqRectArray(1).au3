#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt die minimale Gr&ouml;&szlig;e um einen kompletten Monat darzustellen", 650, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, BitOR($WS_VSCROLL, $ES_MULTILINE))
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($iMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($iMemo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Gr&ouml;&szlig;e um einen kompletten Monat darzustellen
	MemoWrite(_FormatOutPut(_GUICtrlMonthCal_GetMinReqRectArray($hMonthCal)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _FormatOutPut($aRect)
	Return "Mindestbreite: " & @TAB & $aRect[3] & @CRLF & "Mindesth&ouml;he:" & @TAB & $aRect[4]
EndFunc   ;==>_FormatOutPut

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
