#include <GUIConstantsEx.au3>

Example()

Func Example()

	Local $slider1, $button, $msg

	GUICreate("Slider", 220, 100, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe
	$slider1 = GUICtrlCreateSlider(10, 10, 200, 20)
	GUICtrlSetLimit(-1, 200, 0) ; &Auml;ndert den Min/Max Wert
	$button = GUICtrlCreateButton("Wert?", 75, 70, 70, 20)
	GUISetState()
	GUICtrlSetData($slider1, 45) ; Setzt den Cursor

	Do
		$msg = GUIGetMsg()

		If $msg = $button Then
			MsgBox(0, "slider1", GUICtrlRead($slider1), 2)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
