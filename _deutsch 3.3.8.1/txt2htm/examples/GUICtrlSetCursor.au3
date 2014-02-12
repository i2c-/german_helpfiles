#include <GUIConstantsEx.au3>

Example()

Func Example()

	GUICreate("Setzt den Cursor &uuml;ber das Label", 300, 100)
	GUICtrlCreateLabel("Label", 125, 40)
	GUICtrlSetCursor(-1, 4)
	GUISetState()

	While GUIGetMsg() <> $GUI_EVENT_CLOSE
	WEnd
EndFunc   ;==>Example
