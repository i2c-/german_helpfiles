; SERVER!! Startet mich zuerst !!!!!!!!!!!!!!!
Local $IP = "127.0.0.1" ; IP

; Startet den TCP Service
;==============================================
TCPStartup()

; Erstellt einen lauschenden "SOCKET"
;==============================================
Local $MainSocket = TCPListen($IP, 65432, 100)
If $MainSocket = -1 Then Exit
