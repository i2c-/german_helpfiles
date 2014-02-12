#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iButton_1 = 0, $iRadio_1 = 0, $iRadio_2 = 0, $iRadio_3 = 0
	Local $iRadio_4 = 0, $iRadio_5 = 0, $iRadio_6 = 0, $iInput_1 = 0, $iInput_2 = 0

	Opt("GUICoordMode", 1)

	GUICreate("Radio-Box-Gruppierung Demo", 400, 280)

	; Erzeugt die Controls
	$iButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	$iRadio_1 = GUICtrlCreateRadio("Radio &0", 50, 120, 70, 20)
	$iRadio_2 = GUICtrlCreateRadio("Radio &1", 50, 150, 60, 20)
	$iRadio_3 = GUICtrlCreateRadio("Radio &2", 50, 180, 60, 20)
	GUIStartGroup()
	$iRadio_4 = GUICtrlCreateRadio("Radio &A", 120, 120, 70, 20)
	$iRadio_5 = GUICtrlCreateRadio("Radio &B", 120, 150, 60, 20)
	$iRadio_6 = GUICtrlCreateRadio("Radio &C", 120, 180, 60, 20)
	GUIStartGroup()
	$iInput_1 = GUICtrlCreateInput("Eingabe 1", 200, 20, 160, 30)
	$iInput_2 = GUICtrlCreateInput("Eingabe 2", 200, 70, 160, 30)

	; Setzt die Standards (Radiobuttons geklickt, Standard-Button, etc)
	GUICtrlSetState($iRadio_1, $GUI_CHECKED)
	GUICtrlSetState($iRadio_6, $GUI_CHECKED)
	GUICtrlSetState($iButton_1, $GUI_FOCUS + $GUI_DEFBUTTON)

	; Initialisieren der im folgenden Beispiel benutzten Variablen
	$radioval1 = 0 ; Wir setzen voraus 0 = erster Radiobutton gew&auml;hlt, 2 = letzter Button
	$radioval2 = 2

	GUISetState(@SW_SHOW)

	Local $iMsg = 0
	; In dieser MessageBox-Schleife nutzen wir Variablen, um &Auml;nderungen der Radiobuttons im Auge zu behalten.
	; Ein anderer Weg w&auml;re der Gebrauch von GUICtrlRead() am Ende, um den Status jedes Controls einzulesen.
	; Beide Methoden sind gleicherma&szlig;en zul&auml;ssig.
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				Exit

			Case $iMsg = $iButton_1
				MsgBox($MB_SYSTEMMODAL, "Button", "Radio " & $radioval1 & @CRLF & "Radio " & Chr($radioval2 + Asc("A")) & @CRLF & GUICtrlRead($iInput_1) & @CRLF & GUICtrlRead($iInput_2))

			Case $iMsg = $iRadio_1 Or $iMsg = $iRadio_2 Or $iMsg = $iRadio_3
				$radioval1 = $iMsg - $iRadio_1

			Case $iMsg = $iRadio_4 Or $iMsg = $iRadio_5 Or $iMsg = $iRadio_6
				$radioval2 = $iMsg - $iRadio_4

		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
