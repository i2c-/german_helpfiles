Local $sFileSystem = DriveGetFileSystem(@HomeDrive & "\") ; Findet den Dateisystem Typ des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Dateisystem Typ:", $sFileSystem)
