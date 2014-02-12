#include <GUIConstantsEx.au3>

Example()

;-------------------------------------------------------------------------------------
; Beispiel - Dr&uuml;cke den Button, um die Werte der Checkboxen anzuzeigen
; Das Skript ermittelt auch Status&auml;nderungen (geschlossen/minimiert/Timeouts, etc).
Func Example()
	Local $button_1, $radio_1, $radio_3
	Local $radioval1, $msg

	Opt("GUICoordMode", 1)
	GUICreate("Radio Box Demo", 400, 280)

	; Erzeugt die Controls
	$button_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	$radio_1 = GUICtrlCreateRadio("Radiobutton &0", 50, 120, 80, 20)
	GUICtrlCreateRadio("Radiobutton &1", 50, 150, 80, 20)
	$radio_3 = GUICtrlCreateRadio("Radiobutton &2", 50, 180, 80, 20)

	; Initialisierung der Variablen um GUI-Ereignisse im Auge zu behalten
	$radioval1 = 0 ; Annahme: erster Radiobutton ausgew&auml;hlt = 0, letzter Button = 2

	; GUI anzeigen
	GUISetState()

	; In dieser Nachrichtenschleife werden Variablen benutzt, um die Radiobuttons im Auge zu behalten, ein anderer
	; Weg w&auml;re der Gebrauch von GUICtrlRead() am Ende um den Status jedes Controls einzulesen
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				MsgBox(0, "", "Dialog wurde beendet")
				Exit
			Case $msg = $GUI_EVENT_MINIMIZE
				MsgBox(0, "", "Dialog wurde minimiert", 2)
			Case $msg = $GUI_EVENT_MAXIMIZE
				MsgBox(0, "", "Dialog wurde wiederhergestellt", 2)

			Case $msg = $button_1
				MsgBox(0, "Standard-Button gedr&uuml;ckt", "Radiobutton " & $radioval1)

			Case $msg >= $radio_1 And $msg <= $radio_3
				$radioval1 = $msg - $radio_1

		EndSelect
	WEnd
EndFunc   ;==>Example
