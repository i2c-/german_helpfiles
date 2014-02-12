#include <IE.au3>
#include <Array.au3>

; Erstellt eine Browser-Instanz mit der Beispieltabelle, erh&auml;lt einen Bezug zur ersten Tabelle auf der Seite(Index 0) und liest deren Inhalt in ein 2-dimensionales Array

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 0)
Local $aTableData = _IETableWriteToArray($oTable)

_ArrayDisplay($aTableData)

_IEQuit($oIE)
