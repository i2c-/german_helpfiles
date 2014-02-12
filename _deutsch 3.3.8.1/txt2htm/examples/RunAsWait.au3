; Tr&auml;gt Benutzername und Passwort ein, die deinem System entsprechen.
Local $sUserName = "Benutzername"
Local $sPassword = "Passwort"

; Startet die Kommandozeile als der oben angegebene Benutzer.
Local $pid = RunAsWait($sUserName, @ComputerName, $sPassword, 0, @ComSpec, @SystemDir)

; Wartet, bis der gestartete Prozess beendet wurde.
ProcessWaitClose($pid)

; Zeigt eine Info an.
MsgBox(64, "", "Der Prozess, auf den wir gewartet hatten, wurde beendet.")
