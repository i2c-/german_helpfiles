#include <GuiConstantsEx.au3>
#include <EventLog.au3>

Global $iMemo

Example()

Func Example()
	Local $hEventLog

	; Erstellt das GUI
	GUICreate("EventLog", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 300, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	$hEventLog = _EventLog__Open("", "Application")
	MemoWrite("EventLog voll? ..........: " & _EventLog__Full($hEventLog))
	MemoWrite("Anzahl der Log-Eintr&auml;ge .: " & _EventLog__Count($hEventLog))
	MemoWrite("&Auml;ltester Log-Eintrag: ...: " & _EventLog__Oldest($hEventLog))
	_EventLog__Close($hEventLog)

	; Die Schleife wiederholt sich, bis der Benutzer das Fenster schlie&szlig;t
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
