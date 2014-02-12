#include <Array.au3>

Local $avArrayTarget[9] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
Local $avArraySource[2] = [100, 200]

_ArrayDisplay($avArrayTarget, "$avArrayTarget VOR _ArrayPush()")
_ArrayPush($avArrayTarget, $avArraySource)
_ArrayDisplay($avArrayTarget, "$avArrayTarget NACHDEM _ArrayPush() 2 Werte am Ende eingef&uuml;gt hat")
_ArrayPush($avArrayTarget, $avArraySource, 1)
_ArrayDisplay($avArrayTarget, "$avArrayTarget NACHDEM _ArrayPush() 2 Werte am Anfang eingef&uuml;gt hat")
_ArrayPush($avArrayTarget, "Hallo Welt", 1)
_ArrayDisplay($avArrayTarget, "$avArrayTarget NACHDEM _ArrayPush() einen String am Anfang eingef&uuml;gt hat")
