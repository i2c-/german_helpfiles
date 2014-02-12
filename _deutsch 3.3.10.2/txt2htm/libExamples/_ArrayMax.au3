#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Maximaler String Wert', _ArrayMax($avArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Maximaler numerischer Wert', _ArrayMax($avArray, 1, 1))
