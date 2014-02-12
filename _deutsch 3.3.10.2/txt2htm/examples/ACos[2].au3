#include <MsgBoxConstants.au3>
#include <Math.au3>

; Beispiel f&uuml;r die Verwendung von ACos mit Grad.

Local $y = _Degree(ACos(-1))

MsgBox($MB_SYSTEMMODAL, Default, "ACos(-1) = " & $y & " Grad")
