#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tDate

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Auslesen des aktuellen System Datums
	$tDate = _Date_Time_GetSystemTime()
	MemoWrite("Aktuelles System Datum .: " & _Date_Time_SystemTimeToDateStr($tDate))
	MemoWrite("Aktuelles System Datum .: " & _Date_Time_SystemTimeToDateStr($tDate, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
