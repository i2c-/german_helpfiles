#include <GUIConstantsEx.au3>
#include <EditConstants.au3>

GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

Local $nEdit = GUICtrlCreateEdit("Zeile 0", 10, 10)
GUICtrlCreateButton("Ok", 20, 200, 50)
GUISetState()

Local $n
For $n = 1 To 5
	GUICtrlSetData($nEdit, @CRLF & "Zeile " & $n)
Next


; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
Do
	Local $msg = GUIGetMsg()
	If $msg > 0 Then
		$n = GUICtrlSendMsg($nEdit, $EM_LINEINDEX, -1, 0)
		Local $nline = GUICtrlSendMsg($nEdit, $EM_LINEFROMCHAR, $n, 0)
		GUICtrlSetState($nEdit, $GUI_FOCUS) ; Fokus setzen

		MsgBox(0, "Aktuelle Zeile", $nline)
	EndIf
Until $msg = $GUI_EVENT_CLOSE
