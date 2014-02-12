; ***************************************************************
; Beispiel 1 - Nach dem &Ouml;ffnen einer Excel-Datei und dem Erhalt der Objekt-ID wird ein Array deklariert und dieses in die Tabelle eingetragen, dann wird gespeichert und die Datei geschlossen.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar.

; Deklaration des Arrays
Local $aArray[5] = ["LocoDarwin", "Jon", "big_daddy", "DaleHolm", "GaryFrost"]

_ExcelWriteArray($oExcel, 1, 1, $aArray) ; Schreibt das Array in horizontaler Richtung.
_ExcelWriteArray($oExcel, 5, 1, $aArray, 1) ; Schreibt das Array in vertikaler Richtung, beginnend mit Zeile 5.

MsgBox(0, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
