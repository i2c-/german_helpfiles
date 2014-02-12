#include <Excel.au3>
#include <MsgBoxConstants.au3>
;– Nach dem &ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:  Deklariere ein 2-D Array, und f&uuml;gt Daten in diese Array


Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

; Deklarieren des Arrays (und einf&uuml;gen von Daten)
Local $aArray[5][2] = [["LocoDarwin", 1],["Jon", 2],["big_daddy", 3],["DaleHolm", 4],["GaryFrost", 5]] ; 0-basierendes Array
_ExcelWriteSheetFromArray($oExcel, $aArray, 1, 1, 0, 0) ; 0-basierende Array Parameter

MsgBox($MB_SYSTEMMODAL, "Verlassen", "Dr&uuml;cke OK um die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss, verlassen wir das Programm
