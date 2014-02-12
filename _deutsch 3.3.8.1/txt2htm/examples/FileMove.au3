FileMove("C:\foo.au3", "D:\mydir\bak.au3")

; Zweites Beispiel:
;	benutzt Flags '1' (&uuml;berschreiben) und '8' (automatisch die Zielverzeichnisstruktur erstellen) zusammen
;	verschiebt alle .txt-Dateien vom Temp-Verzeichnis in den Ordner TxtFiles und &uuml;berpr&uuml;ft, ob
;	Zielverzeichnisstruktur bereits existiert, falls nicht wird diese automatisch erstellt
FileMove(@TempDir & "\*.txt", @TempDir & "\TxtFiles\", 9)
