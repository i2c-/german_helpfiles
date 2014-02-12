#include <Date.au3>

; Vollst&auml;ndigen (englischen) Monatsnamen in Textform bestimmen
Local $sLongMonthName = _DateToMonth(@MON)

; Kurzform des englischen Monatsnamens bestimmen
Local $sShortMonthName = _DateToMonth(@MON, 1)

MsgBox(4096, "Aktueller Monat", "Der englische Name des aktuellen Monats lautet: " & $sLongMonthName & " (" & $sShortMonthName & ")")
