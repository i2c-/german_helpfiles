Local $file = FileOpen("test.txt", 1)

; Pr&uuml;fen, ob Datei im Schreibmodus ge&ouml;ffnet ist
If $file = -1 Then
	MsgBox(0, "Fehler", "Die Datei konnte nicht ge&ouml;ffnet werden.")
	Exit
EndIf

FileWrite($file, "Zeile 1")
FileWrite($file, "Immer noch Zeile 1" & @CRLF)
FileWrite($file, "Zeile 2")

FileClose($file)
