$iFreeSpace = DriveSpaceFree(@HomeDrive & "\") ; Findet den freien Speicherplatz des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Freier Speicherplatz", $iFreeSpace & " MB")
