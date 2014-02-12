#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $tTime, $aTime

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt die momentane Systemzeit
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	MemoWrite("Monat ........: " & $aTime[0])
	MemoWrite("Tag ..........: " & $aTime[1])
	MemoWrite("Jahr .........: " & $aTime[2])
	MemoWrite("Stunde .........: " & $aTime[3])
	MemoWrite("Minute .......: " & $aTime[4])
	MemoWrite("Sekunde .......: " & $aTime[5])
	MemoWrite("Millisekunde .: " & $aTime[6])
	MemoWrite("Wochentag ..: " & $aTime[7])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
