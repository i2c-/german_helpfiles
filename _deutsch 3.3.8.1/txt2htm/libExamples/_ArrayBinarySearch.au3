#include <Array.au3>

;===============================================================================
; Beispiel 1 (verwendet ein selbstdefiniertes Array)
;===============================================================================
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
	MsgBox(0, 'Eintrag wurde gefunden', ' Index: ' & $iKeyIndex)
Else
	MsgBox(0, 'Eintrag wurde nicht gefunden', ' Fehler: ' & @error)
EndIf

; Nach einem nicht existierenden Eintrag suchen
$iKeyIndex = _ArrayBinarySearch($avArray, "Unknown")
If Not @error Then
	MsgBox(0, 'Eintrag wurde gefunden', ' Index: ' & $iKeyIndex)
Else
	MsgBox(0, 'Eintrag wurde nicht gefunden', ' Fehler: ' & @error)
EndIf


;===============================================================================
; Beispiel 2 (verwendet ein Array, welches durch StringSplit() zur&uuml;ckgegeben wurde)
;===============================================================================
$avArray = StringSplit("a,b,d,c,e,f,g,h,i", ",")

; Sortiert das Array so, dass eine bin&auml;re Suche m&ouml;glich ist
_ArraySort($avArray, 0, 1) ; Startet bei Index 1, um $avArray[0] zu umgehen

; Zeigt das sortierte Array
_ArrayDisplay($avArray, "$avArray NACH _ArraySort()")

; Startet bei Index 1, um $avArray[0] zu umgehen
$iKeyIndex = _ArrayBinarySearch($avArray, "c", 1)
If Not @error Then
	MsgBox(0, 'Eintrag wurde gefunden', ' Index: ' & $iKeyIndex)
Else
	MsgBox(0, 'Eintrag wurde nicht gefunden', ' Fehler: ' & @error)
EndIf
