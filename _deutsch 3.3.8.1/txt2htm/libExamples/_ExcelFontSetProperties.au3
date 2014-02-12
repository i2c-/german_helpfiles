; *****************************************************************
; Beispiel 1 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Setzt die Schrifteigenschaft in einem Bereich.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an
Local $sRangeOrRowStart = 1, $iColStart = 1, $iRowEnd = 10, $iColEnd = 10
Local $fBold, $fItalic, $fUnderline, $i = 1

; Wir k&ouml;nnen die Zellen mit einer einfachen Schleife mit Zufallszahlen auff&uuml;llen
For $i = 1 To 10
	For $j = 1 To 10
		_ExcelWriteCell($oExcel, Round(Random(1, 100), 0), $i, $j) ; Rundet alle Zufallszahlen in der Datei
	Next
Next

MsgBox(0, "_ExcelFontSetProperties", "Beachte die Schrifteigenschaften, es werden nacheinander alle m&ouml;glichen Kombinationen angezeigt!" & @CRLF & @CRLF & "Dr&uuml;cke OK, um zu beginnen.")
$i = 1
_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, False)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, False, True)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, False)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, False, True, True)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, False, False)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, False, True)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, True, False)
ToolTip("Neue Schriftart-Einstellung: " & $i)
$i += 1
Sleep(2500)

_ExcelFontSetProperties($oExcel, $sRangeOrRowStart, $iColStart, $iRowEnd, $iColEnd, True, True, True)
ToolTip("Neue Schriftart-Einstellung: " & $i)

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
