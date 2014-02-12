ProcessClose("notepad.exe")

Local $PID = ProcessExists("notepad.exe") ; Gibt die PID des Prozesses zur&uuml;ck oder 0, falls der Prozess nicht gefunden wurde.
If $PID Then ProcessClose($PID)
