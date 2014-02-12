#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $tFile, $tLocal

	; Erstellen der GUI
	GUICreate("Zeit", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Ermittelt die System Zeit
	Local $tSystem = _Date_Time_GetSystemTime()
	$tFile = _Date_Time_SystemTimeToFileTime(DllStructGetPtr($tSystem))
	;	--------------------------------------
	$tLocal = _Date_Time_FileTimeToLocalFileTime(DllStructGetPtr($tFile))
	MemoWrite("Momentane Dateizeit .: " & _Date_Time_FileTimeToStr($tLocal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
