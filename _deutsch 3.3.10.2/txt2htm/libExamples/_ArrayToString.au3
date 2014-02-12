#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray[20]

; Testarray best&uuml;cken.
For $i = 0 To UBound($avArray) - 1
	$avArray[$i] = Random(-20000, 20000, 1)
Next

_ArrayDisplay($avArray, "$avArray")

MsgBox($MB_SYSTEMMODAL, "_ArrayToString() erh&auml;lt von $avArray die Items 1 bis 7", _ArrayToString($avArray, @TAB, 1, 7))
