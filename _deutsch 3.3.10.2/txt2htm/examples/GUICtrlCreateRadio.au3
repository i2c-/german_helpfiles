#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $radio1, $radio2, $msg
	GUICreate("Meine GUI mit Radiobuttons") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$radio1 = GUICtrlCreateRadio("Radiobutton 1", 10, 10, 120, 20)
	$radio2 = GUICtrlCreateRadio("Radiobutton 2", 10, 40, 120, 20)
	GUICtrlSetState($radio2, $GUI_CHECKED)

	GUISetState(@SW_SHOW) ; Zeigt das GUI-Fenster mit 2 Radiobuttons

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $radio1 And BitAND(GUICtrlRead($radio1), $GUI_CHECKED) = $GUI_CHECKED
				MsgBox($MB_SYSTEMMODAL, 'Info:', 'Es wurde Radiobutton 1 angeklickt und ausgew&auml;hlt')
			Case $msg = $radio2 And BitAND(GUICtrlRead($radio2), $GUI_CHECKED) = $GUI_CHECKED
				MsgBox($MB_SYSTEMMODAL, 'Info:', 'Es wurde Radiobutton 2 angeklickt und ausgew&auml;hlt')
		EndSelect
	WEnd
EndFunc   ;==>Example
