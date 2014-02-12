#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Schreibt in einen Zellbereich unter Verwendung einer Schleife, f&uuml;gt danach eine Spalte ein, dann wird gespeichert und die Datei geschlossen.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt in 5 Zellen (vertikale Richtung) die Werte 1 bis 5.
Next

ToolTip("Gleich gibts 'ne neue Spalte...")
Sleep(3500) ; Pause zum Beobachten

_ExcelColumnInsert($oExcel, 1, 1) ; F&uuml;gt eine Spalte vor Spalte 1 ein

MsgBox($MB_SYSTEMMODAL, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
