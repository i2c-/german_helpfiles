; SERVER!! Vor dem Client starten!!!!!!!!!!!
Local $IP = "127.0.0.1" ; IP

; Startet den TCP Service
;==============================================
TCPStartup()

; Erstellt einen lauschenden "SOCKET"
;==============================================
Local $MainSocket = TCPListen($IP, 65432, 100)
If $MainSocket = -1 Then Exit

; Warten auf eine Client-Verbindung
;--------------------
While 1
	Local $ConnectedSocket = TCPAccept($MainSocket)
	If $ConnectedSocket >= 0 Then
		MsgBox(0, "", "Mein Server - Client verbunden")
		Exit
	EndIf
WEnd
