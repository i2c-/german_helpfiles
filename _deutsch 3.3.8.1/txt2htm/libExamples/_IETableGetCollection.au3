; *******************************************************
; Beispiel 1 - Erstellt eine Browser-Instanz mit der Beispieltabelle, erh&auml;lt einen Bezug zur ersten Tabelle
;				auf der Seite(Index 0) und liest deren Inhalt in ein 2-dimensionales Array
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 0)
Local $aTableData = _IETableWriteToArray($oTable)

; *******************************************************
; Beispiel 2 - Erstellt eine Browser-Instanz mit der Beispieltabelle, erh&auml;lt einen Bezug zu der
;				Auflistung der Tabellen und gibt die Anzahl von Tabellen auf der Seite wieder
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("table")
$oTable = _IETableGetCollection($oIE)
Local $iNumTables = @extended
MsgBox(0, "Infos &uuml;ber die Tabellen", "Es gibt " & $iNumTables & " Tabellen auf dieser Seite")
