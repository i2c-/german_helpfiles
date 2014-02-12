#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

; Einfaches Beispiel: Ein Internet Explorer Objekt in eine AutoIt GUI einbetten.
;
; Siehe dazu: http://msdn.microsoft.com/workshop/browser/webbrowser/reference/objects/internetexplorer.asp
Func Example()
	Local $oIE, $GUI_Button_Back, $GUI_Button_Forward
	Local $GUI_Button_Home, $GUI_Button_Stop, $msg

	$oIE = ObjCreate("Shell.Explorer.2")

	; Eine simple GUI f&uuml;r die Ausgabe erzeugen.
	GUICreate("Embedded Web control Test", 640, 580, (@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, BitOR($WS_OVERLAPPEDWINDOW, $WS_CLIPSIBLINGS, $WS_CLIPCHILDREN))
	GUICtrlCreateObj($oIE, 10, 40, 600, 360)
	$GUI_Button_Back = GUICtrlCreateButton("Zur&uuml;ck", 10, 420, 100, 30)
	$GUI_Button_Forward = GUICtrlCreateButton("Vor", 120, 420, 100, 30)
	$GUI_Button_Home = GUICtrlCreateButton("Home", 230, 420, 100, 30)
	$GUI_Button_Stop = GUICtrlCreateButton("Stoppen", 330, 420, 100, 30)

	GUISetState() ; GUI anzeigen

	$oIE.navigate("http://www.autoit.de")

	; Darauf warten, dass das Fenster geschlossen wird ...
	While 1
		$msg = GUIGetMsg()

		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $GUI_Button_Home
				$oIE.navigate("http://www.autoit.de")
			Case $msg = $GUI_Button_Back
				$oIE.GoBack
			Case $msg = $GUI_Button_Forward
				$oIE.GoForward
			Case $msg = $GUI_Button_Stop
				$oIE.Stop
		EndSelect

	WEnd

	GUIDelete()
EndFunc   ;==>Example
