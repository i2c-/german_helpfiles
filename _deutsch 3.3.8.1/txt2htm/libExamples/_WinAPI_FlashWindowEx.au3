#include <WinAPI.au3>
#include <GUIConstantsEx.au3>

_Main()

Func _Main()
	Local $hwnd, $Flash, $Timeout, $btnFlash, $msg, $flashrate, $timeoutrate, $flashing = False
	$hwnd = GUICreate("_WinAPI_FlashWindowEx", 350, 170, 340, 125)
	GUICtrlCreateLabel("Bitte gib die Blinkrate und die Pause zwischen den Blinkimpulsen ein:", 10, 24, 340, 41)
	GUICtrlCreateLabel("Blinkrate:", 56, 72, 108, 17)
	GUICtrlCreateLabel("Pause (ms)", 56, 104, 114, 17)
	$Flash = GUICtrlCreateInput("20", 130, 68, 161, 21)
	$Timeout = GUICtrlCreateInput("500", 130, 99, 161, 21)
	$btnFlash = GUICtrlCreateButton("Blinken!", 113, 136, 125, 25, 0)
	GUISetState(@SW_SHOW)
	#endregion

	While 1
		$msg = GUIGetMsg()
		Switch $msg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $btnFlash
				If $flashing Then
					_WinAPI_FlashWindowEx($hwnd, 0)
					$flashing = False
				Else
					$flashrate = GUICtrlRead($Flash)
					$timeoutrate = GUICtrlRead($Timeout)
					_WinAPI_FlashWindowEx($hwnd, 2, $flashrate, $timeoutrate)
					GUICtrlSetData($btnFlash, "Stoppe das Geblinke!")
					$flashing = True
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>_Main
