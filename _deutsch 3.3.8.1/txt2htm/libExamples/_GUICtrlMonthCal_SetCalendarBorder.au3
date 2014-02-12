#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal:", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

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
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
