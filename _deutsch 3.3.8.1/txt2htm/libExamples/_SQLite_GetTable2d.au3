#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $aResult, $iRows, $iColumns, $iRval

_SQLite_Startup()
If @error Then
	MsgBox(16, "SQLite Fehler", "SQLite.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; &Ouml;ffnet eine DB im Speicher (:memory: database)
If @error Then
	MsgBox(16, "SQLite Fehler", "Kann die Datenbank nicht &ouml;ffnen!")
	Exit -1
EndIf

; Beispieltabelle
; 	Name        | Alter
; 	-----------------------
; 	Alice       | 43
; 	Bob         | 28
; 	Cindy       | 21

If Not _SQLite_Exec(-1, "CREATE TEMP TABLE persons (Name, Age);") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Error", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Alice','43');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Error", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Bob','28');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Error", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Cindy','21');") = $SQLITE_OK Then _
		MsgBox(16, "SQLite Error", _SQLite_ErrMsg())

; Abfrage 1
$iRval = _SQLite_GetTable2d(-1, "SELECT * FROM persons;", $aResult, $iRows, $iColumns)
If $iRval = $SQLITE_OK Then
	_SQLite_Display2DResult($aResult) ; Anzeige des Ergebnisses in der Konsole

;~ 	  $aResult sollte so aussehen:
;~
;~ 	 Name   Age
;~ 	 Alice  43
;~ 	 Bob    28
;~ 	 Cindy  21
;~
Else
	MsgBox(16, "SQLite Fehler: " & $iRval, _SQLite_ErrMsg())
EndIf

; Abfrage 2
$iRval = _SQLite_GetTable2d(-1, "SELECT * FROM persons;", $aResult, $iRows, $iColumns, -1, True)
If $iRval = $SQLITE_OK Then
	_SQLite_Display2DResult($aResult) ; Anzeige des Ergebnisses in der Konsole

;~    Wenn das Anzeigeformat in _SQLite_GetTable2d ge&auml;ndert wird (durch Setzen des Parameters fSwitchDimensions auf True),
;~    werden die Dimensionen vertauscht und das Ergebnis wird so aussehen:
;~
;~ 	 Name  Alice  Bob  Cindy
;~ 	 Age   43     28   21
Else
	MsgBox(16, "SQLite Fehler: " & $iRval, _SQLite_ErrMsg())
EndIf

_SQLite_Close()
_SQLite_Shutdown()
