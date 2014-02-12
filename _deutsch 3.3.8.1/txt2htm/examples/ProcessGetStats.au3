; Speicher-Infos des aktuellen laufenden Prozesses abrufen
Local $mem = ProcessGetStats()

; IO Infos des aktuellen laufenden Prozesses abrufen
Local $IO = ProcessGetStats(-1, 1)
