; ; Dies ist der UDP Client
; ; Startet zuerst den Server

; Start des UDP-Dienstes
;==============================================
UDPStartup()

; Registriert die Cleanup Funktion.
OnAutoItExitRegister("Cleanup")

; &Ouml;ffnet einen "SOCKET"
;==============================================
Local $socket = UDPOpen("127.0.0.1", 65532)
If @error <> 0 Then Exit

Local $n = 0
While 1
	Sleep(2000)
	$n = $n + 1
	Local $status = UDPSend($socket, "Nachricht Nr." & $n)
	If $status = 0 Then
		MsgBox(0, "FEHLER", "Fehler w&auml;hrend des Sendens der UDP-Nachricht: " & @error)
		Exit
	EndIf
WEnd

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
