#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $progressbar1, $progressbar2, $button, $wait, $s, $msg, $m

	GUICreate("Meine GUI Progressbar", 220, 100, 100, 200)
	$progressbar1 = GUICtrlCreateProgress(10, 10, 200, 20)
	GUICtrlSetColor(-1, 32250); Funktioniert nicht mit Windows XP Style
	$progressbar2 = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
	$button = GUICtrlCreateButton("Start", 75, 70, 70, 20)
	GUISetState(@SW_SHOW)

	$wait = 20; Warte 20ms bis zum n&auml;chsten Schritt
	$s = 0; Progressbar-Startposition

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		$msg = GUIGetMsg()
		If $msg = $button Then
			GUICtrlSetData($button, "Stop")
			For $i = $s To 100
				If GUICtrlRead($progressbar1) = 50 Then MsgBox($MB_SYSTEMMODAL, "Info", "Die H&auml;lfte ist fertig ...", 1)
				$m = GUIGetMsg()

				If $m = -3 Then ExitLoop

				If $m = $button Then
					GUICtrlSetData($button, "Weiter")
					$s = $i ; Speichere aktuelle Balkenposition in $s
					ExitLoop
				Else
					$s = 0
					GUICtrlSetData($progressbar1, $i)
					GUICtrlSetData($progressbar2, (100 - $i))
					Sleep($wait)
				EndIf
			Next
			If $i > 100 Then
				;		$s=0
				GUICtrlSetData($button, "Start")
			EndIf
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
