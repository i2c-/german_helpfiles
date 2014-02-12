#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo, $tRange, $aDate

_Main()

Func _Main()
	Local $hDTP, $a_Date[7] = [False, @YEAR, 8, 19, 21, 57, 34]

	; Erstellt eine GUI
	GUICreate("DateTimePick: Ermittelt die Systemzeit", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Systemzeit
	_GUICtrlDTP_SetSystemTime($hDTP, $a_Date)

	; Zeigt die Systemzeit an
	$aDate = _GUICtrlDTP_GetSystemTime($hDTP)
	MemoWrite("Aktuelles Datum: " & GetDateStr())
	MemoWrite("Aktuelle Zeit .: " & GetTimeStr())

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt nur das Datum zur&uuml;ck
Func GetDateStr()
	Return StringFormat("%02d/%02d/%04d", $aDate[1], $aDate[2], $aDate[0])
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zur&uuml;ck
Func GetTimeStr()
	Return StringFormat("%02d:%02d:%02d", $aDate[3], $aDate[4], $aDate[5])
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
