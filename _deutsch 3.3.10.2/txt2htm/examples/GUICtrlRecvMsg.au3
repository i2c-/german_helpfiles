#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit einem Edit-Control.
	Local $hGUI = GUICreate("Beispiel")
	Local $iEdit = GUICtrlCreateEdit("Zeile 0" & @CRLF, 0, 0, 400, 350)
	Local $iOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Setzt Daten des Edit-Controls.
	For $i = 1 To 25
		GUICtrlSetData($iEdit, "Zeile " & $i & @CRLF, 1)
	Next

	; Setzt den Fokus auf das Edit-Control.
	GUICtrlSetState($iEdit, $GUI_FOCUS)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGUI)

	; Initialisiert die Variable $aCtrlRecvMsg f&uuml;r das speichern des Wertes der von GUICtrlRecvMsg zur&uuml;ckgegeben wurde.
	Local $aCtrlRecvMsg = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $iOK
				; Sendet die Nachricht EM_GETSEL um die aktuelle Markierung des Edit-Control zu empfangen.
				$aCtrlRecvMsg = GUICtrlRecvMsg($iEdit, $EM_GETSEL)

				; Setzt den Fokus auf das Edit-Control.
				GUICtrlSetState($iEdit, $GUI_FOCUS)

				; Falls GUICtrlRecvMsg 0 zur&uuml;ckgibt, so kommt ein Fehler. Sonst wird der Inhalt des Arrays angezeigt.
				If $aCtrlRecvMsg = 0 Then
					MsgBox($MB_SYSTEMMODAL, "", "Ein Fehler ist aufgetreten Der zur&uuml;ckgegebene Wert lautet - " & $aCtrlRecvMsg)
				Else
					MsgBox($MB_SYSTEMMODAL, "", "Start: " & $aCtrlRecvMsg[0] & " Ende: " & $aCtrlRecvMsg[1])
				EndIf

		EndSwitch
	WEnd

	; L&ouml;scht die vorherige GUI und alle Controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
