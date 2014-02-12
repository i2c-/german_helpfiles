#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $tTime, $hMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Setzt das aktuell markierte Datum", 450, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt/Setzt das aktuell markierte Datum
	_GUICtrlMonthCal_SetCurSel($hMonthCal, @YEAR, 8, 19)
	$tTime = _GUICtrlMonthCal_GetCurSel($hMonthCal)
	MemoWrite("Aktuell markiertes Datum : " & StringFormat("%02d/%02d/%04d", DllStructGetData($tTime, "Month"), _
			DllStructGetData($tTime, "Day"), _
			DllStructGetData($tTime, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
