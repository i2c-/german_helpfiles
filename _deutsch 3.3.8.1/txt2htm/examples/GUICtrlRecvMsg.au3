#include <GUIConstantsEx.au3>
#include <EditConstants.au3>

GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

Local $nEdit = GUICtrlCreateEdit("Zeile 0", 10, 10)
GUICtrlCreateButton("Ok", 20, 200, 50)

GUISetState()

For $n = 1 To 5
	GUICtrlSetData($nEdit, @CRLF & "Zeile " & $n)
Next


; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
Do
	Local $msg = GUIGetMsg()
	If $msg > 0 Then
		$a = GUICtrlRecvMsg($nEdit, $EM_GETSEL)
		GUICtrlSetState($nEdit, $GUI_FOCUS) ; Setzt Fokus zur&uuml;ck auf Edit-Control

		; Zeigt den wParam und den lParam Wert an, der von dem Control zur&uuml;ckgegeben wird
		MsgBox(0, "Aktuelle Auswahl", StringFormat("Start=%d Ende=%d", $a[0], $a[1]))
	EndIf
Until $msg = $GUI_EVENT_CLOSE
