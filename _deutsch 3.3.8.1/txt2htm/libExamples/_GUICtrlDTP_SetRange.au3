#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die DTP-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo, $aRange[14] = [True, @YEAR, 1, 1, 21, 45, 32, True, @YEAR, 12, 31, 23, 59, 59]

_Main()

Func _Main()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt den Bereich", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt den Datumsbereich
	_GUICtrlDTP_SetRange($hDTP, $aRange)

	; Zeigt den Datumsbereich an
	$aRange = _GUICtrlDTP_GetRange($hDTP)
	MemoWrite("Minimales Datum: " & GetDateStr(0))
	MemoWrite("Maximales Datum: " & GetDateStr(7))
	MemoWrite("Minimale Zeit .: " & GetTimeStr(4))
	MemoWrite("Maximale Zeit .: " & GetTimeStr(11))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt nur das Datum zur&uuml;ck
Func GetDateStr($iOff = 0)
	Return StringFormat("%02d/%02d/%04d", $aRange[$iOff + 2], $aRange[$iOff + 3], $aRange[$iOff + 1])
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zur&uuml;ck
Func GetTimeStr($iOff = 0)
	Return StringFormat("%02d:%02d:%02d", $aRange[$iOff], $aRange[$iOff + 1], $aRange[$iOff + 2])
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
