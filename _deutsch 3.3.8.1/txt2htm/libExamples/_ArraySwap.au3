#include <Array.au3>

Local $avArray[2]

$avArray[0] = "Welt!"
$avArray[1] = "Hallo"

_ArrayDisplay($avArray, "$avArray VOR _ArraySwap()")
_ArraySwap($avArray[0], $avArray[1])
_ArrayDisplay($avArray, "$avArray NACH _ArraySwap()")
