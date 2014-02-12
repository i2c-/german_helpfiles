; *** Demo zur Anzeige eines Timers
#include <GUIConstantsEx.au3>
#include <Date.au3>

Opt("TrayIconDebug", 1)

Global $timer, $Secs, $Mins, $Hour, $Time

_Main()

Func _Main()
	; Erstellt die GUI
	GUICreate("Timer", 150, 50)
	GUICtrlCreateLabel("00:00:00", 55, 20)
	GUISetState()
	; Startet Timer
	$timer = TimerInit()
	; Die Funktion Timer wird alle 50 ms aufgerufen
	AdlibRegister("Timer", 50)
	;
	While 1
		; FileWriteLine("debug.log",@min & ":" & @sec & " ==> vorher")
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
		EndSwitch
		; FileWriteLine("debug.log",@min & ":" & @sec & " ==> nachher")
	WEnd
EndFunc   ;==>_Main
;
Func Timer()
	_TicksToTime(Int(TimerDiff($timer)), $Hour, $Mins, $Secs)
	Local $sTime = $Time ; Letzten Timerstand merken, um den Vergleich zu erm&ouml;glichen und Flackern zu vermeiden..
	$Time = StringFormat("%02i:%02i:%02i", $Hour, $Mins, $Secs)
	If $sTime <> $Time Then ControlSetText("Timer", "", "Static1", $Time)
EndFunc   ;==>Timer
