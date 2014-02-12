#include <Date.au3>

Local $iDays = _DateDaysInMonth(@YEAR, @MON)
MsgBox(4096, "Tage des Monats ", "Dieser Monat hat genau  " & String($iDays) & " Tage. ")
