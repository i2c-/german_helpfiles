#include <GuiConstantsEx.au3>
#include <EventLog.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hEventLog, $aEvent

	; Erstellt eine GUI
	GUICreate("EventLog", 500, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 496, 300, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Liest den aktuellsten Ereignis-Datensatz
	$hEventLog = _EventLog__Open("", "Application") ; Anwendungs-Log
	$aEvent = _EventLog__Read($hEventLog, True, False) ; liest das letzt Event
;~ 	$hEventLog = _EventLog__Open("", "System"); System-Log
;~	$aEvent = _EventLog__Read($hEventLog)
;~	$aEvent = _EventLog__Read($hEventLog, True, False) ; N&auml;chsten Eintrag lesen
	MemoWrite("Ergebnis .........: " & $aEvent[0])
	MemoWrite("Datensatznummer ..: " & $aEvent[1])
	MemoWrite("&Uuml;bermittelt ......: " & $aEvent[2] & " " & $aEvent[3])
	MemoWrite("Erstellt .........: " & $aEvent[4] & " " & $aEvent[5])
	MemoWrite("Ereignis-ID ......: " & $aEvent[6])
	MemoWrite("Typ ..............: " & $aEvent[8])
	MemoWrite("Kategorie ........: " & $aEvent[9])
	MemoWrite("Quelle ...........: " & $aEvent[10])
	MemoWrite("Computer .........: " & $aEvent[11])
	MemoWrite("Benutzer .........: " & $aEvent[12])
	MemoWrite(@CRLF & "Beschreibung: " & @CRLF & @CRLF & $aEvent[13])
	_EventLog__Close($hEventLog)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
