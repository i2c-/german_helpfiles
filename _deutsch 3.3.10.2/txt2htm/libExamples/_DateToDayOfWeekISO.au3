#include <Date.au3>
#include <MsgBoxConstants.au3>

; ISO Wochentagnummer des gegebenen Datums  0=Montag - 6=Sonntag
Local $iWeekday = _DateToDayOfWeekISO(@YEAR, @MON, @MDAY)
; Nicht gleich wie @WDAY
MsgBox($MB_SYSTEMMODAL, "", "Heute ist die ISO Wochentagsnummer: " & $iWeekday)
