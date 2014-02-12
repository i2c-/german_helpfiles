#include <MsgBoxConstants.au3>
#include <Math.au3>

; Beispiel f&uuml;r die Verwendung von ATan mit Grad.

Local $x = _Degree(ATan(1))

MsgBox($MB_SYSTEMMODAL, Default, "ATan(1) = " & $x & " Grad")
