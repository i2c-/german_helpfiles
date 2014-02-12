#include <Sound.au3>
#include <MsgBoxConstants.au3>

Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Datei existiert nicht.")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ; Zuweisung, weil @extended nach DllCall-Aufruf ge&auml;ndert wird
	Local $stText = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox($MB_SYSTEMMODAL, "Fehler", "&Ouml;ffnen fehlgeschlagen." & @CRLF & "Fehlernummer: " & $iExtended & @CRLF & "Fehlerbeschreibung: " & DllStructGetData($stText, 1) & @CRLF & "Beachte: M&ouml;glicherweise kann der Sound dennoch korrekt abgespielt werden.")
Else
	MsgBox($MB_SYSTEMMODAL, "Erfolgsmeldung", "Die Datei wurde erfolgreich ge&ouml;ffnet.")
EndIf

MsgBox($MB_SYSTEMMODAL, "Sound-L&auml;nge", "Der Sound hat eine Spieldauer von: " & @CRLF & _
		_SoundLength($sound, 1) & @CRLF & "Millisekunden - " & _SoundLength($sound, 2))
