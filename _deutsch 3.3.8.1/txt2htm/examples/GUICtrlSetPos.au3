#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $right, $label, $button, $msg

	GUICreate("Meine GUI mit Positionsverschiebung eines Labels", 450) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$right = 0
	$label = GUICtrlCreateLabel("Mein sich bewegendes Label", 10, 20)

	$button = GUICtrlCreateButton("Anklicken um zu beenden", 50, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus ist auf diesem Button

	GUISetState()

	While 1
		$msg = GUIGetMsg()

		If $msg = $button Or $msg = $GUI_EVENT_CLOSE Then Exit
		If $right = 0 Then
			$right = 1
			GUICtrlSetPos($label, 20, 20)
		Else
			$right = 0
			GUICtrlSetPos($label, 10, 20)
		EndIf
		Sleep(100)
	WEnd
EndFunc   ;==>Example
