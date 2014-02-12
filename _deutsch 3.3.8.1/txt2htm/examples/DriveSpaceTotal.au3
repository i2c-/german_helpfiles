Local $iTotalSpace = DriveSpaceTotal(@HomeDrive & "\") ; Findet den Gesamtspeicherplatz des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Gesamtspeicherplatz", $iTotalSpace & " MB")
