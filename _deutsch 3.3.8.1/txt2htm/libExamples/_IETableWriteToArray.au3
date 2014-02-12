; *******************************************************
; Beispiel 1 - &Ouml;ffnet den Browser mit der Beispieltabelle, erh&auml;lt einen Bezug zur zweiten Tabelle
;				auf der Seite(Index 1) und liest deren Intalt in ein 2-dimensionales Array
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 1)
Local $aTableData = _IETableWriteToArray($oTable)

; *******************************************************
; Beispiel 2 - Gleiches Beispiel wie oben, au&szlig;er dass die Zeilen und Spalten im Ausgabearray vertauscht sind und
;				das Ergebnis mit _ArrayDisplay() dargestellt wird
; *******************************************************

#include <IE.au3>
#include <Array.au3>

$oIE = _IE_Example("table")
$oTable = _IETableGetCollection($oIE, 1)
$aTableData = _IETableWriteToArray($oTable, True)
_ArrayDisplay($aTableData)
