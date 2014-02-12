#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $MESSAGE = "Folgende Buttons wurden gedr&uuml;ckt:"
	Local $add, $clear, $mylist, $close, $msg

	GUICreate("Meine GUI List") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$add = GUICtrlCreateButton("Hinzuf&uuml;gen", 64, 32, 75, 25)
	$clear = GUICtrlCreateButton("Leeren", 64, 72, 75, 25)
	$mylist = GUICtrlCreateList("Buttons, die gedr&uuml;ckt wurden", 176, 32, 221, 97)
	GUICtrlSetLimit(-1, 200) ; Horizontales Scrollen begrenzen
	GUICtrlSetData(-1, $MESSAGE)
	$close = GUICtrlCreateButton("Mein Beenden-Button", 64, 160, 175, 25)

	GUISetState()

	$msg = 0
	While $msg <> $GUI_EVENT_CLOSE
		$msg = GUIGetMsg()

		Select
			Case $msg = $add
				GUICtrlSetData($mylist, "Du hast Button Nr. 1 gedr&uuml;ckt|")
			Case $msg = $clear
				GUICtrlSetData($mylist, "")
			Case $msg = $close
				MsgBox(0, "", "Der Beenden-Button wurde gedr&uuml;ckt", 2)
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Example
