#include <Constants.au3>

Local Const $sFile = "test.txt"
Local $hFile = FileOpen($sFile, 2)

; Pr&uuml;ft, ob zum Schreiben ge&ouml;ffnete Datei OK ist
If $hFile = -1 Then
	MsgBox(0, "Fehler", "Kann Datei nicht &ouml;ffnen.")
	Exit
EndIf

; Schreibt etwas in die Datei.
FileWriteLine($hFile, "Zeile1")
FileWriteLine($hFile, "Zeile2")
FileWriteLine($hFile, "Zeile3")

; Entleert den Dateipuffer auf die Festplatte.
FileFlush($hFile)

; Pr&uuml;ft Dateiposition und versucht den Inhalt ab der aktuellen Dateiposition zu lesen.
MsgBox(0, "FileGetPos", StringFormat("Position: %d\nDaten:\n%s", FileGetPos($hFile), FileRead($hFile)))

; Setzt nun die Position an den Anfang.
Local $n = FileSetPos($hFile, 0, $FILE_BEGIN)

; Pr&uuml;ft Dateiposition und versucht den Inhalt ab der aktuellen Dateiposition zu lesen.
MsgBox(0, "FileGetPos", StringFormat("Position: %d\nDaten:\n%s", FileGetPos($hFile), FileRead($hFile)))

; Schlie&szlig;t das Handle.
FileClose($hFile)

; Bereinigt die tempor&auml;re Datei.
FileDelete($sFile)
