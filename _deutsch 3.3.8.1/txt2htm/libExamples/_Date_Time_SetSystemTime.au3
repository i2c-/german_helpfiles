#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

; Unter Vista mu&szlig; die Windows API "SetSystemTime" m&ouml;glicherweise von der Systemsicherheit ausgenommen werden

Global $iMemo

_Main()

Func _Main()
	Local $tCur, $tNew

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Auslesen der aktuellen Systemzeit
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Aktuelle/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Setzt eine neue Systemzeit
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetSystemTime(DllStructGetPtr($tNew)) Then
		MsgBox(4096, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetSystemTime()
	MemoWrite("Neue/s System Zeit/Datum .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Setzt die Systemzeit zur&uuml;ck
	_Date_Time_SetSystemTime(DllStructGetPtr($tCur))

	; Auslesen der aktuellen Systemzeit
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Wiederhergestellte/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
