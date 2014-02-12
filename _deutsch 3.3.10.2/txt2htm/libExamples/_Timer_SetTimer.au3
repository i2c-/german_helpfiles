#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <Timers.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>

Global $iMemo, $hStatusBar, $progress, $percent = 0, $direction = 1

_Example_CallBack()

Func _Example_CallBack()
	Local $hGUI, $iTimerProgress, $btn_change, $iWait = 10, $btn_state
	Local $aParts[3] = [75, 330, -1]

	$hGUI = GUICreate("Timer mittels von CallBack-Funktionen", 400, 320)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_state = GUICtrlCreateButton("Startet Progressbar", 75, 265, 150, 25)
	$btn_change = GUICtrlCreateButton("Intervall &auml;ndern", 235, 265, 90, 25)
	GUICtrlSetState($btn_change, $GUI_DISABLE)
	$hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aParts)
	_GUICtrlStatusBar_SetText($hStatusBar, "2 Timer:")
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
	$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
	GUICtrlSetColor($progress, 0xff0000)
	_GUICtrlStatusBar_EmbedControl($hStatusBar, 1, GUICtrlGetHandle($progress))
	GUISetState(@SW_SHOW)

	_Timer_SetTimer($hGUI, 1000, "_UpdateStatusBarClock") ; Erzeugt Timer 1 (Uhr)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_state
				If GUICtrlRead($btn_state) = "Startet Progressbar" Then
					$iTimerProgress = _Timer_SetTimer($hGUI, $iWait, "_UpdateProgressBar") ; Erzeugt Timer 2 (Fortschritt)
					If @error Or $iTimerProgress = 0 Then ContinueLoop
					GUICtrlSetData($btn_state, "Stoppe Progressbar")
					GUICtrlSetState($btn_change, $GUI_ENABLE)
				Else
					GUICtrlSetState($btn_change, $GUI_DISABLE)
					_Timer_KillTimer($hGUI, $iTimerProgress)
					GUICtrlSetData($btn_state, "Startet Progressbar")
				EndIf

			Case $btn_change
				If $iWait = 10 Then
					$iWait = 250
				Else
					$iWait = 10
				EndIf
				MemoWrite("Timer f&uuml;r _UpdateProgressBar auf " & $iWait & " ms gesetzt!")
				$iTimerProgress = _Timer_SetTimer($hGUI, $iWait, "", $iTimerProgress) ; Timer mit verschiedenen Intervallen verwenden
		EndSwitch
	WEnd
	ConsoleWrite("Alle Timer zerst&ouml;rt? " & _Timer_KillAllTimers($hGUI) & @CRLF)
	GUIDelete()
EndFunc   ;==>_Example_CallBack

Func _UpdateStatusBarClock($hWnd, $Msg, $iIDTimer, $dwTime)
	#forceref $hWnd, $Msg, $iIDTimer, $dwTime
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & @TAB & StringFormat("%02d:%02d:%02d", @HOUR, @MIN, @SEC), 2)
EndFunc   ;==>_UpdateStatusBarClock

Func _UpdateProgressBar($hWnd, $Msg, $iIDTimer, $dwTime)
	#forceref $hWnd, $Msg, $iIDTimer, $dwTime
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
