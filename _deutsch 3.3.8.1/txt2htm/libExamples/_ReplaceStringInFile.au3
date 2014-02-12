#include <File.au3>

Local $find = "VORHER"
Local $replace = "NACHHER"

Local $filename = "C:\_ReplaceStringInFile.test"

Local $msg = "Hallo Test " & $find & " Hallo Test" & @CRLF
$msg &= "Hallo Test" & @CRLF
$msg &= @CRLF
$msg &= $find

FileWrite($filename, $msg)

MsgBox(0, "VORHER", $msg)

Local $retval = _ReplaceStringInFile($filename, $find, $replace)
If $retval = -1 Then
	MsgBox(0, "FEHLER", "Das Suchmuster konnte nicht Ersetzt werden!" & @CRLF & " & Datei: " & $filename & " Fehlercode: " & @error)
	Exit
Else
	MsgBox(0, "INFO", $retval & " &Uuml;bereinstimmungen mit dem Suchmuster: " & $find & " in der Datei: " & $filename & " gefunden.")
EndIf

$msg = FileRead($filename, 1000)
MsgBox(0, "NACHHER", $msg)
FileDelete($filename)
