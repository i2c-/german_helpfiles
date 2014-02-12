#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $n, $msg

	GUICreate("Meine GUI (GetControlState)")
	$n = GUICtrlCreateCheckbox("Checkbox", 10, 10)
	GUICtrlSetState(-1, 1) ; Checkbox markieren

	GUISetState() ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	MsgBox(0, "Status", StringFormat("GUICtrlRead=%d\nGUICtrlGetState=%d", GUICtrlRead($n), GUICtrlGetState($n)))
EndFunc   ;==>Example
