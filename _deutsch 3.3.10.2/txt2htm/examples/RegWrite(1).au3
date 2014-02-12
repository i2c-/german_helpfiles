; Schreibt einen einzelnen REG_SZ Wert
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel", "REG_SZ", "Hallo dies ist ein Test")

; Schreibt den REG_MULTI_SZ Wert von "Zeile1" und "Zeile2"
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel 1", "REG_MULTI_SZ", "Zeile1" & @CRLF & "Zeile2")

; Schreibt den REG_MULTI_SZ Wert von "Zeile1"
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel 2", "REG_MULTI_SZ", "Zeile1")

; F&uuml;gt immer einen zus&auml;tzlichen leeren Null-String an
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel 3", "REG_MULTI_SZ", "Zeile1" & @CRLF & "Zeile2" & @CRLF)
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel 4", "REG_MULTI_SZ", "Zeile1" & @CRLF & @CRLF & "Zeile2" & @CRLF)

; Leert REG_MULTI_SZ
RegWrite("HKEY_CURRENT_USER\Software\Test", "Test Schl&uuml;ssel 5", "REG_MULTI_SZ", "")

; Erstellt nur den Schl&uuml;ssel
RegWrite("HKEY_CURRENT_USER\Software\Test")
