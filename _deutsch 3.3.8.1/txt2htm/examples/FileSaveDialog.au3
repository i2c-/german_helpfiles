Local $MyDocsFolder = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"

Local $var = FileSaveDialog("W&auml;hle einen Namen.", $MyDocsFolder, "Skripte (*.aut;*.au3)", 2)
; Option 2 = Dialog wird solange wiederholt, bis ein g&uuml;ltiger Pfad bzw. eine g&uuml;ltige Datei ausgew&auml;hlt wurde.

If @error Then
	MsgBox(4096, "", "Speichern abgebrochen.")
Else
	MsgBox(4096, "", "Es wurde " & $var & " gew&auml;hlt.")
EndIf


; Multifiltergruppen
$var = FileSaveDialog("W&auml;hle einen Namen.", $MyDocsFolder, "Skripte (*.aut;*.au3)|Textdateien (*.ini;*.txt)", 2)
; Option 2 = Dialog wird solange wiederholt, bis ein g&uuml;ltiger Pfad bzw. eine g&uuml;ltige Datei ausgew&auml;hlt wurde.

If @error Then
	MsgBox(4096, "", "Speichern abgebrochen.")
Else
	MsgBox(4096, "", "Es wurde " & $var & " gew&auml;hlt.")
EndIf
