#include <Sound.au3>

Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")

If @error = 2 Then
	MsgBox(0, "Fehler", "Die Datei existiert nicht.")
	Exit
ElseIf @error = 3 Then
	MsgBox(0, "Fehler", "Der Aliasname ist ung&uuml;ltig.")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ; Zuweisung, weil @extended nach DllCall-Aufruf ge&auml;ndert wird
	Local $stText = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox(0, "Fehler", "&Ouml;ffnen fehlgeschlagen." & @CRLF & "Fehlernummer: " & $iExtended & @CRLF & "Fehlerbeschreibung: " & DllStructGetData($stText, 1) & @CRLF & "Beachte: M&ouml;glicherweise kann der Sound dennoch korrekt abgespielt werden.")
Else
	MsgBox(0, "Erfolgsmeldung", "Die Datei wurde erfolgreich ge&ouml;ffnet.")
EndIf

ConsoleWrite("Status nach _SoundOpen: " & _SoundStatus($sound) & @CRLF)

_SoundPlay($sound)
ConsoleWrite("Status nach _SoundPlay: " & _SoundStatus($sound) & @CRLF)

Sleep(1000)

_SoundPause($sound)
ConsoleWrite("Status nach _SoundPause: " & _SoundStatus($sound) & @CRLF)

Sleep(1000)
_SoundResume($sound)

While 1
	Sleep(100)
	If _SoundPos($sound, 2) = _SoundLength($sound, 2) Then ExitLoop
WEnd

_SoundClose($sound)
