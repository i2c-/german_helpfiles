#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <MsgBoxConstants.au3>

Local $aRow
_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; &Ouml;ffnet eine DB im Speicher (:memory: database)
_SQLite_Exec(-1, "CREATE TEMP TABLE Einstellungen (Schl&uuml;ssel,Wert);")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schl&uuml;ssel,Wert) VALUES ('1','Erste Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schl&uuml;ssel,Wert) VALUES ('2','Zweite Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schl&uuml;ssel,Wert) VALUES ('3','Dritte Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schl&uuml;ssel,Wert) VALUES ('4','Vierte Einstellung');")
_SQLite_QuerySingleRow(-1, "SELECT Wert FROM Einstellungen WHERE Schl&uuml;ssel = '2' LIMIT 1;", $aRow) ; W&auml;hlt eine einzelne Zeile und ein einzelnes Feld!
MsgBox($MB_SYSTEMMODAL, "2. Einstellung:", $aRow[0])
_SQLite_Close()
_SQLite_Shutdown()
