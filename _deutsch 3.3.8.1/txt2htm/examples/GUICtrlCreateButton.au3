#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $Button_1, $Button_2, $msg
	GUICreate("Mein GUI Button") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	Opt("GUICoordMode", 2)
	$Button_1 = GUICtrlCreateButton("Notepad ausf&uuml;hren", 10, 30, 100)
	$Button_2 = GUICtrlCreateButton("Button Test", 0, -1)

	GUISetState() ; Zeigt eine Dialogbox mit 2 Buttons an

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $Button_1
				Run('Notepad.exe') ; &Ouml;ffnet Notepad
			Case $msg = $Button_2
				MsgBox(0, 'Test', 'Button 2 wurde gedr&uuml;ckt') ; Zeigt, dass Button2 gedr&uuml;ckt wurde
		EndSelect
	WEnd
EndFunc   ;==>Example
