#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Setzt die horizontale Ausrichtung der Zellen im Bereich.

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10, $sHorizAlign = "left"

; Wir k&ouml;nnen die Zellen mit einer einfachen Schleife mit Zufallszahlen auff&uuml;llen
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round(Random(1, 100), 0), $i, $j) ; Rundet alle Zufallszahlen in der Datei
	Next
Next

MsgBox($MB_SYSTEMMODAL, "_ExcelHorizontalAlignSet", "Beachte die Ausrichtung" & @CRLF & "Dr&uuml;cke OK um fortzusetzen")

_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox($MB_SYSTEMMODAL, "_ExcelHorizontalAlignSet", "Die Ausrichtung sollte 'links' sein")

$sHorizAlign = "center"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox($MB_SYSTEMMODAL, "_ExcelHorizontalAlignSet", "Die Ausrichtung sollte 'zentriert' sein")

$sHorizAlign = "right"
_ExcelHorizontalAlignSet($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, $sHorizAlign)
MsgBox($MB_SYSTEMMODAL, "_ExcelHorizontalAlignSet", "Die Ausrichtung sollte 'rechts' sein")

MsgBox($MB_SYSTEMMODAL, "Verlassen", "Dr&uuml;cke OK um, die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
