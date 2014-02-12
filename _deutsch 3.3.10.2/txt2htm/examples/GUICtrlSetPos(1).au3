#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $iLabel, $msg, $bToggle = False

	GUICreate("Meine GUI mit Positionsverschiebung eines Labels", 450) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetFont(16)
	$iLabel = GUICtrlCreateLabel("Mein sich bewegendes Label", 10, 20)

	GUISetState(@SW_SHOW)

	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then Exit
		$bToggle = Not $bToggle
		If $bToggle Then
			GUICtrlSetPos($iLabel, 20, 20)
		Else
			GUICtrlSetPos($iLabel, 20, 30)
		EndIf
		Sleep(60)
	WEnd
EndFunc   ;==>Example
