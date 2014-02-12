; Verbindet Laufwerk X mit \\myserver\stuff, wobei der aktuelle Benutzer benutzt wird.
DriveMapAdd("X:", "\\myserver\stuff")

; Verbindet Laufwerk X mit \\myserver2\stuff2, wobei der Benutzer "jon" aus "domainx" mit dem Passwort "tickle" benutzt wird.
DriveMapAdd("X:", "\\myserver2\stuff2", 0, "domainx\jon", "tickle")
