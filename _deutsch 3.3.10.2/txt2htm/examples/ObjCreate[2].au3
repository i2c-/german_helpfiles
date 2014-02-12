#include <MsgBoxConstants.au3>

; &Ouml;ffnen des MediaPlayers auf einem REMOTE Computer

Local $oRemoteMedia = ObjCreate("MediaPlayer.MediaPlayer.1", "Name_des_Remote-PC")

If Not @error Then
	MsgBox($MB_SYSTEMMODAL, "Remote ObjCreate Test", "ObjCreate() f&uuml;r ein Remote-Mediaplayer Objekt erfolgreich !")
	$oRemoteMedia.Open(@WindowsDir & "\media\Windows XP Startup.wav") ; Den Ton abspielen falls die Datei existiert
Else
	MsgBox($MB_SYSTEMMODAL, "Remote ObjCreate Test", "Fehler beim &Ouml;ffnen des Remote-Objekts. Fehlercode: " & Hex(@error, 8))
EndIf
