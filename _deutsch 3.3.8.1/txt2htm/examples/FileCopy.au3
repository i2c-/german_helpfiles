FileCopy("C:\*.au3", "D:\mydir\*.*")

; Methode 1 um einen Ordner (samt Inhalt) zu kopieren (ohne ein Flag zu verwenden)
DirCreate("C:\new")
FileCopy("C:\old\*.*", "C:\new\")

; Methode 2 um einen Ordner (samt Inhalt) zu kopieren (mit Verwendung des Flags 8 um das Zielverzeichnis mit zu erstellen)
FileCopy("C:\old\*.*", "C:\new\", 8)

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 8)
; Korrekt - 'TxtFiles' ist nun das Zielverzeichnis und die Dateinamen werden durch die Quellnamen festgelegt

FileCopy("C:\Temp\*.txt", "C:\Temp\TxtFiles\", 9) ; Flag = 1 + 8 (&uuml;berschreiben + Zielverzeichnisstruktur erstellen)
; Kopiert die .txt-Dateien von der Quelle in das Ziel und &uuml;berschreibt Dateien im Ziel mit dem gleichen Dateinamen
