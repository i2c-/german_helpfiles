Local $sLabel = DriveGetLabel(@HomeDrive & "\") ; Findet die Laufwerksbezeichnung des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Laufwerksbezeichnung: ", $sLabel)
