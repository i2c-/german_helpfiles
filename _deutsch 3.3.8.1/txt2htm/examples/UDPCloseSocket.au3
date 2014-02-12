; SERVER!! Startet mich zuerst !!!!!!!!!!!!!!!
Local $g_IP = "127.0.0.1"

; Start des UDP-Dienstes
;==============================================
UDPStartup()

; Registriert die Cleanup Funktion.
OnAutoItExitRegister("Cleanup")

; Erzeugt einen Abh&ouml;r-Anschluss ("SOCKET")
;==============================================
Local $socket = UDPBind($g_IP, 65432)
If @error <> 0 Then Exit

;--- Hier steht Programm-Code

Func Cleanup()
	UDPCloseSocket($socket)
	UDPShutdown()
EndFunc   ;==>Cleanup
