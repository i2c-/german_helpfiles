#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $button_1, $radio_1, $radio_2, $radio_3
	Local $radio_4, $radio_5, $radio_6, $input_1, $input_2
	Local $radioval1, $radioval2, $msg

	Opt("GUICoordMode", 1)

	GUICreate("Radio-Box-Gruppierung Demo", 400, 280)

	; Erzeugt die Controls
	$button_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	$radio_1 = GUICtrlCreateRadio("Radio &0", 50, 120, 70, 20)
	$radio_2 = GUICtrlCreateRadio("Radio &1", 50, 150, 60, 20)
	$radio_3 = GUICtrlCreateRadio("Radio &2", 50, 180, 60, 20)
	GUIStartGroup()
	$radio_4 = GUICtrlCreateRadio("Radio &A", 120, 120, 70, 20)
	$radio_5 = GUICtrlCreateRadio("Radio &B", 120, 150, 60, 20)
	$radio_6 = GUICtrlCreateRadio("Radio &C", 120, 180, 60, 20)
	GUIStartGroup()
	$input_1 = GUICtrlCreateInput("Eingabe 1", 200, 20, 160, 30)
	$input_2 = GUICtrlCreateInput("Eingabe 2", 200, 70, 160, 30)

	; Setzt die Standards (Radiobuttons geklickt, Standard-Button, etc)
	GUICtrlSetState($radio_1, $GUI_CHECKED)
	GUICtrlSetState($radio_6, $GUI_CHECKED)
	GUICtrlSetState($button_1, $GUI_FOCUS + $GUI_DEFBUTTON)

	; Initialisieren der im folgenden Beispiel benutzten Variablen
	$radioval1 = 0 ; Wir setzen voraus 0 = erster Radiobutton gew&auml;hlt, 2 = letzter Button
	$radioval2 = 2

	GUISetState()

	; In dieser MessageBox-Schleife nutzen wir Variablen, um &Auml;nderungen der Radiobuttons im Auge zu behalten.
	; Ein anderer Weg w&auml;re der Gebrauch von GUICtrlRead() am Ende, um den Status jedes Controls einzulesen.
	; Beide Methoden sind gleicherma&szlig;en zul&auml;ssig.
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				Exit

			Case $msg = $button_1
				MsgBox(0, "Button", "Radio " & $radioval1 & @LF & "Radio " & Chr($radioval2 + Asc("A")) & @LF & GUICtrlRead($input_1) & @LF & GUICtrlRead($input_2))

			Case $msg = $radio_1 Or $msg = $radio_2 Or $msg = $radio_3
				$radioval1 = $msg - $radio_1

			Case $msg = $radio_4 Or $msg = $radio_5 Or $msg = $radio_6
				$radioval2 = $msg - $radio_4

		EndSelect
	WEnd
EndFunc   ;==>Example
