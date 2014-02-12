#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $sDate

	; Die GUI erstellen
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Anzeigen der FAT Datum/Zeit
	$sDate = _Date_Time_DOSDateTimeToStr(0x3621, 0x944a) ; 01/01/2007 18:34:20
	MemoWrite("FAT Datum/Zeit.: " & $sDate)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
