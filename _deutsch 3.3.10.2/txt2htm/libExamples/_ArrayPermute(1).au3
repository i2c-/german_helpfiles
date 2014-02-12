;Deklariert ein 1-dimensionales Array und gibt ein Array mit allen m&ouml;glichen Kombinationen zur&uuml;ck

#include <Array.au3>

Local $aArray[4] = [1, 2, 3, 4]
Local $aNewArray = _ArrayPermute($aArray, ",") ; Standardparameter verwenden
_ArrayDisplay($aNewArray, "Array mit allen m&ouml;glichen Kombinationen")
