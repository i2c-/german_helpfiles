#include <Math.au3>
#include <MsgBoxConstants.au3>

Local $degrees = 35
Local $radians = _Radian($degrees)

MsgBox($MB_SYSTEMMODAL, "Umrechnung: Grad in Radiant", $degrees & "° = " & $radians & " rad")
