; ***************************************************************
; Beispiel 1 - Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Setzt den Namen des aktiven Arbeitsblatts
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

_ExcelSheetNameSet($oExcel, "Beispiel") ; Umbenennen des aktiven Arbeitsblatts

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 2 - Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Zeigt den Namen des aktiven Arbeitsblatts, &auml;ndere ihn und Zeigt den neuen Namen an
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

MsgBox(0, "Arbeitsblatt Name", "Der Name des momentan aktiven Arbeitsblatts ist: " & @CRLF & _ExcelSheetNameGet($oExcel))

_ExcelSheetNameSet($oExcel, "Beispiel") ; Umbenennen des aktiven Arbeitsblatts

MsgBox(0, "Sheet Name", "Nun ist der Namen des aktiven Arbeitsblatts: " & @CRLF & _ExcelSheetNameGet($oExcel))

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
