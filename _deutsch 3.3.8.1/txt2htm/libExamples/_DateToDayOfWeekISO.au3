#include <Date.au3>

; ISO Wochentagnummer des gegebenen Datums  0=Montag - 6=Sonntag
Local $iWeekday = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
; Nicht gleich wie @Wday
MsgBox(4096, "", "Heute ist die ISO Wochentagsnummer: " & $iWeekday)
