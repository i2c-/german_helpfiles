#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $pFileTime1, $tFileTime1, $pFileTime2, $tFileTime2

	; Erzeugt die GUI-Oberfl&auml;che
	GUICreate("Zeitvergleich", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Vergleiche die FAT Daten/Zeiten der Dateien
	$tFileTime1 = _Date_Time_DOSDateTimeToFileTime(0x3621, 0x11EF) ; 01/01/2007 02:15:30
	$tFileTime2 = _Date_Time_DOSDateTimeToFileTime(0x379F, 0x944A) ; 12/31/2007 18:34:20
	$pFileTime1 = DllStructGetPtr($tFileTime1)
	$pFileTime2 = DllStructGetPtr($tFileTime2)

	; Schreibt 3 Vergleiche in iMemo-Control
	MemoWrite("Vergleich 1 (1. Datei j&uuml;nger):" & _Date_Time_CompareFileTime($pFileTime1, $pFileTime2))
	MemoWrite("Vergleich 2 (gleiches Datum) :" & _Date_Time_CompareFileTime($pFileTime1, $pFileTime1))
	MemoWrite("Vergleich 3 (2. Datei j&uuml;nger):" & _Date_Time_CompareFileTime($pFileTime2, $pFileTime1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Funktion die eine Zeile in das iMemo-Control der GUI-Oberfl&auml;che schreibt
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
