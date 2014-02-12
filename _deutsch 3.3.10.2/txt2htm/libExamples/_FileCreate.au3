#include <File.au3>
#include <MsgBoxConstants.au3>

If Not _FileCreate("error.log") Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Fehler beim Erstellen/Zur&uuml;cksetzen der log.-Datei: " & @error)
EndIf
