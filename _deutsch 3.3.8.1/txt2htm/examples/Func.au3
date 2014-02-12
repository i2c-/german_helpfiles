Example1()
Example2()

; example1
Func Example1()
	; Beispielskript mit drei benutzerdefinierten Funktionen
	; Beachten sie die Nutzung von Variablen, ByRef und Return

	Local $foo = 2
	Local $bar = 5
	MsgBox(0, "Heute ist der " & Datum(), "$foo hat den Wert " & $foo)
	Vertauschen($foo, $bar)
	MsgBox(0, "Nach dem Tausch von $foo und $bar", "enth&auml;lt $foo jetzt " & $foo)
	MsgBox(0, "Zum Schluss", "Der gr&ouml;&szlig;ere Wert von 3 und 4 ist " & Groesser(3, 4))
EndFunc   ;==>Example1

Func Vertauschen(ByRef $a, ByRef $b) ; Vertauscht den Inhalt zweier Variablen
	Local $t
	$t = $a
	$a = $b
	$b = $t
EndFunc   ;==>Vertauschen

Func Datum() ; Gibt das aktuelle Datum in der Form Tag.Monat.Jahr zur&uuml;ck.
	return (@MDAY & "." & @MON & "." & @YEAR)
EndFunc   ;==>Datum

Func Groesser($x, $y) ; Gibt die gr&ouml;&szlig;ere von zwei Zahlen zur&uuml;ck.
	If $x > $y Then
		Return $x
	Else
		Return $y
	EndIf
EndFunc   ;==>Groesser

;Ende des Beispielskripts 1

; example2
Func Example2()
	; Dieses Beispielskript verwendet @NumParams Makros
	Test_Numparams(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
EndFunc   ;==>Example2

Func Test_Numparams($v1 = 0, $v2 = 0, $v3 = 0, $v4 = 0, $v5 = 0, $v6 = 0, $v7 = 0, $v8 = 0, $v9 = 0, _
		$v10 = 0, $v11 = 0, $v12 = 0, $v13 = 0, $v14 = 0, $v15 = 0, $v16 = 0, $v17 = 0, $v18 = 0, $v19 = 0)
	#forceref $v1, $v2, $v3, $v4, $v5, $v6, $v7, $v8, $v9, $v10, $v11, $v12, $v13, $v14, $v15, $v16, $v17, $v18, $v19
	Local $val
	For $i = 1 To @NumParams
		$val &= Eval("v" & $i) & " "
	Next
	MsgBox(0, "@NumParams Beispiel", "@NumParams =" & @NumParams & @CRLF & @CRLF & $val)
EndFunc   ;==>Test_Numparams

;Ende des Beispielskripts 2
