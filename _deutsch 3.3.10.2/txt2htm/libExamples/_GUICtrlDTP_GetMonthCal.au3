#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $iMemo

Example()

Func Example()
	Local $hGui, $hDTP

	; Erstellt eine GUI
	$hGui = GUICreate("DateTimePick: Ermittelt das Child Handle des Monatskalenders", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Ermittelt das Child Handle des Monatskalenders
	GUICtrlSetData($iMemo, "Child Handle des Monatskalenders: " & "0x" & Hex(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($iMemo, " IsPtr=" & IsPtr(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($iMemo, " IsHwnd=" & IsHWnd(_GUICtrlDTP_GetMonthCal($hDTP)) & @CRLF, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
