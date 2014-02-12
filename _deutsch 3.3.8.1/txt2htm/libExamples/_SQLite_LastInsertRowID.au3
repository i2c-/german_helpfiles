#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <Array.au3>

Local $aResult, $iRows, $iColumns, $iRval

_SQLite_Startup()
If @error Then
	MsgBox(16, "SQLite-Fehler", "SQLite.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; &Ouml;ffnet eine DB im Speicher (:memory: database)
If @error Then
	MsgBox(16, "SQLite-Fehler", "Kann die Datenbank nicht &ouml;ffnen!")
	Exit -1
EndIf

; Beispieltabelle
; 	Name        | Age
; 	-----------------------
; 	Alice       | 43
; 	Bob         | 28
; 	Cindy       | 21

; _SQLite_Exec() und _SQLite_Execute() sind im Prinzip dasselbe
If Not _SQLite_Exec(-1, "CREATE TEMP TABLE persons (Name, Age);") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Alice','43');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Bob','28');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Cindy','21');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Fehler", _SQLite_ErrMsg())

; _SQLite_LastInsertRowID() teilt uns Cindy's Zeile mit
MsgBox(0, "_SQLite_LastInsertRowID()", _SQLite_LastInsertRowID())

; Abfrage
$iRval = _SQLite_GetTable(-1, "SELECT * FROM persons;", $aResult, $iRows, $iColumns)
If $iRval = $SQLITE_OK Then
;~ 	$aResult sollte so aussehen:
;~ 		[0]    = 8
;~ 		[1]    = Name
;~ 		[2]    = Age
;~ 		[3]    = Alice
;~ 		[4]    = 43
;~ 		[5]    = Bob
;~ 		[6]    = 28
;~ 		[7]    = Cindy
;~ 		[8]    = 21
	_ArrayDisplay($aResult, "Abfrageresultat")
Else
	MsgBox(16, "SQLiteFehler: " & $iRval, _SQLite_ErrMsg())
EndIf

_SQLite_Close()
_SQLite_Shutdown()
