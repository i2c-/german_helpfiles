#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tRange, $hMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: ermittelt die obere und untere Begrenzung des momentan ausgew&auml;hlten Datumbereichs", 750, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die obere und untere Begrenzung des momentan ausgew&auml;hlten Datumbereichs
	_GUICtrlMonthCal_SetSelRange($hMonthCal, @YEAR, @MON, 1, @YEAR, @MON, 7)
	$tRange = _GUICtrlMonthCal_GetSelRange($hMonthCal)
	MemoWrite("Startdatum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MinMonth"), _
			DllStructGetData($tRange, "MinDay"), _
			DllStructGetData($tRange, "MinYear")))
	MemoWrite("Enddatum .: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MaxMonth"), _
			DllStructGetData($tRange, "MaxDay"), _
			DllStructGetData($tRange, "MaxYear")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
