; ***************************************************************
; Beispiel 1 - Schreibt in eine Zelle, liest die Zelle dann aus und zeigt den Wert an, dann wird gespeichert und die Datei geschlossen.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

_ExcelWriteCell($oExcel, "AutoIt", 1, 1) ; Schreibt in die Zelle [1,1]
Local $sCellValue = _ExcelReadCell($oExcel, 1, 1)
MsgBox(0, "", "Der Zellwert ist: " & @CRLF & $sCellValue, 2) ; Anzeige max. 2 Sekunden

MsgBox(0, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.

; ***************************************************************
; Beispiel 2 - Schreibt in einen Zellbereich unter Verwendung einer Schleife, liest die Zellen dann aus, zeigt diese an, dann wird gespeichert und die Datei geschlossen.
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

For $i = 1 To 5 ; Schleife 1
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt in die Zelle [$i,1]
Next

For $i = 1 To 5 ; Schleife 2
	$sCellValue = _ExcelReadCell($oExcel, $i, 1) ; Zelle [$i,1] auslesen
	MsgBox(0, "", "Der Zellwert ist: " & @CRLF & $sCellValue, 2) ; Anzeige max. 2 Sekunden
Next

MsgBox(0, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
