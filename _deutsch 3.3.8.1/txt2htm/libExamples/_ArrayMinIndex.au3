#include <Array.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox(0, 'Index des minimalen String Wertes', _ArrayMinIndex($avArray, 0, 1))
MsgBox(0, 'Index des minimalen numerischer String Wertes', _ArrayMinIndex($avArray, 1, 1))
