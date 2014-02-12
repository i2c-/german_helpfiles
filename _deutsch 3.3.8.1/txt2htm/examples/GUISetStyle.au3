#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $NewStyle = False, $Style, $Msg

	GUICreate("Gui Stil", 260, 100)
	$Style = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)
	GUISetState()

	While 1
		$Msg = GUIGetMsg()
		Switch $Msg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Style
				If Not $NewStyle Then
					GUISetStyle(BitOR($WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($Style, 'Stil zur&uuml;cksetzen')
					$NewStyle = True
				Else
					GUISetStyle(BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU), 0)
					GUICtrlSetData($Style, 'Setzt den Stil')
					$NewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd
EndFunc   ;==>Example
