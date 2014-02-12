#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hGUI, $hInput, $hUpDown

Example1()


;Da das Up-/Down-Control wohl nur mit einem 16-Bit-signed-Int-Wert arbeitet, kann man &uuml;ber die Up-/Down-Controls keinen Wert gr&ouml;&szlig;er als 32767 einstellen.
;Wird dazu noch GUICtrlSetLimit verwendet wird's v&ouml;llig konfus, dann kommt es auf den eingestellten MAX-Wert an, was man einstellen kann, aber gr&ouml;&szlig;er als 32767 geht's auch damit nicht.
;Um dies zu umgehen muss man Example2 verwenden.
Example2()

Func Example1()
	Local $input, $msg

	GUICreate("Meine GUI mit UpDown", -1, -1, -1, -1, $WS_SIZEBOX)

	$input = GUICtrlCreateInput("2", 10, 10, 50, 20)
	GUICtrlCreateUpdown($input)

	; Versuch das Eingabe-Control in der Gr&ouml;&szlig;e zu ver&auml;ndern
	GUICtrlSetPos($input, 10, 10, 100, 40)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		Switch $msg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Updown", GUICtrlRead($input))
EndFunc   ;==>Example1




Func Example2()
	$hGUI = GUICreate('Test', 220, 100, -1, -1)

	$hInput = GUICtrlCreateInput('32767', 5, 50, 210, 22)
	$hUpDown = GUICtrlCreateUpdown($hInput)

	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_NOTIFY, 'MY_WM_NOTIFY')

	Do
	Until GUIGetMsg() = -3
EndFunc   ;==>Example2


Func MY_WM_NOTIFY($hWnd, $msg, $wParam)
	If Not BitAND($wParam, 0x0000FFFF) = $hUpDown Then Return 0
	Local $aContrPos = ControlGetPos($hGUI, '', $hUpDown)
	If Not IsArray($aContrPos) Then Return 1
	Local $aMousePos = GUIGetCursorInfo($hGUI)
	If Not IsArray($aMousePos) Then Return 1
	If $aMousePos[1] > $aContrPos[1] + $aContrPos[3] / 2 Then
		Return GUICtrlSetData($hInput, GUICtrlRead($hInput) - 1)
	Else
		Return GUICtrlSetData($hInput, GUICtrlRead($hInput) + 1)
	EndIf
EndFunc   ;==>MY_WM_NOTIFY
