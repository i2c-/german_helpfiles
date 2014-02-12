Local $x = Log(1000) ; R&uuml;ckgabe 6.90775527898214
Local $y = Log10(1000) ; R&uuml;ckgabe 3

; Benutzerdefinierte Funktion f&uuml;r den Zehnerlogarithmus
Func Log10($x)
	Return Log($x) / Log(10) ; 10 ist die Basis
EndFunc   ;==>Log10
