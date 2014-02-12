ProgressOn("Fortschritt", "Erh&ouml;hungsschritte in Sekunden", "0 Prozent")
For $i = 10 To 100 Step 10
	Sleep(1000)
	ProgressSet($i, $i & " Prozent")
Next
ProgressSet(100, "Fertig", "Komplett")
Sleep(500)
ProgressOff()
