; Zeigt die Dateinamen aller Dateien im aktuellen Verzeichnis an.
Local $search = FileFindFirstFile("*.*")

; Pr&uuml;fen, ob die Suche erfolgreich war
If $search = -1 Then
	MsgBox(0, "Fehler", "Es wurden keine Dateien/Verzeichnisse gefunden, die zu dem Suchmuster passen")
	Exit
EndIf

While 1
	Local $file = FileFindNextFile($search)
	If @error Then ExitLoop

	MsgBox(4096, "Datei:", $file)
WEnd

; Handle f&uuml;r Suche schliessen
FileClose($search)
