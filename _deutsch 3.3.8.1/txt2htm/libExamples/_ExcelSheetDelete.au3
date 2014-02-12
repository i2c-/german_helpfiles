; ***************************************************************
; Beispiel 1 – Nach dem &ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:  L&ouml;sche ein, durch seinen Namen festgelegtes Arbeitsblatt
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

_ExcelSheetDelete($oExcel, "Sheet1") ; L&ouml;scht das, durch seinen Namen festgelegte Arbeitsblatt

MsgBox(0, "Verlassen", "Dr&uuml;cke OK um die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss, verlassen wir das Programm

; ***************************************************************
; Beispiel 2 – Nach dem &ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers: L&ouml;sche ein, durch seinen Index festgelegtes Arbeitsblatt
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

_ExcelSheetDelete($oExcel, 1) ; L&ouml;scht das, durch seinen Index festgelegte Arbeitsblatt

MsgBox(0, "Verlassen", "Dr&uuml;cke OK um die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss, verlassen wir das Programm
