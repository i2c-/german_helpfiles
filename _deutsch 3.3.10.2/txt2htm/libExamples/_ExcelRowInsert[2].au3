#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Schreibt in einen Zellbereich unter Verwendung einer Schleife, f&uuml;gt danach Zeilen ein, dann wird gespeichert und die Datei geschlossen.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt in 5 Zellen (vertikale Richtung) die Werte 1 bis 5.
Next

ToolTip("Gleich gibts 3 neue Zeilen...")
Sleep(3500) ; Pause zum Beobachten

_ExcelRowInsert($oExcel, 2, 3) ; F&uuml;gt 3 Zeilen vor Zeile 2 ein.

MsgBox($MB_SYSTEMMODAL, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
