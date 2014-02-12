Local $datei = FileOpen("test.txt", 0)

; &Uuml;berpr&uuml;ft ob die Datei ge&ouml;ffnet werden konnte
If $datei = -1 Then
	MsgBox(0, "Error", "Konnte Datei nicht &ouml;ffnen.")
	Exit
EndIf

; Liest 1 Buchstabe gleichzeitig bis das Ende der Datei erreicht wurde
While 1
	Local $buchstabe = FileRead($datei, 1)
	If @error = -1 Then ExitLoop
	MsgBox(0, "Buchstabe gelesen:", $buchstabe)
WEnd

FileClose($datei)
