; CLIENT!!!!!!!! Startet den SERVER zuerst... dummy!!
Local $g_IP = "127.0.0.1"

; Start des UDP-Dienstes
;==============================================
UDPStartup()

; Verbindung zu einem Abh&ouml;r-Anschluss ("SOCKET")
;==============================================
Local $socket = UDPOpen($g_IP, 65432)
If @error <> 0 Then Exit
