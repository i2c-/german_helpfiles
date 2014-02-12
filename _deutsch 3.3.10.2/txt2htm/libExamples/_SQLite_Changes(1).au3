#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <MsgBoxConstants.au3>

_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open()
_SQLite_Exec(-1, "CREATE TABLE test (a, b);") ; Erstellt Table
_SQLite_Exec(-1, "INSERT INTO test VALUES ('1', '2');") ; F&uuml;gt Zeile 1 ein
_SQLite_Exec(-1, "INSERT INTO test VALUES ('3', '4');") ; F&uuml;gt Zeile 2 ein
MsgBox($MB_SYSTEMMODAL, "SQLite", "Die letzte Abfrage &auml;nderte " & _SQLite_Changes() & " Zeile." & @CRLF & _
		"Alle Abfragen &auml;nderten " & _SQLite_TotalChanges() & " Zeilen.")
_SQLite_Close()
_SQLite_Shutdown()
