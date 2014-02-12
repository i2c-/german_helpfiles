Local $hDownload = InetGet("http://www.autoitscript.com/autoit3/files/beta/update.dat", @TempDir & "\update.dat", 1, 1)
Do
	Sleep(250)
Until InetGetInfo($hDownload, 2) ; &Uuml;berpr&uuml;fen ob der Download abgeschlossen ist.
Local $nBytes = InetGetInfo($hDownload, 0)
InetClose($hDownload) ; Handle schlie&szlig;en um die Resourcen freizugeben.
MsgBox(0, "", "Bytes gelesen: " & $nBytes)
