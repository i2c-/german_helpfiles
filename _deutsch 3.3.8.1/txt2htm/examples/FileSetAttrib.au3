; Kennzeichnet alle .au3 Dateien im aktuellen Verzeichnis als nur-lesend und System
If Not FileSetAttrib("*.au3", "+RS") Then
	MsgBox(4096, "Fehler", "Die Attribute konnten nicht gesetzt werden.")
EndIf

; Nimmt allen .bmp Dateien in C:\ und Unterverzeichnissen den Schreibschutz und macht sie archivierbar
If Not FileSetAttrib("C:\*.bmp", "-R+A", 1) Then
	MsgBox(4096, "Fehler", "Die Attribute konnten nicht gesetzt werden.")
EndIf
