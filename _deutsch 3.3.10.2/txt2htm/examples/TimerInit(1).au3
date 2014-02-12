#include <MsgBoxConstants.au3>

Local $hTimer = TimerInit() ; Beginnt den Timer speichert das Handle in einer Variable.
Sleep(3000) ; Sleep f&uuml;r 3 Sekunden.
Local $iDiff = TimerDiff($hTimer) ; Findet den Zeitunterschied zum vorherigen Aufruf von TimerInit. Die Variable wird im TimerInit Handle gespeichert und als Handle an TimerDiff &uuml;bergeben.
MsgBox($MB_SYSTEMMODAL, "Zeitunterschied", $iDiff)
