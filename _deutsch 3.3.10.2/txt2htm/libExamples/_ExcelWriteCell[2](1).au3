#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Schreibt mit Hilfe einer Schleife Daten in eine Zelle, nachdem eine neue Arbeitsmappe angelegt und deren Objekt-ID ermittelt wurde. Dann Speichern und Schlie&szlig;en der Datei.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

For $i = 1 To 20 ; Schleife
	_ExcelWriteCell($oExcel, $i & ".: Ich schrieb in diese Zelle.", $i, 1) ; Schreibt in die Zelle [$i,1]
Next

MsgBox($MB_SYSTEMMODAL, "Beenden", "Dr&uuml;cke OK zum Speichern und Beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Jetzt wird ins Temp-Verzeichnis gespeichert; wenn n&ouml;tig, werden bestehende Dateien &uuml;berschrieben
_ExcelBookClose($oExcel) ; Und schlie&szlig;lich machen wir die Mappe wieder zu.


