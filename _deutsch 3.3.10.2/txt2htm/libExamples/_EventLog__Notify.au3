#include <GuiConstantsEx.au3>
#include <EventLog.au3>
#include <WinAPI.au3>

Global $iMemo

Example()

Func Example()
	Local $hEventLog, $hEvent, $iResult

	; Erstellt eine GUI
	GUICreate("EventLog", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 300, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ereignis einrichten
	$hEventLog = _EventLog__Open("", "Security")
	$hEvent = _WinAPI_CreateEvent(0, False, False, "")
	_EventLog__Notify($hEventLog, $hEvent)

	; Wartet, bis ein neues Ereignis auftritt
	MemoWrite("Warte auf neues Ereignis...")
	$iResult = _WinAPI_WaitForSingleObject($hEvent)
	_WinAPI_CloseHandle($hEvent)
	_EventLog__Close($hEventLog)

	; Gibt die Resultate aus
	If $iResult = -1 Then
		MemoWrite("Warten war umsonst!")
	Else
		MemoWrite("Es ist ein neues Ereignis aufgetreten!")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
