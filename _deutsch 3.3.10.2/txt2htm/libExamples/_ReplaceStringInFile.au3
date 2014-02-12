#include <File.au3>
#include <MsgBoxConstants.au3>

Local $find = "VORHER"
Local $replace = "NACHHER"

Local $filename = "C:\_ReplaceStringInFile.test"

Local $msg = "Hallo Test " & $find & " Hallo Test" & @CRLF
$msg &= "Hallo Test" & @CRLF
$msg &= @CRLF
$msg &= $find

FileWrite($filename, $msg)

MsgBox($MB_SYSTEMMODAL, "VORHER", $msg)

Local $retval = _ReplaceStringInFile($filename, $find, $replace)
If $retval = -1 Then
	MsgBox($MB_SYSTEMMODAL, "FEHLER", "Das Suchmuster konnte nicht Ersetzt werden!" & @CRLF & " & Datei: " & $filename & " Fehlercode: " & @error)
	Exit
Else
	MsgBox($MB_SYSTEMMODAL, "INFO", $retval & " &Uuml;bereinstimmungen mit dem Suchmuster: " & $find & " in der Datei: " & $filename & " gefunden.")
EndIf

$msg = FileRead($filename, 1000)
MsgBox($MB_SYSTEMMODAL, "NACHHER", $msg)
FileDelete($filename)
