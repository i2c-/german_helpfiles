#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

;; Beispieltabelle
; 	Name        | Age
; 	-----------------------
; 	Alice       | 43
; 	Bob         | 28
; 	Cindy       | 21

If Not _SQLite_Exec(-1, "CREATE TEMP TABLE persons (Name, Age);") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite-Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Alice','43');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite-Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Bob','28');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite-Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Cindy','21');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite-Fehler", _SQLite_ErrMsg())

; Abfrage
$iRval = _SQLite_GetTable(-1, "SELECT * FROM persons;", $aResult, $iRows, $iColumns)
If $iRval = $SQLITE_OK Then
;~ 	$aResult wird so aussehen:
;~ 		[0]    = 8
;~ 		[1]    = Name
;~ 		[2]    = Age
;~ 		[3]    = Alice
;~ 		[4]    = 43
;~ 		[5]    = Bob
;~ 		[6]    = 28
;~ 		[7]    = Cindy
;~ 		[8]    = 21
	_ArrayDisplay($aResult, "Abfrageergebnis")
Else
	MsgBox($MB_SYSTEMMODAL, "SQLite-Fehler: " & $iRval, _SQLite_ErrMsg())
EndIf

_SQLite_Close()
_SQLite_Shutdown()
