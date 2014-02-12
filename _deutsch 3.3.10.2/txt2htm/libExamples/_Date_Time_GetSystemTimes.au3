#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $aTime

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die System-Zeiten
	$aTime = _Date_Time_GetSystemTimes()

	MemoWrite("Zeit des Leerlaufs ...: " & _Date_Time_FileTimeToStr($aTime[0]))
	MemoWrite("System Zeit .: " & _Date_Time_FileTimeToStr($aTime[1]))
	MemoWrite("Benutzer Zeit ...: " & _Date_Time_FileTimeToStr($aTime[2]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
