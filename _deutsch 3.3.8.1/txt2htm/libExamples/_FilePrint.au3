#include <File.au3>

Local $file = FileOpenDialog("zu druckende Datei ", " ", "Textdokumente (*.txt) ", 1)
If @error Then Exit

Local $print = _FilePrint($file)
If $print Then
	MsgBox(0, "Drucken ", "Die Datei wurde gedruckt. ")
Else
	MsgBox(0, "Drucken ", "Fehler:  " & @error & @CRLF & "Die Datei wurde nicht gedruckt. ")
EndIf
