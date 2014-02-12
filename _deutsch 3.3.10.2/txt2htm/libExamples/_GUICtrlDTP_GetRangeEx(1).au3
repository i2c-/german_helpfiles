#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $iMemo, $tRange

Example()

Func Example()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Ermittelt den Bereich mit RangeEx", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt den Datumsbereich
	$tRange = DllStructCreate($tagDTPRANGE)
	DllStructSetData($tRange, "MinValid", True)
	DllStructSetData($tRange, "MinYear", @YEAR)
	DllStructSetData($tRange, "MinMonth", 1)
	DllStructSetData($tRange, "MinDay", 1)
	DllStructSetData($tRange, "MinHour", 0)
	DllStructSetData($tRange, "MinMinute", 0)
	DllStructSetData($tRange, "MinSecond", 1)
	DllStructSetData($tRange, "MaxValid", True)
	DllStructSetData($tRange, "MaxYear", @YEAR)
	DllStructSetData($tRange, "MaxMonth", 12)
	DllStructSetData($tRange, "MaxDay", 31)
	DllStructSetData($tRange, "MaxHour", 12)
	DllStructSetData($tRange, "MaxMinute", 59)
	DllStructSetData($tRange, "MaxSecond", 59)
	_GUICtrlDTP_SetRangeEx($hDTP, $tRange)

	; Zeigt den Datumsbereich an
	$tRange = _GUICtrlDTP_GetRangeEx($hDTP)
	MemoWrite("Minimales Datum: " & GetDateStr("Min"))
	MemoWrite("Maximales Datum: " & GetDateStr("Max"))
	MemoWrite("Minimale Zeit .: " & GetTimeStr("Min"))
	MemoWrite("Maximale Zeit .: " & GetTimeStr("Max"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt nur das Datum zur&uuml;ck
Func GetDateStr($sPrefix)
	If $sPrefix = "Min" Then
		Return StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MinMonth"), DllStructGetData($tRange, "MinDay"), DllStructGetData($tRange, "MinYear"))
	Else
		Return StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MaxMonth"), DllStructGetData($tRange, "MaxDay"), DllStructGetData($tRange, "MaxYear"))
	EndIf
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zur&uuml;ck
Func GetTimeStr($sPrefix)
	If $sPrefix = "Min" Then
		Return StringFormat("%02d:%02d:%02d", DllStructGetData($tRange, "MinHour"), DllStructGetData($tRange, "MinMinute"), DllStructGetData($tRange, "MinSecond"))
	Else
		Return StringFormat("%02d:%02d:%02d", DllStructGetData($tRange, "MaxHour"), DllStructGetData($tRange, "MaxMinute"), DllStructGetData($tRange, "MaxSecond"))
	EndIf
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
