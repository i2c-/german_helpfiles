#include <File.au3>
; Beispiel: Schreibt in die Zeile 3 der Datei c:\test.txt, Ersetzt eine vorhandene Zeile 3
_FileWriteToLine("c:\test.txt", 3, "Mein Ersatz f&uuml;r die Zeile 3", 1)
; Beispiel: Schreibt in die Zeile 3 der Datei c:\test.txt, Ersetzt eine vorhandene Zeile 3 nicht
_FileWriteToLine("c:\test.txt", 3, "Mein neuer Eintrag", 0)
