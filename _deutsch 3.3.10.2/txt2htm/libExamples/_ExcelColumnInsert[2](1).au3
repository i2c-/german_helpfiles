#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Schreibt in einen Zellbereich unter Verwendung einer Schleife, f&uuml;gt danach Spalten ein, dann wird gespeichert und die Datei geschlossen.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

; Man kann ein paar Zellen mit einer einfachen Schleife und Zufallszahlen ausf&uuml;llen.
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Random(1, 100, 1), $i, $j) ; Integer-Zufallszahlen von 1 bis 99
	Next
Next

ToolTip("Gleich gibts neue Spalten...")
Sleep(3500) ; Pause zum Beobachten

_ExcelColumnInsert($oExcel, 2, 3) ; F&uuml;gt 3 Spalten vor Spalte 2 ein

MsgBox($MB_SYSTEMMODAL, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
