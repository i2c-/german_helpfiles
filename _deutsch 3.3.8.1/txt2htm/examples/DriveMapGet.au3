; Verbindet Laufwerk X mit \\myserver\stuff, wobei der aktuelle Benutzer benutzt wird.
DriveMapAdd("X:", "\\myserver\stuff")

; Zeigt Details des Mappings
MsgBox(0, "Laufwerk X: ist verbunden mit", DriveMapGet("X:"))
