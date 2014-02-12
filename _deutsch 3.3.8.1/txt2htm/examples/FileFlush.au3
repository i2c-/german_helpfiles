Local Const $sFile = "test.txt"
Local $hFile = FileOpen($sFile, 1)

; Pr&uuml;ft ob die Datei ge&ouml;ffnet wurde.
If $hFile = -1 Then
	MsgBox(0, "Error", "Die Datei kann nicht ge&ouml;ffnet werden.")
	Exit
EndIf

; Scheibt "Line1" zu der Datei.
FileWriteLine($hFile, "Line1")

; &Ouml;ffnet den Editor, um zu zeigen, dass die Datei noch leer ist, da diese noch nicht auf die Festplatte
; geleert (geschrieben) wurde.
RunWait("notepad.exe " & $sFile)

; Leert (schreibt) die Datei auf die Festplatte.
FileFlush($hFile)

; &Ouml;ffnet den Editor erneut, um zu zeigen, dass der Inhalt der Datei nun auf die Festplatte geleert
; (geschrieben) wurde.
RunWait("notepad.exe " & $sFile)

; Schlie&szlig;t das Handle.
FileClose($hFile)

; L&ouml;scht die tempor&auml;re Datei.
FileDelete($sFile)
