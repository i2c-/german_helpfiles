#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $fNewStyle = False, $hGUI = 0, $iBtnStyle = 0, $aGUIStyle = 0, $iMsg = 0

	$hGUI = GUICreate("GUI Stil", 260, 100)
	$iBtnStyle = GUICtrlCreateButton("Setzt den Stil", 45, 50, 150, 20)

	$aGUIStyle = GUIGetStyle($hGUI) ; Vorsicht: Der Status &auml;ndert sich nach dem Ausf&uuml;hren von GUISetState(@SW_SHOW)

	GUISetState(@SW_SHOW)

	While 1
		$iMsg = GUIGetMsg()
		Switch $iMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $iBtnStyle
				If Not $fNewStyle Then
					GUISetStyle(BitOR($WS_POPUPWINDOW, $WS_THICKFRAME), BitOR($WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
					GUICtrlSetData($iBtnStyle, 'Stil zur&uuml;cksetzen')
					$fNewStyle = True
				Else
					GUISetStyle($aGUIStyle[0], $aGUIStyle[1])
					GUICtrlSetData($iBtnStyle, 'Setzt den Stil')
					$fNewStyle = False
				EndIf
			Case Else
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>Example
