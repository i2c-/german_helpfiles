#include <Date.au3>

; Gibt den ausgeschriebenen Namen des aktuellen Wochentages zur&uuml;ck (leider nur auf Englisch)
Local $sLongDayName = _DateDayOfWeek(@WDAY)

; Gibt den abgek&uuml;rzten Namen des aktuellen Wochentages zur&uuml;ck (leider nur auf Englisch)
Local $sShortDayName = _DateDayOfWeek(@WDAY, 1)

MsgBox(4096, "Wochentag", "Heute ist " & $sLongDayName & " (" & $sShortDayName & ")")
