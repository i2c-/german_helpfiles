; Tr&auml;gt Benutzername und Passwort ein, die deinem System entsprechen.
Local $sUserName = "Benutzername"
Local $sPassword = "Passwort"

; Startet die Kommandozeile als der oben angegebene Benutzer.
RunAs($sUserName, @ComputerName, $sPassword, 0, @ComSpec, @SystemDir)
