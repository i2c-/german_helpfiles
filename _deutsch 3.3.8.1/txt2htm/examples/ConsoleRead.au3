; Kompiliere dieses Skript zu "ConsoleRead.exe".
; &Ouml;ffne ein Konsolenfenster und wechsle in das Verzeichnis, in dem ConsoleRead.exe ist.
; Tippe folgendes in die Befehlszeile:
;	echo Hallo! | ConsoleRead.exe
;
; Wenn obige Zeile in einem Konsolenfenster aufgerufen wird, gibt der echo Befehl den Text
; "Hallo!" aus. Anstatt diesen anzuzeigen, bewirkt das "|" in dem Befehl, dass der Text
; An den STDIN Stream des ConsoleRead.exe Prozesses weitergeleitet wird.
If Not @Compiled Then
	MsgBox(0, "", "Dieses Skript muss kompiliert sein, um seine Funktionalit&auml;t zu demonstrieren.")
	Exit -1
EndIf

Local $data
While True
	$data &= ConsoleRead()
	If @error Then ExitLoop
	Sleep(25)
WEnd
MsgBox(0, "", "Erhalten: " & @CRLF & @CRLF & $data)
