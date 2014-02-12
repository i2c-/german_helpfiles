#include <IE.au3>
#include <Array.au3>

; &Ouml;ffnet den Browser mit der Beispieltabelle, erh&auml;lt einen Bezug zur zweiten Tabelle auf der Seite(Index 1) und liest deren Intalt in ein 2-dimensionales Array

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 1)
Local $aTableData = _IETableWriteToArray($oTable)

_ArrayDisplay($aTableData)

_IEQuit($oIE)
