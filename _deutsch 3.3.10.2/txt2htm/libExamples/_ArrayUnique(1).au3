#include <Array.au3>

Local $aArray[10] = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5] ; Erstellt ein 1-dimensionales Array, welches doppelte Werte enth&auml;lt.
_ArrayDisplay($aArray, "$aArray") ;Zeigt das Array
Local $aNewArray = _ArrayUnique($aArray) ; Standardparameter verwenden
_ArrayDisplay($aNewArray, "$aNewArray zeigt die erste Dimension von $aArray") ;Zeigt das Array
