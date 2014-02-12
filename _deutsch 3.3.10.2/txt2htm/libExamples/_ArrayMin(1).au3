#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Minimaler String Wert', _ArrayMin($avArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Minimaler numerischer Wert', _ArrayMin($avArray, 1, 0))
