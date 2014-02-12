#include <File.au3>
#include <MsgBoxConstants.au3>

; Ermittelt einen eindeutigen Dateinamen im @TempDir
$sTempFile_1 = _TempFile()

; Ermittelt einen eindeutigen Dateinamen im @HomeDrive Ordner und beginnt mit dem "prefix" genannt prefix_
$sTempFile_2 = _TempFile(@HomeDrive & "\", "prefix_", ".txt", Default) ; Es ist das Schl&uuml;sselwort Default als Standardparameter zu verwenden.

MsgBox($MB_SYSTEMMODAL, "", "Geeignete Namen f&uuml;r die neue tempor&auml;re Datei: " & @CRLF & @CRLF & _
		"Datei 1: " & $sTempFile_1 & @CRLF & _
		"Datei 2: " & $sTempFile_2)
