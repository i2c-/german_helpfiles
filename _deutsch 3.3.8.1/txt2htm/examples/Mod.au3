Local $n = 18
If Mod($n, 2) = 0 Then
	MsgBox(0, "", $n & " ist eine gerade Zahl.")
Else
	MsgBox(0, "", $n & " ist eine ungerade Zahl.")
EndIf

Local $x = Mod(4, 7) ;$x == 4 weil der Divisor > Dividend ist

Local $y = Mod(1, 3 / 4) ;$y == 0.25 weil der Divisor ein Flie&szlig;kommaformat aufweist
