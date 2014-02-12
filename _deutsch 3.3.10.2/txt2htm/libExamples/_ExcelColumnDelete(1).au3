#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &ouml;ffnen einer Excel-Datei und dem Erhalt der Objekt-ID wird in eine Zelle unter Verwendung einer Schleife geschrieben. Spalte 1 wird gel&ouml;scht, dann wird gespeichert und die Datei geschlossen.

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar.

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, $i, 1, $i) ; Schreibt in 5 Zellen (horizontale Richtung) die Werte 1 bis 5.
Next

ToolTip("Die Spalte 1 wird bald gel&ouml;scht...")
Sleep(3500)

_ExcelColumnDelete($oExcel, 1, 1) ; L&ouml;scht Spalte 1

MsgBox($MB_SYSTEMMODAL, "Beenden", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
