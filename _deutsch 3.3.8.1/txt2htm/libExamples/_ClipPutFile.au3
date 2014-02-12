#include <Misc.au3>
Local $fTest
$fTest = _ClipPutFile(@ScriptFullPath & "|" & @ScriptDir & "|" & @SystemDir)
If Not $fTest Then
	MsgBox(0, "_ClipPutFile()-Aufruf schlug fehl!", "@error = " & @error)
Else
	MsgBox(0, "_ClipPutFile()", "Inhalt der Zwischenablage:" & @CRLF & ClipGet())
EndIf
