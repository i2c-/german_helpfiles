Local $file = FileOpen("test.txt", 0)

; Pr&uuml;fen, ob Datei zum Lesen ge&ouml;ffnet wurde
If $file = -1 Then
	MsgBox(0, "Fehler", "Die Datei konnte nicht ge&ouml;ffnet werden.")
	Exit
EndIf

FileClose($file)


; Ein anderes Beispiel, das die Verzeichnisstruktur automatisch erstellt
$file = FileOpen("test.txt", 10) ; Dies ist gleichzusetzen mit 2 + 8 (l&ouml;schen und Verzeichnis erstellen)

If $file = -1 Then
	MsgBox(0, "Fehler", "Die Datei konnte nicht ge&ouml;ffnet werden.")
	Exit
EndIf

FileClose($file)
