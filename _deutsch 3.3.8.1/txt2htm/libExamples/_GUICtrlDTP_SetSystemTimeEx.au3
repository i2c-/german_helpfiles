#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo, $tDate

_Main()

Func _Main()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt die Systemzeit mit Set System TimeEx", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Systemzeit
	$tDate = DllStructCreate($tagSYSTEMTIME)
	DllStructSetData($tDate, "Year", @YEAR)
	DllStructSetData($tDate, "Month", 8)
	DllStructSetData($tDate, "Day", 19)
	DllStructSetData($tDate, "Hour", 21)
	DllStructSetData($tDate, "Minute", 57)
	DllStructSetData($tDate, "Second", 34)
	_GUICtrlDTP_SetSystemTimeEx($hDTP, $tDate)

	; Zeigt die Systemzeit an
	$tDate = _GUICtrlDTP_GetSystemTimeEx($hDTP)
	MemoWrite("Aktuelles Datum: " & GetDateStr())
	MemoWrite("Aktuelle Zeit .: " & GetTimeStr())

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt nur das Datum zur&uuml;ck
Func GetDateStr()
	Return StringFormat("%02d/%02d/%04d", DllStructGetData($tDate, "Month"), DllStructGetData($tDate, "Day"), DllStructGetData($tDate, "Year"))
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zur&uuml;ck
Func GetTimeStr()
	Return StringFormat("%02d:%02d:%02d", DllStructGetData($tDate, "Hour"), DllStructGetData($tDate, "Minute"), DllStructGetData($tDate, "Second"))
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
