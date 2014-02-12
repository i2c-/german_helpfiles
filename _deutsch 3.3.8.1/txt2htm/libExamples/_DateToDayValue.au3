#include <Date.au3>

; Tageswert des heutigen Datums nach julianischem Kalender bestimmen.
Local $sJulDate = _DateToDayValue(@YEAR, @MON, @MDAY)
MsgBox(4096, "", "Tageswert nach dem julianischen Kalender: " & $sJulDate)

; Datum vor 14 Tagen nach julianischem Kalender berechnen.
Local $Y, $M, $D
$sJulDate = _DayValueToDate($sJulDate - 14, $Y, $M, $D)
MsgBox(4096, "", "Datum heute vor 14 Tagen nach dem julianischen Kalender: " & $D & "." & $M & "." & $Y)
