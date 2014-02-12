Local $var = DriveGetSerial(@HomeDrive & "\") ; Findet die Seriennummer des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Seriennummer: ", $var)
