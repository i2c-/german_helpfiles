#include <Misc.au3>
#include <MsgBoxConstants.au3>

; F&uuml;gt den folgenden Inhalt der Zwischenablage hinzu.
Local $fReturn = _ClipPutFile(@ScriptFullPath & "|" & @ScriptDir & "|" & @SystemDir)
If Not $fReturn Then
	MsgBox($MB_SYSTEMMODAL, "_ClipPutFile()-Aufruf schlug fehl!", "@error = " & @error)
Else
	MsgBox($MB_SYSTEMMODAL, "_ClipPutFile()", "Inhalt der Zwischenablage:" & @CRLF & ClipGet())
EndIf
