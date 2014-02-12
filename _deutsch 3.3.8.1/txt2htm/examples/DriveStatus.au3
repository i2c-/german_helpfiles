Local $sStatus = DriveStatus(@HomeDrive & "\"); Findet den Status des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox(4096, "Status", $sStatus)
