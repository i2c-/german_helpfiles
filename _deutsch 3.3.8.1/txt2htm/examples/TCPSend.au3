;==============================================
;==============================================
; CLIENT! Startet mich, nachdem der Server gestartet wurde!!!!!!!!!!!!!!!
;==============================================
;==============================================

Example()

Func Example()
	; Startet den TCP Service
	;==============================================
	TCPStartup()

	; Richtet einige wiederverwendbare Informationen ein.
	;--------------------------
	Local $ConnectedSocket, $szData
	; Set $szIPADDRESS Wir &auml;ndern den PC-Namen in eine IP-Adresse.
	;	Local $szServerPC = @ComputerName
	;	Local $szIPADDRESS = TCPNameToIP($szServerPC)
	Local $szIPADDRESS = @IPAddress1
	Local $nPORT = 33891

	; Initialisiert eine Variable, um eine Verbindung anzugeben.
	;==============================================
	Dim $ConnectedSocket = -1

	; Versucht, zu einem Server mit der IP und dem PORT 33891 zu verbinden.
	;=======================================================
	$ConnectedSocket = TCPConnect($szIPADDRESS, $nPORT)

	; Falls es einen Fehler gibt, wird er angezeigt
	If @error Then
		MsgBox(4112, "Fehler", "TCP-Connect schlug mit folgendem WSA-Fehler fehl: " & @error)
		; Wenn es keinen Fehler gibt, dann erscheint wiederholt eine Inputbox zur Eingabe von Daten, die zum Server gesendet werden sollen.
	Else
		; Fragt fortw&auml;hrend nach Daten, die zum Server gesendet werden sollen.
		While 1
			; InputBox f&uuml;r die zu versendenden Daten
			$szData = InputBox("Daten f&uuml;r den Server", @LF & @LF & "Gib Daten ein, die zum Server transferiert werden sollen:")

			; Wenn die Inputbox geschlossen wird oder leer bleibt, wird die Schleife beendet.
			If @error Or $szData = "" Then ExitLoop

			; Wir sollten Daten in $szData haben... Lasst uns versuchen, sie durch unseren verbundenen Socket zu versenden.
			; Konvertiert AutoIt native UTF-16 in UTF-8
			TCPSend($ConnectedSocket, StringToBinary($szData, 4))

			; Wenn das Senden mit @error fehlgeschlagen ist, dann ist der Socket getrennt.
			;----------------------------------------------------------------
			If @error Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>Example
