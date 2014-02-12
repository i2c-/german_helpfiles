; ***************************************************************
; Beispiel 1 – Schreibt mit einer Schleife in eine Zelle
; Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers: Formatiere die Zahlen, speichere die Datei und dann schlie&szlig;e die Datei
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

; Wir f&uuml;llen die Zellen in einer einfachen Schleife mit Zufallszahlen
For $y = 1 To 10
	For $x = 1 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ; Viele Zufallszahlen f&uuml;r die Datei
	Next
Next

Local $sFormat = "#.##0,00 €" ; Formatiert die Zellen als String _ExcelNumberFormat, um sie als €-W&auml;hrung anzuzeigen
_ExcelNumberFormat($oExcel, $sFormat, 1, 1, 5, 5) ; Start in Zeile 1, Spalte 1, Ende in Zeile 5, Spalte 5

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 2 - Schreibt mit einer Schleife in eine Zelle
; Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers: Formatiere die Zahlen, speichere die Datei und dann schlie&szlig;e die Datei
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar
Local $aFormatExamples[5] = ["Format-Beispiele:", "Standard", "hh:mm:ss", "#.##0,00 €", "[Rot](#.##0,00 €)"] ; Array f&uuml;r die &Uuml;berschriften und die Format-Strings

For $i = 0 To UBound($aFormatExamples) - 1 ; Verwende eine Schleife, um die &Uuml;berschriften zu schreiben
	_ExcelWriteCell($oExcel, $aFormatExamples[$i], 1, $i + 1) ; $i+1, damit der 0-basierende Index und die Spaltennummer &uuml;bereinstimmen
Next

; Wir f&uuml;llen die Zellen in einer einfachen Schleife mit Zufallszahlen
For $y = 2 To 5 ; Start in Spalte 2
	For $x = 2 To 10
		_ExcelWriteCell($oExcel, Random(1000, 10000), $x, $y) ; Viele Zufallszahlen f&uuml;r die Datei
	Next
Next

ToolTip("Formatiere die Spalten...")
Sleep(3500) ; Pause, damit der Benutzer das Ergebnis betrachten kann

; Wir verwenden eine einfache Schleife zum Formatieren
; Jede Spalte erh&auml;lt ein anderes Format
For $i = 1 To UBound($aFormatExamples) - 1
	_ExcelNumberFormat($oExcel, $aFormatExamples[$i], 2, $i + 1, 11, $i + 1)
Next

$oExcel.Columns.AutoFit ; Anpassen der Spalten, um das Format besser zu sehen
$oExcel.Rows.AutoFit ; Anpassen der Zeilen, um das Format besser zu sehen
ToolTip("Fertig!")

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
