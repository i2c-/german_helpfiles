; ***************************************************************
; Beispiel 1 - Schreibt in eine Zelle unter Verwendung einer Schleife, liest die Zellen in ein Array ein, zeigt dieses an, dann wird gespeichert und die Datei geschlossen.
; *****************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar.

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt in 5 Zellen (vertikale Richtung) die Werte 1 bis 5.
Next

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, Asc($i), 1, $i + 2) ; Schreibt in 5 Zellen (horizontale Richtung) die Werte 1 bis 5. Asc() wird nur benutzt, um unterscheidbare Werte beim Einlesen zu erhalten.
Next

Local $aArray1 = _ExcelReadArray($oExcel, 1, 1, 5, 1) ; Senkrecht (vertikal)
Local $aArray2 = _ExcelReadArray($oExcel, 1, 3, 5) ; Waagerecht (horizontal)
_ArrayDisplay($aArray2, "Waagerecht")
_ArrayDisplay($aArray1, "Senkrecht")

MsgBox(0, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
