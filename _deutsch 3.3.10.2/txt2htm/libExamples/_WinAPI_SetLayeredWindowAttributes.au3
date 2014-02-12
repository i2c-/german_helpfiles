#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Local $gui = GUICreate("Trans", 300, 400, -1, -1, -1, $WS_EX_LAYERED)
GUICtrlCreateLabel("Dies ist ein Text auf einem transparenten mehrlagigen GUI", 10, 10, 200, 40, -1, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetTip(-1, "Klicke Label um mehrlagiges Fenster zu ziehen")
Local $layButt = GUICtrlCreateButton("Button", 10, 40, 40)
GUISetBkColor(0xABCDEF)
_WinAPI_SetLayeredWindowAttributes($gui, 0x010101)
GUISetState(@SW_SHOW)

Local $guicontrol = GUICreate("ControlGUI", 300, 400, 100, 100)
Local $checkTrans = GUICtrlCreateCheckbox("Transparente Farbe 0xABCDEF (markiert) OdeR 0x010101", 10, 10)
Local $checkBorder = GUICtrlCreateCheckbox("POPUP-Stil", 10, 30)
GUICtrlCreateLabel("Transparenz f&uuml;r mehrlagiges GUI", 10, 50)
Local $slidTrans = GUICtrlCreateSlider(10, 70, 200, 30)
GUICtrlSetLimit($slidTrans, 255, 0)
GUICtrlSetData(-1, 255)
GUISetState(@SW_SHOW)

While 1
	Local $extMsg = GUIGetMsg(1)
	Local $msg = $extMsg[0]
	Switch $extMsg[1]
		Case $guicontrol
			Select
				Case $msg = $GUI_EVENT_CLOSE
					Exit
				Case $msg = $checkTrans Or $msg = $slidTrans

					; &Auml;ndert Attribute der transparenten Farbe und Fenstertransparenz

					If BitAND(GUICtrlRead($checkTrans), $GUI_CHECKED) = $GUI_CHECKED Then
						_WinAPI_SetLayeredWindowAttributes($gui, 0xABCDEF, GUICtrlRead($slidTrans))
					Else
						_WinAPI_SetLayeredWindowAttributes($gui, 0x010101, GUICtrlRead($slidTrans))
					EndIf

				Case $msg = $checkBorder
					If BitAND(GUICtrlRead($checkBorder), $GUI_CHECKED) = $GUI_CHECKED Then
						GUISetStyle($WS_POPUP, -1, $gui)
					Else
						GUISetStyle($GUI_SS_DEFAULT_GUI, -1, $gui)
					EndIf
			EndSelect
		Case $gui
			Select
				Case $msg = $layButt
					Local $transcolor, $alpha
					Local $info = _WinAPI_GetLayeredWindowAttributes($gui, $transcolor, $alpha)
					MsgBox($MB_SYSTEMMODAL, 'Mehrlagiges GUI', "Button auf mehrlagigem Fenster geklickt" & @CRLF & _
							"Informationen &uuml;ber dieses Fenster: " & @CRLF & _
							"Transparente Farbe: " & $transcolor & @CRLF & _
							"Alpha Wert: " & $alpha & @CRLF & _
							"LWA_COLORKEY: " & (BitAND($info, $LWA_COLORKEY) = $LWA_COLORKEY) & @CRLF & _
							"LWA_ALPHA: " & (BitAND($info, $LWA_ALPHA) = $LWA_ALPHA))
				Case $msg = $GUI_EVENT_CLOSE
					Exit MsgBox($MB_SYSTEMMODAL, '', "Schlie&szlig;en des mehrlagigen GUI")
			EndSelect
	EndSwitch
WEnd
