SplashTextOn("Titel", "Nachricht hier rein.", -1, -1, -1, -1, 4, "", 24)
Sleep(3000)
SplashOff()

;; FLIMMERT
Local $message = ""
SplashTextOn("Titelleiste", $message, -1, -1, -1, -1, 4, "")
For $x = 1 To 20
	$message = $message & $x & @LF
	SplashTextOn("Titelleiste", $message, -1, -1, -1, -1, 4, "")
	Sleep(100)
Next

;; FLIMMERT NICHT
$message = ""
SplashTextOn("Titelleiste", $message, -1, -1, -1, -1, 4, "")
For $x = 1 To 20
	$message = $message & $x & @LF
	ControlSetText("Titelleiste", "", "Static1", $message)
	Sleep(100)
Next
