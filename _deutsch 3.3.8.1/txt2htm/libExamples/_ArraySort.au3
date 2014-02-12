#include <Array.au3>

;===============================================================================
; Beispiel 1 (verwendet ein 1D Array)
;===============================================================================
Local $avArray[10] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

_ArrayDisplay($avArray, "$avArray VOR _ArraySort()")
_ArraySort($avArray)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() aufsteigend sortiert hat")
_ArraySort($avArray, 1)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() absteigend sortiert hat")
_ArraySort($avArray, 0, 3, 6)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() aufsteigend von Index 3 bis 6 sortiert hat")

;===============================================================================
; Beispiel 2 (verwendet ein 2D Array)
;===============================================================================
Local $avArray[5][3] = [ _
		[5, 20, 8], _
		[4, 32, 7], _
		[3, 16, 9], _
		[2, 35, 0], _
		[1, 19, 6]]

_ArrayDisplay($avArray, "$avArray VOR _ArraySort()")
_ArraySort($avArray, 0, 0, 0, 0)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() Spalte 0 aufsteigend sortiert hat")
_ArraySort($avArray, 0, 0, 0, 1)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() Spalte 1 aufsteigend sortiert hat")
_ArraySort($avArray, 0, 0, 0, 2)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArraySort() Spalte 2 aufsteigend sortiert hat")
