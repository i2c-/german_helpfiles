#include <GUIConstantsEx.au3>

;==============================================
;==============================================
; SERVER!! Startet mich zuerst !!!!!!!!!!!!!!!
;==============================================
;==============================================

Example()

Func Example()
	; Richtet einige wiederverwendbare Informationen ein.
	; Richtet deine &ouml;ffentliche IP Adresse (@IPAddress1) hier ein.
	;	Local $szServerPC = @ComputerName
	;	Local $szIPADDRESS = TCPNameToIP($szServerPC)
	Local $szIPADDRESS = @IPAddress1
	Local $nPORT = 33891
	Local $MainSocket, $edit, $ConnectedSocket, $szIP_Accepted
	Local $msg, $recv

	; Startet den TCP Service
	;==============================================
	TCPStartup()

	; Erstellt einen lauschenden Port.
	; Benutzt deine IP Adresse und den Port 33891. (Oben angegeben)
	;==============================================
	$MainSocket = TCPListen($szIPADDRESS, $nPORT)

	; Wenn die Socketerstellung fehl schl&auml;gt, dann wird das Programm beendet.
	If $MainSocket = -1 Then Exit


	; Erstellt eine GUI f&uuml;r Messages.
	;==============================================
	GUICreate("Mein Server (IP: " & $szIPADDRESS & ")", 300, 200)
	$edit = GUICtrlCreateEdit("", 10, 10, 280, 180)
	GUISetState()


	; Initialisiert eine Variable um eine Verbindung anzugeben
	;==============================================
	$ConnectedSocket = -1


	; Wartet auf und akzeptiert eine Verbindung
	;==============================================
	Do
		$ConnectedSocket = TCPAccept($MainSocket)
	Until $ConnectedSocket <> -1


	; Bekommt die IP des verbundenen Clients
	$szIP_Accepted = SocketToIP($ConnectedSocket)

	; GUI Message Schleife
	;==============================================
	While 1
		$msg = GUIGetMsg()

		; GUI beendet
		;--------------------
		If $msg = $GUI_EVENT_CLOSE Then ExitLoop

		; Versucht Daten zu empfangen, bis zu 2048 bytes
		;----------------------------------------------------------------
		$recv = TCPRecv($ConnectedSocket, 2048)

		; Wenn der Empfang mit @error fehlschl&auml;gt, dann hat sich der Socket getrennt.
		;----------------------------------------------------------------
		If @error Then ExitLoop

		; Konvertiert von UTF-8 in AutoIt native UTF-16
		$recv = BinaryToString($recv, 4)

		; Aktualisiert das Input-Control mit dem, was wir empfangen haben.
		;----------------------------------------------------------------
		If $recv <> "" Then GUICtrlSetData($edit, _
				$szIP_Accepted & " > " & $recv & @CRLF & GUICtrlRead($edit))
	WEnd


	If $ConnectedSocket <> -1 Then TCPCloseSocket($ConnectedSocket)

	TCPShutdown()
EndFunc   ;==>Example

; Funktion um die IP Adresse eines verbundenen Sockets wiederzugeben.
;----------------------------------------------------------------------
Func SocketToIP($SHOCKET)
	Local $sockaddr, $aRet

	$sockaddr = DllStructCreate("short;ushort;uint;char[8]")

	$aRet = DllCall("Ws2_32.dll", "int", "getpeername", "int", $SHOCKET, _
			"ptr", DllStructGetPtr($sockaddr), "int*", DllStructGetSize($sockaddr))
	If Not @error And $aRet[0] = 0 Then
		$aRet = DllCall("Ws2_32.dll", "str", "inet_ntoa", "int", DllStructGetData($sockaddr, 3))
		If Not @error Then $aRet = $aRet[0]
	Else
		$aRet = 0
	EndIf

	$sockaddr = 0

	Return $aRet
EndFunc   ;==>SocketToIP
