#include <Array.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox(0, 'Minimaler String Wert', _ArrayMin($avArray, 0, 1))
MsgBox(0, 'Minimaler numerischer Wert', _ArrayMin($avArray, 1, 0))
