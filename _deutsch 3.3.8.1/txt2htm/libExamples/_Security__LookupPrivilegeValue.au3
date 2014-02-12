#include <SecurityConstants.au3>
#include <Security.au3>

Local $vLUID = _Security__LookupPrivilegeValue("", $SE_DEBUG_NAME)
; $vLUID repr&auml;sentiert LUID f&uuml;r einen Zugriffswert in Form eines 64Bit Integers.
; Ausgabe (aus Neugier):
ConsoleWrite("$vLUID = " & $vLUID & @CRLF)
; ... Der Rest des Skripts hier hinein ...
