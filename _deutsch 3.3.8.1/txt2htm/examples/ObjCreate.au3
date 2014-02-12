; Beispiel 1
;
; Z&auml;hlen der offenen Explorerfenster

Local $oShell = ObjCreate("shell.application") ; Anlegen des Windows Shell Objekts
Local $oShellWindows = $oShell.windows ; Auslesen der Collection offener Explorerfenster

If IsObj($oShellWindows) Then

	Local $string = "" ; String f&uuml;r die Anzeige

	For $Window In $oShellWindows ; Z&auml;hlen aller existierenden Explorerfenster
		$string = $string & $Window.LocationName & @CRLF
	Next

	MsgBox(0, "Explorerfenster", "Es existieren folgende Explorerfenster:" & @CRLF & @CRLF & $string);

EndIf
Exit


; Beispiel 2
;
; &Ouml;ffnen des MediaPlayers auf einem REMOTE Computer
Local $oRemoteMedia = ObjCreate("MediaPlayer.MediaPlayer.1", "Name_des_Remote-PC")

If Not @error Then
	MsgBox(0, "Remote ObjCreate Test", "ObjCreate() f&uuml;r ein Remote-Mediaplayer Objekt erfolgreich !")
	$oRemoteMedia.Open(@WindowsDir & "\media\Windows XP Startup.wav") ; Den Ton abspielen falls die Datei existiert
Else
	MsgBox(0, "Remote ObjCreate Test", "Fehler beim &Ouml;ffnen des Remote-Objekts. Fehlercode: " & Hex(@error, 8))
EndIf
