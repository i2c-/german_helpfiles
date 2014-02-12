#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

; Unter Vista mu&szlig; die Windows API "SetLocalTime" m&ouml;glicherweise von der Systemsicherheit ausgenommen werden

Global $iMemo

Example()

Func Example()
	Local $tCur, $tNew

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Anzeigen der momentan eingestellten lokalen Zeit
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Aktuelle/s Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Setzt eine neue lokale Zeit
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetLocalTime(DllStructGetPtr($tNew)) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetLocalTime()
	MemoWrite("Neue/s Zeit/Datum .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Zur&uuml;cksetzen der lokalen Zeit
	_Date_Time_SetLocalTime(DllStructGetPtr($tCur))

	; Anzeigen der momentan eingestellten lokalen Zeit
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Aktuelle/s Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
