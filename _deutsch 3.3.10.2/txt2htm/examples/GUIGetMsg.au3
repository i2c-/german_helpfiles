#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

;Dr&uuml;cke den Button, um die Werte der Checkboxen anzuzeigen
; Das Skript ermittelt auch Status&auml;nderungen (geschlossen/minimiert/Timeouts, etc).
Func Example()
	Local $iButton_1 = 0, $iRadio_1 = 0, $iRadio_3 = 0

	Opt("GUICoordMode", 1)
	GUICreate("Radio Box Demo", 400, 280)

	; Erzeugt die Controls
	$iButton_1 = GUICtrlCreateButton("B&utton 1", 30, 20, 120, 40)
	GUICtrlCreateGroup("Gruppe 1", 30, 90, 165, 160)
	GUIStartGroup()
	$iRadio_1 = GUICtrlCreateRadio("Radiobutton &0", 50, 120, 80, 20)
	GUICtrlCreateRadio("Radiobutton &1", 50, 150, 80, 20)
	$iRadio_3 = GUICtrlCreateRadio("Radiobutton &2", 50, 180, 80, 20)

	; Initialisierung der Variablen um GUI-Ereignisse im Auge zu behalten
	Local $iRadioVal1 = 0 ; Annahme: erster Radiobutton ausgew&auml;hlt = 0, letzter Button = 2

	; GUI anzeigen
	GUISetState(@SW_SHOW)

	; In dieser Nachrichtenschleife werden Variablen benutzt, um die Radiobuttons im Auge zu behalten, ein anderer
	; Weg w&auml;re der Gebrauch von GUICtrlRead() am Ende um den Status jedes Controls einzulesen
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde beendet")
				Exit
			Case $iMsg = $GUI_EVENT_MINIMIZE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde minimiert", 2)
			Case $iMsg = $GUI_EVENT_MAXIMIZE
				MsgBox($MB_SYSTEMMODAL, "", "Dialog wurde wiederhergestellt", 2)

			Case $iMsg = $iButton_1
				MsgBox($MB_SYSTEMMODAL, "Standard-Button gedr&uuml;ckt", "Radiobutton " & $radioval1)

			Case $iMsg >= $iRadio_1 And $iMsg <= $iRadio_3
				$radioval1 = $iMsg - $radio_1

		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example
