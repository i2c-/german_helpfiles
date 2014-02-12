SplashTextOn("Titel", "Nachricht hier rein.", -1, -1, -1, -1, 4, "", 24)
Sleep(3000)
SplashOff()

;; FLIMMERT
Local $sMessage = ""
SplashTextOn("Titelleiste", $sMessage, -1, -1, -1, -1, 4, "")
For $x = 1 To 20
	$sMessage = $sMessage & $x & @CRLF
	SplashTextOn("Titelleiste", $sMessage, -1, -1, -1, -1, 4, "")
	Sleep(100)
Next

;; FLIMMERT NICHT
$sMessage = ""
SplashTextOn("Titelleiste", $sMessage, -1, -1, -1, -1, 4, "")
For $x = 1 To 20
	$sMessage = $sMessage & $x & @CRLF
	ControlSetText("Titelleiste", "", "Static1", $sMessage)
	Sleep(100)
Next
