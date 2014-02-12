#include <File.au3>

; Beispiel 1
Local $hFile = FileOpen(@ScriptDir & "\Example.log", 1) ; &Ouml;ffnet die Logdatei im Schreibmodus

_FileWriteLog($hFile, "Text 1") ; Schreibt in die Logdatei. Das Dateihandle wurde von FileOpen zur&uuml;ckgegeben.
FileClose($hFile) ; Schlie&szlig;t das Dateihandle um die Datei wieder freizugeben.

; Beispiel 2
_FileWriteLog(@ScriptDir & "\Example.log", "Text 2") ; Schreibt in die Logdatei durch angegeben des Dateipfades.
