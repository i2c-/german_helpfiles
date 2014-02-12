#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die MonthCal-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Setzt den Datumsstatus", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_DAYSTATE), 0x00000000)

	; Ermittelt die Nummer der in dem Kalender angezeigten Monate.  Normal ist die Zahl 3.
	Local $aMasks[_GUICtrlMonthCal_GetMonthRangeSpan($hMonthCal, True)]

	; Zeigt den ersten, achten und den 16. Tag des Monats im Stil 'fett' an. Dies erzeugt, die bin&auml;re Maske von 1000 0000 1000 0001 oder
	; 0x8081 in Hex.
	$aMasks[1] = 0x8081
	_GUICtrlMonthCal_SetDayState($hMonthCal, $aMasks)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
