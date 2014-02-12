; Erstes Beispiel
Exit

; Zweites Beispiel
; Skript abbrechen, wenn keine Befehlszeilenargumente
If $CmdLine[0] = 0 Then Exit (1)

; Drittes Beispiel
; Datei &ouml;ffnen, die in erstem Befehlszeilenargument angegeben ist
Local $file = FileOpen($CmdLine[1], 0)

; Pr&uuml;fen, ob Datei eingelesen wurde
If $file = -1 Then Exit (2)

; Wenn Datei leer ist, beenden (Skript ist erfolgreich)
Local $line = FileReadLine($file)
If @error = -1 Then Exit

; Hier Code f&uuml;r Dateiverarbeitung
FileClose($file)
Exit ; Ist optional bei letzter Skriptzeile
