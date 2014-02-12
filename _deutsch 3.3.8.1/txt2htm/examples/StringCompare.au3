Local $result = StringCompare("MELÓN", "melón")
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 0):", $result)

$result = StringCompare("MELÓN", "melón", 1)
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 1):", $result)

$result = StringCompare("MELÓN", "melón", 2)
MsgBox(0, "Ergebnis des Stringvergleichs (Modus 2):", $result)
