#include <Array.au3>
#include <MsgBoxConstants.au3>

;verwendet ein selbstdefiniertes Array

Local $avArray[10]

$avArray[0] = "JPM"
$avArray[1] = "Holger"
$avArray[2] = "Jon"
$avArray[3] = "Larry"
$avArray[4] = "Jeremy"
$avArray[5] = "Valik"
$avArray[6] = "Cyberslug"
$avArray[7] = "Nutster"
$avArray[8] = "JdeB"
$avArray[9] = "Tylo"

; Sortiert das Array so, dass eine bin&auml;re Suche m&ouml;glich ist
_ArraySort($avArray)

; Zeigt das sortierte Array
_ArrayDisplay($avArray, "$avArray NACH _ArraySort()")

; Nach einem existierenden Eintrag suchen
Local $iKeyIndex = _ArrayBinarySearch($avArray, "Jon")
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, 'Eintrag wurde gefunden', ' Index: ' & $iKeyIndex)
Else
	MsgBox($MB_SYSTEMMODAL, 'Eintrag wurde nicht gefunden', ' Fehler: ' & @error)
EndIf
