#include <Date.au3>

; Wochentagnummer des gegebenen Datums.
Local $iWeekday = _DateToDayOfWeek(@YEAR, @MON, @MDAY)
; Sollte das gleiche wie @Wday bewirken
MsgBox(4096, "", "Die Wochentagsnummer ist: " & $iWeekday)
MsgBox(4096, "", "Heute ist : " & _DateDayOfWeek($iWeekday))
