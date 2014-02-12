IsFloat(3.14159) ; Gibt 1 zur&uuml;ck
IsFloat(3.000) ;gibt 0 zur&uuml;ck, weil der Wert Integer 3 ist
IsFloat(1 / 2 - 5) ; Gibt 1 zur&uuml;ck
IsFloat(1.5e3) ; Gibt 0 zur&uuml;ck, weil 1.5e3 = 1500
IsFloat("12.345") ; Gibt 0 zur&uuml;ck, weil es ein String ist
