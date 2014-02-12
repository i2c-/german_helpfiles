#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $tToday, $hMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: setzt die Datumsinformationen f&uuml;r den 'heutigen' Tag", 600, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt/Setzt die Datumsinformationen f&uuml;r den 'heutigen' Tag
	_GUICtrlMonthCal_SetToday($hMonthCal, @YEAR, 8, 19)
	$tToday = _GUICtrlMonthCal_GetToday($hMonthCal)
	MemoWrite("Heute: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tToday, "Month"), _
			DllStructGetData($tToday, "Day"), _
			DllStructGetData($tToday, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
