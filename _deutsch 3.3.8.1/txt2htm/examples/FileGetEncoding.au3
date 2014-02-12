Local $iEncoding = FileGetEncoding(@ScriptFullPath) ; Liest die Zeichenkodierung der Scriptdatei aus
If @error Then
	MsgBox(4096, "Error", "Konnte keine Kodierung auslesen.")
Else
	MsgBox(4096, "FileGetEncoding", "Der zur&uuml;ckgegebene Wert ist: " & $iEncoding) ; Der zur&uuml;ckgegebene Wert f&uuml;r dieses Beispiel sollte 0 bzw. ANSI sein.
EndIf
