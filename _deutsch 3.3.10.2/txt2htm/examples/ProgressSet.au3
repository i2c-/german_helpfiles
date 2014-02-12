Example()

Func Example()
	; Zeigt ein Fortschrittsfenster.
	ProgressOn("Fortschritt", "Erh&ouml;hung in jeder Sekunde", "0%")

	; Ver&auml;nderte den Fortschrittswert der Progressbar jede Sekunde.
	For $i = 10 To 100 Step 10
		Sleep(1000)
		ProgressSet($i, $i & "%")
	Next

	; Setzt den "subtext" und "maintext" des Fortschrittsfenster..
	ProgressSet(100, "Erledigt", "Komplett")
	Sleep(5000)

	; Schlie&szlig;t das Fortschrittsfenster.
	ProgressOff()
EndFunc   ;==>Example
