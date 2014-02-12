#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $tMin, $tMax, $hMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: den oben begrenzten Datumsbereich ermitteln", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt/Setzt den unten begrenzten Datumsbereich
	_GUICtrlMonthCal_SetRange($hMonthCal, @YEAR, 1, 1, @YEAR, 12, 31)
	$tMin = _GUICtrlMonthCal_GetRangeMin($hMonthCal)
	$tMax = _GUICtrlMonthCal_GetRangeMax($hMonthCal)
	MemoWrite("Minimales ausw&auml;hlbares Datum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMin, "Month"), _
			DllStructGetData($tMin, "Day"), _
			DllStructGetData($tMin, "Year")))
	MemoWrite("Maximales ausw&auml;hlbares Datum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMax, "Month"), _
			DllStructGetData($tMax, "Day"), _
			DllStructGetData($tMax, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
