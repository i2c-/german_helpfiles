#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>

;==============================================
;==============================================
; SERVER!! Startet mich zuerst !!!!!!!!!!!!!!!
;==============================================
;==============================================

; Initialisiert eine Variable um eine Verbindung darzustellen
;==============================================
Global $ConnectedSocket = -1

Global $MainSocket

Example()

Func Example()
	OnAutoItExitRegister("Cleanup")

	Local $g_IP, $RogueSocket, $GOOEY, $edit, $input, $butt, $msg
	Local $ret, $recv

	$g_IP = "127.0.0.1"

	; Startet den TCP Service
	;==============================================
	TCPStartup()

	; Erstellt einen lauschenden "SOCKET"
	;==============================================
	$MainSocket = TCPListen($g_IP, 65432, 100)
	If $MainSocket = -1 Then Exit
	$RogueSocket = -1

	; Erstellt eine GUI f&uuml;r das Chatten
	;==============================================
	$GOOEY = GUICreate("Mein Server", 300, 200)
	$edit = GUICtrlCreateEdit("", 10, 40, 280, 150, $WS_DISABLED)
	$input = GUICtrlCreateInput("", 10, 10, 200, 20)
	$butt = GUICtrlCreateButton("Senden", 210, 10, 80, 20, $BS_DEFPUSHBUTTON)
	GUISetState()


	; GUI Message Schleife
	;==============================================
	While 1
		$msg = GUIGetMsg()

		; GUI beendet
		;--------------------
		If $msg = $GUI_EVENT_CLOSE Then ExitLoop

		; Benutzer hat SENDEN gedr&uuml;ckt
		;--------------------
		If $msg = $butt Then
			If $ConnectedSocket > -1 Then
				$ret = TCPSend($ConnectedSocket, GUICtrlRead($input))
				If @error Or $ret < 0 Then
					; Fehler aufgetreten, beendet den Socket und setzt ConnectedSocket auf -1 zur&uuml;ck
					;----------------------------------------------------------------
					TCPCloseSocket($ConnectedSocket)
					WinSetTitle($GOOEY, "", "Mein Server - Client getrennt")
					$ConnectedSocket = -1
				ElseIf $ret > 0 Then
					; Aktualisiert das Input-Control mit den Daten, die wir gesendet haben
					;----------------------------------------------------------------
					GUICtrlSetData($edit, GUICtrlRead($edit) & GUICtrlRead($input) & @CRLF)
				EndIf
			EndIf
			GUICtrlSetData($input, "")
		EndIf

		If $RogueSocket > 0 Then
			$recv = TCPRecv($RogueSocket, 512)
			If Not @error Then
				TCPCloseSocket($RogueSocket)
				$RogueSocket = -1
			EndIf
		EndIf

		; Falls es keine Verbindung gibt -> Suchen nach einer Verbindung
		;--------------------
		If $ConnectedSocket = -1 Then
			$ConnectedSocket = TCPAccept($MainSocket)
			If $ConnectedSocket < 0 Then
				$ConnectedSocket = -1
			Else
				WinSetTitle($GOOEY, "", "Mein Server - Client verbunden")
			EndIf

			; Wenn verbunden -> versuchen einige Dateien zu lesen.
			;--------------------
		Else
			; F&Uuml;HRE EINE BEDINGUNGSLOSE ANNAHME AUS, FALLS EIN ANDERER CLIENT VERSUCHT, SICH ZU VERBINDEN
			;----------------------------------------------------------------
			$RogueSocket = TCPAccept($MainSocket)
			If $RogueSocket > 0 Then
				TCPSend($RogueSocket, "~~rejected")
			EndIf

			$recv = TCPRecv($ConnectedSocket, 512)

			If $recv <> "" And $recv <> "~~bye" Then
				; Aktualisiert das Input-Control mit den Daten, die wir empfangen haben
				;----------------------------------------------------------------
				GUICtrlSetData($edit, GUICtrlRead($edit) & ">" & $recv & @CRLF)

			ElseIf @error Or $recv = "~~bye" Then
				; Fehler aufgetreten, schliesst den Socket und setzt ConnectedSocket auf -1 zur&uuml;ck
				;----------------------------------------------------------------
				WinSetTitle($GOOEY, "", "Mein Server - Client getrennt")
				TCPCloseSocket($ConnectedSocket)
				$ConnectedSocket = -1
			EndIf
		EndIf
	WEnd

	GUIDelete($GOOEY)
EndFunc   ;==>Example

Func Cleanup()
	; Beim BEENDEN DES SCRIPTS werden die offenen Sockets geschlossen und der TCP Dienst beendet
	;----------------------------------------------------------------------
	If $ConnectedSocket > -1 Then
		TCPSend($ConnectedSocket, "~~bye")
		Sleep(2000)
		TCPRecv($ConnectedSocket, 512)
		TCPCloseSocket($ConnectedSocket)
	EndIf
	TCPCloseSocket($MainSocket)
	TCPShutdown()
EndFunc   ;==>Cleanup
