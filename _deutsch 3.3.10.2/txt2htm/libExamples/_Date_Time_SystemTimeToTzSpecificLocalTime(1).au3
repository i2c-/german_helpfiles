#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $tLocal, $tSystem

	; Erstellt eine GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Umwandlung der Systemzeit in die Lokalzeit
	$tSystem = _Date_Time_GetSystemTime()
	$tLocal = _Date_Time_SystemTimeToTzSpecificLocalTime(DllStructGetPtr($tSystem))
	MemoWrite("Systemzeit -> Lokalzeit: " & _Date_Time_SystemTimeToDateTimeStr($tLocal))

	$tLocal = _Date_Time_GetLocalTime()
	$tSystem = _Date_Time_TzSpecificLocalTimeToSystemTime(DllStructGetPtr($tLocal))
	MemoWrite("Lokalzeit -> Systemzeit: " & _Date_Time_SystemTimeToDateTimeStr($tSystem))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
