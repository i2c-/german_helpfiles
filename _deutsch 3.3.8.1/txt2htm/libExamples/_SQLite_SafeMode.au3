#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CR)
_SQLite_SafeMode(False)
_SQLite_Exec(-1, "CREATE tblTest (a,b,c);"); Keine Datenbank ge&ouml;ffnet, SQLite st&uuml;rzt ab, weil SafeMode = false
_SQLite_Shutdown()
