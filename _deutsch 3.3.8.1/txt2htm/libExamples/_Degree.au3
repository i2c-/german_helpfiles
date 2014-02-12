#include <Math.au3>

Local $radians = 3.14159265358979
Local $degrees = _Degree($radians)

MsgBox(0, "Umrechnung: Radiant in Grad", $radians & " rad = " & $degrees & "°")
