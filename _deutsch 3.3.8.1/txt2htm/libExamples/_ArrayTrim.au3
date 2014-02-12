#include <Array.au3>

Local $avArray[5]
$avArray[0] = "ab"
$avArray[1] = "bc"
$avArray[2] = "cd"
$avArray[3] = "de"
$avArray[4] = "ef"

_ArrayDisplay($avArray, "$avArray VOR _ArrayTrim()")
_ArrayTrim($avArray, 1, 1, 1, 3)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArrayTrim() von den Items 1 bis 3 1 Zeichen rechts abgeschnitten hat")
