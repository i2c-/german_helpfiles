#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <Timers.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>

Global $iMemo, $hStatusBar, $progress, $percent = 0, $direction = 1
Global $iTimer1, $iTimer2

_Example_Events()

Func _Example_Events()
	Local $hGUI, $btn_change, $iWait = 10, $btn_state
	Local $aParts[3] = [75, 330, -1]

	$hGUI = GUICreate("Timer unter Verwendung von WM_TIMER Events", 400, 320)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_state = GUICtrlCreateButton("Startet Progressbar", 75, 270, 120, 25)
	$btn_change = GUICtrlCreateButton("Intervall &auml;ndern", 205, 270, 120, 25)
	GUICtrlSetState($btn_change, $GUI_DISABLE)
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aParts)
	_GUICtrlStatusBar_SetText($hStatusBar, "2 Timer")
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
	$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
	GUICtrlSetColor($progress, 0xff0000)
	_GUICtrlStatusBar_EmbedControl($hStatusBar, 1, GUICtrlGetHandle($progress))
	GUISetState()

	GUIRegisterMsg($WM_TIMER, "WM_TIMER")

	$iTimer1 = _Timer_SetTimer($hGUI, 1000) ; Timer 1 erstellen

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_state
				If GUICtrlRead($btn_state) = "Startet Progressbar" Then
					$iTimer2 = _Timer_SetTimer($hGUI, $iWait) ; Timer 2 erstellen
					If @error Or $iTimer2 = 0 Then ContinueLoop
					GUICtrlSetData($btn_state, "Stoppe Progressbar")
					GUICtrlSetState($btn_change, $GUI_ENABLE)
				Else
					GUICtrlSetState($btn_change, $GUI_DISABLE)
					_Timer_KillTimer($hGUI, $iTimer2)
					GUICtrlSetData($btn_state, "Startet Progressbar")
				EndIf

			Case $btn_change
				If $iWait = 10 Then
					$iWait = 250
				Else
					$iWait = 10
				EndIf
				MemoWrite("Timer f&uuml;r _UpdateProgressBar gesetzt auf: " & $iWait & " ms")
				$iTimer2 = _Timer_SetTimer($hGUI, $iWait, "", $iTimer2) ; Timer mit verschiedenen Zeitintervallen verwenden
		EndSwitch
	WEnd

	ConsoleWrite("Alle Timer zerst&ouml;rt? " & _Timer_KillAllTimers($hGUI) & @CRLF)
	GUIDelete()
EndFunc   ;==>_Example_Events

; Timer-Ereignisse
Func WM_TIMER($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $ilParam

	Switch _Timer_GetTimerID($iwParam)
		Case $iTimer1
			_UpdateStatusBarClock()
		Case $iTimer2
			_UpdateProgressBar()
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_TIMER

Func _UpdateStatusBarClock()
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
EndFunc   ;==>_UpdateStatusBarClock

Func _UpdateProgressBar()
	$percent += 5 * $direction
	GUICtrlSetData($progress, $percent)
	If $percent = 100 Or $percent = 0 Then $direction *= -1
	If $percent = 100 Then
		GUICtrlSetColor($progress, 0xff0000)
	ElseIf $percent = 0 Then
		GUICtrlSetColor($progress, 0x0000ff)
	EndIf
EndFunc   ;==>_UpdateProgressBar

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
