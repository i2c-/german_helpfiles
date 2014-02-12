Local $file = FileOpen("test.txt", 0)

; Pr&uuml;fen, ob Datei eingelesen wurde
If $file = -1 Then
	MsgBox(0, "Fehler", "Die Datei konnte nicht ge&ouml;ffnet werden.")
	Exit
EndIf

; Zeilen des Textes einlesen bis EOF
While 1
	Local $line = FileReadLine($file)
	If @error = -1 Then ExitLoop
	MsgBox(0, "Zeile gelesen:", $line)
WEnd

FileClose($file)
