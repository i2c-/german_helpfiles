#include <Date.au3>
#include <MsgBoxConstants.au3>

; Gibt den ausgeschriebenen Namen des aktuellen Wochentages zur&uuml;ck (leider nur auf Englisch)
Local $sLongDayName = _DateDayOfWeek(@WDAY)

; Gibt den abgek&uuml;rzten Namen des aktuellen Wochentages zur&uuml;ck (leider nur auf Englisch)
Local $sShortDayName = _DateDayOfWeek(@WDAY, 1)

MsgBox($MB_SYSTEMMODAL, "Wochentag", "Heute ist " & $sLongDayName & " (" & $sShortDayName & ")")
