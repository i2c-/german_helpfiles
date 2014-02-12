#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $fNewStyle = False, $iButton = 0, $iMsg = 0

	GUICreate("Gui Stil", 260, 100)
	$iButton = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)
	GUISetState(@SW_SHOW)

	While 1
		$iMsg = GUIGetMsg()
		Switch $iMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $iButton
				If Not $fNewStyle Then
					GUISetStyle(BitOR($WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($iButton, 'Stil zur&uuml;cksetzen')
					$fNewStyle = True
				Else
					GUISetStyle(BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU), 0)
					GUICtrlSetData($iButton, 'Setzt den Stil')
					$fNewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd

	GUIDelete()
EndFunc   ;==>Example
