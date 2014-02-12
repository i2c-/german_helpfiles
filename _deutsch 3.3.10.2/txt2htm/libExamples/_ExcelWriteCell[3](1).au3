#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Schreibt mit Hilfe einer Schleife Daten in eine Zelle, nachdem eine neue Arbeitsmappe angelegt und deren Objekt-ID ermittelt wurde. Dann werden mit Formeln eingegeben und die Datei gespeichert und geschlossen.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

For $i = 1 To 20 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 1) ; Schreibt den Wert von $i in die Zelle [$i,1]
Next

_ExcelWriteCell($oExcel, "Schnitt:", 3, 3) ; Schreibt in die Zelle [3,3]
_ExcelWriteCell($oExcel, "Summe:", 5, 3) ; Schreibt in die Zelle [5,3]

_ExcelWriteCell($oExcel, "=Mittelwert(A:A)", 3, 4) ; Schreibt die Formel zur Berechnung des Mittelwerts der Daten in die Zelle [3,4] (benutzt die A1-Bezugsart, nicht Z1S1)
_ExcelWriteCell($oExcel, "=Summe(A1:A20)", 5, 4) ; Schreibt die Formel zur Berechnung der Summe der Daten in die Zelle [5,4] (benutzt eine weitere Variante der A1-Bezugsart, nicht Z1S1)

MsgBox($MB_SYSTEMMODAL, "Beenden", "Dr&uuml;cke OK zum Speichern und Beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Jetzt wird ins Temp-Verzeichnis gespeichert; wenn n&ouml;tig, werden bestehende Dateien &uuml;berschrieben
_ExcelBookClose($oExcel) ; Und schlie&szlig;lich machen wir die Mappe wieder zu.
