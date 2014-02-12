; Platziert die Eingabebox oben links in der Ecke und zeigt die Zeichen an so wie sie eingegeben werden

Local $answer = InputBox("Frage", "Wo wurdest du geboren?", "Planet Erde", "", _
		 -1, -1, 0, 0)

; Bittet den Benutzer ein Passwort einzugeben.
; Nicht vergessen es mit Sternchen anzeigen zu lassen!
Local $passwd = InputBox("Sicherheitscheck", "Bitte geben Sie ein Passwort ein.", "", "*")

;
; Erwartet vom Benutzer eine Eingabe von einem oder zwei Zeichen.
; Das M im Passwortfeld bedeutet, dass eine leere Eingabe nicht angenommen wird.
; Die 2 zeigt, dass maximal zwei Zeichen eingegeben werden d&uuml;rfen
Local $value = InputBox("Test", "Bitte geben Sie ein oder zwei Zeichen ein.", "", " M2")
