; *****************************************************************************
; Beispiel 1 - Deklariert ein 1-dimensionales Array und erstellt ein Array welches alle m&ouml;glichen Kombinationen enth&auml;lt
; *****************************************************************************

#include <Array.au3>

Local $aArray[5] = [1, 2, 3, 4, 5]

For $i = 1 To UBound($aArray)
	Local $aArrayCombo = _ArrayCombinations($aArray, $i, ",")
	_ArrayDisplay($aArrayCombo, "iSet = " & $i)
Next
