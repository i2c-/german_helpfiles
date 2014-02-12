#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox($MB_SYSTEMMODAL, 'Index des minimalen String Wertes', _ArrayMinIndex($avArray, 0, 1))
MsgBox($MB_SYSTEMMODAL, 'Index des minimalen numerischer String Wertes', _ArrayMinIndex($avArray, 1, 1))
