#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $NewStyle = False, $hWnd, $Style, $GuiStyles, $Msg

	$hWnd = GUICreate("GUI Stil", 260, 100)
	$Style = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)

	$GuiStyles = GUIGetStyle($hWnd) ; Vorsicht: Der Status &auml;ndert sich nach dem Ausf&uuml;hren von GUISetState()

	GUISetState()


	While 1
		$Msg = GUIGetMsg()
		Switch $Msg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Style
				If Not $NewStyle Then
					GUISetStyle($WS_POPUPWINDOW + $WS_THICKFRAME, $WS_EX_CLIENTEDGE + $WS_EX_TOOLWINDOW)
					GUICtrlSetData($Style, 'Stil zur&uuml;cksetzen')
					$NewStyle = True
				Else
					GUISetStyle($GuiStyles[0], $GuiStyles[1])
					GUICtrlSetData($Style, 'Setzt den Stil')
					$NewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd
EndFunc   ;==>Example
