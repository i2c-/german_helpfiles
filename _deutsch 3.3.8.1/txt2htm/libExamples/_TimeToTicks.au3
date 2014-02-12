#include <Date.au3>

Global $Sec, $Min, $Hour, $Time
; Ermittelt Ticks der aktuellen Zeit
Local $StartTicks = _TimeToTicks(@HOUR, @MIN, @SEC)
; Berechne Ticks in 45 Minuten
Local $EndTicks = $StartTicks + 45 * 60 * 1000
; In Uhrzeit umrechnen
_TicksToTime($EndTicks, $Hour, $Min, $Sec)
MsgBox(262144, 'Vorhersage', 'In 45 Minuten ist es ' & StringFormat("%02i:%02i:%02i", $Hour, $Min, $Sec) & " Uhr.")
