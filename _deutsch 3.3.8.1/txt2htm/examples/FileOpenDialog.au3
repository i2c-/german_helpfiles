Local $message = "Um mehrere Dateien auszuw&auml;hlen, ist die Strg-Taste oder die Shift-Taste zu dr&uuml;cken."

Local $var = FileOpenDialog($message, @WindowsDir & "\", "Bilder (*.jpg;*.bmp)", 1 + 4)

If @error Then
	MsgBox(4096, "", "Keine Datei(en) ausgew&auml;hlt")
Else
	$var = StringReplace($var, "|", @CRLF)
	MsgBox(4096, "", "Es wurde(n) " & $var & " ausgew&auml;hlt")
EndIf


; Mehrfache Filtergruppe
$message = "Um mehrere Dateien auszuw&auml;hlen, ist die Strg-Taste oder die Shift-Taste zu dr&uuml;cken."

$var = FileOpenDialog($message, @WindowsDir & "", "Bilder (*.jpg;*.bmp)|Videos (*.avi;*.mpg)", 1 + 4)

If @error Then
	MsgBox(4096, "", "Keine Datei(en) ausgew&auml;hlt")
Else
	$var = StringReplace($var, "|", @CRLF)
	MsgBox(4096, "", "Es wurde(n) " & $var & " ausgew&auml;hlt.")
EndIf
