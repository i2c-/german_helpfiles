Local $result = StringCompare("MEL�N", "mel�n")
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 0):", $result)

$result = StringCompare("MEL�N", "mel�n", 1)
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 1):", $result)

$result = StringCompare("MEL�N", "mel�n", 2)
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 2):", $result)
