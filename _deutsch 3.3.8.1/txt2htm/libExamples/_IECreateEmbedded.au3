; *******************************************************
; Beispiel 1 - Erkennt und deaktiviert COM-Errors, sodass 'Back' (zur&uuml;ck) und
;               'Forward' (vorw&auml;rts) au&szlig;erhalb der Historygrenzen das Skript nicht abbrechen.
;               (au&szlig;er COM-Errors, die an die Konsole gesendet werden)
; *******************************************************

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

_IEErrorHandlerRegister()

Local $oIE = _IECreateEmbedded()
GUICreate("EmbeddedWebControl-Test", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
GUICtrlCreateObj($oIE, 10, 40, 600, 360)
Local $GUI_Button_Back = GUICtrlCreateButton("Zur&uuml;ck", 10, 420, 100, 30)
Local $GUI_Button_Forward = GUICtrlCreateButton("Vorw&auml;rts", 120, 420, 100, 30)
Local $GUI_Button_Home = GUICtrlCreateButton("Startseite", 230, 420, 100, 30)
Local $GUI_Button_Stop = GUICtrlCreateButton("Anhalten", 340, 420, 100, 30)

GUISetState() ; Anzeigen der GUI

_IENavigate($oIE, "http://www.autoit.de")

; Wartet, bis der Benutzer das Fenster schlie&szlig;t
While 1
	Local $msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			ExitLoop
		Case $msg = $GUI_Button_Home
			_IENavigate($oIE, "www.autoit.de")
		Case $msg = $GUI_Button_Back
			_IEAction($oIE, "back")
		Case $msg = $GUI_Button_Forward
			_IEAction($oIE, "forward")
		Case $msg = $GUI_Button_Stop
			_IEAction($oIE, "stop")
	EndSelect
WEnd

GUIDelete()

Exit
