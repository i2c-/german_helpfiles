; ***************************************************************
; Beispiel 1 - Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:
; Aktiviert ein Arbeitsblatt und verwendet dabei den String seines Namens
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

_ExcelSheetActivate($oExcel, "Tabelle2")

MsgBox(0, "Verlassen", "Beachte: Nun ist Blatt 2 aktiviert und nicht mehr Blatt 1" & @CRLF & @CRLF & "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in eine tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 2 - Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:
; Aktiviert ein Arbeitsblatt und verwendet dabei den Index-Wert des Arbeitsblattes
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

_ExcelSheetActivate($oExcel, 2)

MsgBox(0, "Verlassen", " Beachte: Nun ist Blatt 2 aktiviert und nicht mehr Blatt 1" & @CRLF & @CRLF & "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in eine tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 3 - Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:
; Zeigt die Anzahl der Arbeitsbl&auml;tter an und aktiviert ein Arbeitsblatt, verwendet dabei den Index-Wert des Arbeitsblattes
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

Local $iNumberOfWorksheets = $oExcel.Worksheets.Count

MsgBox(0, "Info", "Anzahl der Arbeitsbl&auml;tter: " & $oExcel.Worksheets.Count)
_ExcelSheetActivate($oExcel, 2)

MsgBox(0, "Verlassen", " Beachte: Nun ist Blatt 2 aktiviert und nicht mehr Blatt 1" & @CRLF & @CRLF & "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
