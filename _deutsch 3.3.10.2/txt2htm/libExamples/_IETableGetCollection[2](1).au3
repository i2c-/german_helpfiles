#include <IE.au3>
#include <MsgBoxConstants.au3>

;Erstellt eine Browser-Instanz mit der Beispieltabelle, erh&auml;lt einen Bezug zu der Auflistung der Tabellen und gibt die Anzahl von Tabellen auf der Seite wieder

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE)
Local $iNumTables = @extended
MsgBox($MB_SYSTEMMODAL, "Infos &uuml;ber die Tabellen", "Es gibt " & $iNumTables & " Tabellen auf dieser Seite")

_IEQuit($oIE)
