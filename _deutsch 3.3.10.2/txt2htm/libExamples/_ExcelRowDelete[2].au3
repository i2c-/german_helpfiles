#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &Ouml;ffnen einer Excel-Datei und dem Erhalt der Objekt-ID wird in eine Zelle unter Verwendung einer Schleife geschrieben. L&ouml;scht ein paar Zeilen, dann wird gespeichert und die Datei geschlossen.

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar.

For $i = 1 To 5 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt in 5 Zellen (vertikale Richtung) die Werte 1 bis 5.
Next

ToolTip("Die Zeilen 3 und 4 werden bald gel&ouml;scht...")
Sleep(3500)
ToolTip("")
_ExcelRowDelete($oExcel, 3, 2) ; L&ouml;scht Zeilen, beginnend bei Zeile 3, Anzahl: 2 Zeilen.

MsgBox($MB_SYSTEMMODAL, "Beenden", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
