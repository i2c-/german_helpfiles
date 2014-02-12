#include <Sound.au3>
#include <MsgBoxConstants.au3>

Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Datei existiert nicht.")
	Exit
ElseIf @error = 3 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Der Aliasname ist ung&uuml;ltig.")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ; Zuweisung, weil @extended nach DllCall-Aufruf ge&auml;ndert wird
	$stTexLocal t = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox($MB_SYSTEMMODAL, "Fehler", "&Ouml;ffnen fehlgeschlagen." & @CRLF & "Fehlernummer: " & $iExtended & @CRLF & "Fehlerbeschreibung: " & DllStructGetData($stText, 1) & @CRLF & "Beachte: M&ouml;glicherweise kann der Sound dennoch korrekt abgespielt werden.")
Else
	MsgBox($MB_SYSTEMMODAL, "Erfolgsmeldung", "Die Datei wurde erfolgreich ge&ouml;ffnet.")
EndIf

_SoundPlay($sound)

While 1
	Sleep(100)
	If _SoundPos($sound, 2) >= 200 Then
		_SoundStop($sound)
		ExitLoop
	EndIf
WEnd

; Zeigt, dass der Sound nach dem Stoppen wieder von Beginn an abgespielt wird.
Sleep(300)
_SoundPlay($sound, 1)

_SoundClose($sound)
