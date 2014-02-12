#include <file.au3>

Local $aRecords
If Not _FileReadToArray("error.log", $aRecords) Then
	MsgBox(4096, "Fehler", "Fehler beim Einlesen der Datei in das Array!" & @CRLF & "Fehlercode: " & @error)
	Exit
EndIf
For $x = 1 To $aRecords[0]
	MsgBox(0, 'Datensatz ' & $x & ':', $aRecords[$x])
Next
