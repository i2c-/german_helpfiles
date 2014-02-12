#include <Date.au3>

; Zeigt das Datum in dem PC Format.
MsgBox(4096, "Langes PC Format", _DateTimeFormat(_NowCalc(), 1))
MsgBox(4096, "Kurzes PC Format", _DateTimeFormat(_NowCalc(), 2))
