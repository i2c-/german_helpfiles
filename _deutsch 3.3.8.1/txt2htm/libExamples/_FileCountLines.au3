#include <file.au3>

Local $CountLines = _FileCountLines("error.log")
MsgBox(64, "Fehlereintragsz&auml;hler", "Es befinden sich " & $CountLines & " Eintr&auml;ge in der Datei.")
Exit
