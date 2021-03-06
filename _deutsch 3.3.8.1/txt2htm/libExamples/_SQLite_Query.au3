#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $hQuery, $aRow, $sMsg
_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; &Ouml;ffne :memory: Datenbank
_SQLite_Exec(-1, "CREATE TABLE aTest (a,b,c);") ; Erzeugt Tabelle
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('c','2','Welt!');") ; F&uuml;gt Daten ein
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('b','3',' ');") ; F&uuml;gt Daten ein
_SQLite_Exec(-1, "INSERT INTO aTest(a,b,c) VALUES ('a','1','Hallo');") ; F&uuml;gt Daten ein
_SQLite_Query(-1, "SELECT c FROM aTest ORDER BY a;", $hQuery) ; Abfrage der 3. Spalte, sortiert nach der 1. Spalte
While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
	$sMsg &= $aRow[0]
WEnd
_SQLite_Exec(-1, "DROP TABLE aTest;") ; Entferne die Tabelle
MsgBox(0, "SQLite", "Durch Abfrage ermittelte Daten: " & @CR & @CR & $sMsg)
_SQLite_Close()
_SQLite_Shutdown()

;~ Ausgabe:
;~
;~ Hallo Welt!
