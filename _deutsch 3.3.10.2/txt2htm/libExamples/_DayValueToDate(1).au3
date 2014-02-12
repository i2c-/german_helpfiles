#include <Date.au3>
#include <MsgBoxConstants.au3>

; Julianisches Datum des heutigen Tages.
Local $sJulDate = _DateToDayValue(@YEAR, @MON, @MDAY)
MsgBox($MB_SYSTEMMODAL, "", "Heute w&auml;re nach julianischem Kalender: " & $sJulDate)

; 14 Tage zur&uuml;ckrechnen
Local $Y, $M, $D
$sJulDate = _DayValueToDate($sJulDate - 14, $Y, $M, $D)
MsgBox($MB_SYSTEMMODAL, "", "Vor 14 Tagen war der " & $D & "." & $M & "." & $Y & "  (" & $sJulDate & ")")
