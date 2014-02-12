#include <MsgBoxConstants.au3>
#include <Math.au3>

; Beispiel f&uuml;r die Verwendung von ASin mit Grad.

Local $x = _Degree(ASin(0.5))

MsgBox($MB_SYSTEMMODAL, Default, "ASin(0.5) = " & $x & " Grad")
