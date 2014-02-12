#include <Array.au3>
#include <String.au3>

Example()

Func Example()
	; Erstellt ein Array mit allen Werten zwischen "[" und "]"
	Local $aArray1 = _StringBetween('[18][20][3][5][500][60]', '[', ']')

	; Zeigt das Ergebnis mit _ArrayDisplay
	_ArrayDisplay($aArray1, 'Standardsuche')
EndFunc   ;==>Example
