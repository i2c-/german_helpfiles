;***************************************************************************
; Beispiel 1 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; F&uuml;llt die Zellen mit Zufallszahlen und liest die Zahlen (Werte) in ein Array ein. Dabei werden verschiedene Parameter verwendet
;***************************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

; Wir k&ouml;nnen die Zellen mit einer einfachen Schleife mit Zufallszahlen auff&uuml;llen
For $y = 1 To 10 ; Start in Spalte 1
	For $x = 1 To 15
		_ExcelWriteCell($oExcel, Round(Random(1000, 10000), 0), $x, $y) ; Erzeugt viele Zufallszahlen
	Next
Next

Local $aArray = _ExcelReadSheetToArray($oExcel) ; Benutzt die vorgegebenen Parameter
_ArrayDisplay($aArray, "Das Array benutzt die vorgegebenen Parameter")
$aArray = _ExcelReadSheetToArray($oExcel, 2) ; Startet in der zweiten Zeile
_ArrayDisplay($aArray, "Startet in der zweiten Zeile")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 2) ; Startet in der zweiten Spalte

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 5) ; Liest f&uuml;nf Zeilen
_ArrayDisplay($aArray, "Liest f&uuml;nf Zeilen")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 2) ; Liest zwei Spalten
_ArrayDisplay($aArray, "Liest zwei Spalten")

$aArray = _ExcelReadSheetToArray($oExcel, 2, 3, 4, 5) ; Startet in der zweiten Zeile der dritten Spalte, liest vier Zeilen und f&uuml;nf Spalten
MsgBox(0, 'Fehler', "@error: " & @error & @TAB & " @extended: " & @extended)
_ArrayDisplay($aArray, "Startet in der zweiten Zeile der dritten Spalte, liest vier Zeilen und f&uuml;nf Spalten")

$aArray = _ExcelReadSheetToArray($oExcel, 1, 1, 0, 0, True) ; Benutzt die vorgegebenen Parameter, au&szlig;er bei verschobenen Spalten (True)
_ArrayDisplay($aArray, "Array mit den verschobenen Spalten")

MsgBox(0, "Verlassen", "OK dr&uuml;cken, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
