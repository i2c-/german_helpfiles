#Alternate
Local $hDownload = InetGet("http://www.autoitscript.com/autoit3/files/beta/update.dat", @TempDir & "\update.dat", 1, 1)
Do
	Sleep(250)
Until InetGetInfo($hDownload, 2) ; &Uuml;berpr&uuml;fen ob der der Download abgeschlossen ist.
Local $aData = InetGetInfo($hDownload) ; Hole alle Informationen.
InetClose($hDownload) ; Handle schlie&szlig;en um die Resourcen freizugeben.
MsgBox(0, "", "Bytes gelesen: " & $aData[0] & @CRLF & _
		"Gr&ouml;&szlig;e: " & $aData[1] & @CRLF & _
		"Komplett?: " & $aData[2] & @CRLF & _
		"Erfolgreich?: " & $aData[3] & @CRLF & _
		"@error: " & $aData[4] & @CRLF & _
		"@extended: " & $aData[5] & @CRLF)
