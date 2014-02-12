#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal:", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die Gr&ouml;&szlig;e des Randes in Pixel
	MemoWrite("Gr&ouml;&szlig;e des Randes in Pixel: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	Sleep(3000)
	GUISetState(@SW_LOCK)
	_GUICtrlMonthCal_SetCalendarBorder($hMonthCal, 2)
	MemoWrite("Gr&ouml;&szlig;e des Randes in Pixel: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	GUISetState(@SW_UNLOCK)
	Sleep(3000)
	GUISetState(@SW_LOCK)
	_GUICtrlMonthCal_SetCalendarBorder($hMonthCal, 0, False)
	MemoWrite("Gr&ouml;&szlig;e des Randes in Pixel: " & _GUICtrlMonthCal_GetCalendarBorder($hMonthCal))
	GUISetState(@SW_UNLOCK)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
