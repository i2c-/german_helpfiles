#include <File.au3>

Local $s_TempFile, $s_FileName

; Ermittelt einen eindeutigen Dateinamen im @TempDir
$s_TempFile = _TempFile()

; Ermittelt einen eindeutigen Dateinamen, der mit 'tst_' beginnt und mit der Erweiterung '.txt' endet, im angegebenen Verzeichnis
$s_FileName = _TempFile("C:\", "tst_", ".txt", 7)

MsgBox(4096, "Info", "Geeignete Namen f&uuml;r die neue tempor&auml;re Datei: " & @LF & @LF & $s_TempFile & @LF & $s_FileName)

Exit
