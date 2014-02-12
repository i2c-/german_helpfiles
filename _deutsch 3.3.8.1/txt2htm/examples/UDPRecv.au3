; ; Dies ist der UDP Server
; ; Startet diesen hier zuerst

; Start des UDP-Dienstes
;==============================================
UDPStartup()

; Registriert die Cleanup Funktion.
OnAutoItExitRegister("Cleanup")

; "Bind" zu einem Anschluss ("Socket") durchf&uuml;hren
;==============================================
Local $socket = UDPBind("127.0.0.1", 65532)
If @error <> 0 Then Exit

While 1
	Local $data = UDPRecv($socket, 50)
	If $data <> "" Then
		MsgBox(0, "UDP-Daten", $data, 1)
	EndIf
	Sleep(100)
WEnd

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
