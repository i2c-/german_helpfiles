Local $file = FileOpen("test.txt", 1)

; Pr&uuml;fen, ob Datei im Schreibmodus ge&ouml;ffnet ist
If $file = -1 Then
	MsgBox(0, "Fehler", "Die Datei konnte nicht ge&ouml;ffnet werden.")
	Exit
EndIf

FileWriteLine($file, "Zeile 1")
FileWriteLine($file, "Zeile 2" & @CRLF)
FileWriteLine($file, "Zeile 3")

FileClose($file)
