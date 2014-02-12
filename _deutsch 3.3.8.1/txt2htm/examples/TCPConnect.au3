; CLIENT!!!!!!!! Startet zuerst den SERVER!!
Local $IP = "127.0.0.1" ; IP

; Startet den TCP Service
;==============================================
TCPStartup()

; Verbindet zu einem lauschenden "SOCKET"
;==============================================
Local $socket = TCPConnect($IP, 65432)
If $socket = -1 Then Exit
