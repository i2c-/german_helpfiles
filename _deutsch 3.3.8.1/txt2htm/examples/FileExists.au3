If FileExists("C:\autoexec.bat") Then
	MsgBox(4096, "Datei C:\autoexec.bat", "Existiert")
Else
	MsgBox(4096, "Datei C:\autoexec.bat", "existiert NICHT")
EndIf

If FileExists("C:\") Then
	MsgBox(4096, "Verzeichnis C:\ ", "existiert")
Else
	MsgBox(4096, "Verzeichnis C:\ ", "existiert NICHT")
EndIf

If FileExists("D:\") Then
	MsgBox(4096, "Laufwerk D: ", "existiert")
Else
	MsgBox(4096, "Laufwerk D: ", "existiert NICHT")
EndIf
