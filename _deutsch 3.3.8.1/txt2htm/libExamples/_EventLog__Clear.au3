#include <EventLog.au3>

_Main()

Func _Main()
	Local $hEventLog

	$hEventLog = _EventLog__Open("", "Anwendung")
	_EventLog__Clear($hEventLog, "C:\EventLog.bak")
	_EventLog__Close($hEventLog)
EndFunc   ;==>_Main
