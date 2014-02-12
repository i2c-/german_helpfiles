#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $tTime, $tLocal

	; Erstellt eine GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Zeigt ein(e) lokale(s) Datum/Zeit als UTC
	$tTime = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	$tLocal = _Date_Time_LocalFileTimeToFileTime(DllStructGetPtr($tTime))
	MemoWrite("Lokale/s Datum/Zeit: " & _Date_Time_FileTimeToStr($tLocal))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
