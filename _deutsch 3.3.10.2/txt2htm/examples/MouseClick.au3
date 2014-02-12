; Doppelklick auf der aktuellen Mausposition
MouseClick("left")
MouseClick("left")

; Doppelklick auf der Position x=0 y=500
MouseClick("left", 0, 500, 2)

; SICHERERE VERSION eines Doppelklicks auf der Position x=0 y=500. Benutzt die Maustasten-Einstellungen aus der Systemsteuerung
MouseClick("primary", 0, 500, 2)
