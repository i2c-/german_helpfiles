#include <File.au3>
If Not _FileCreate("error.log") Then
	MsgBox(4096, "Fehler", "Fehler beim Erstellen/Zur&uuml;cksetzen der log.-Datei: " & @error)
EndIf
