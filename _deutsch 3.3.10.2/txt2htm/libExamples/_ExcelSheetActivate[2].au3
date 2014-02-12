#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers:
; Zeigt die Anzahl der Arbeitsbl&auml;tter an und aktiviert ein Arbeitsblatt, verwendet dabei den Index-Wert des Arbeitsblattes

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

Local $iNumberOfWorksheets = $oExcel.Worksheets.Count

MsgBox($MB_SYSTEMMODAL, "Info", "Anzahl der Arbeitsbl&auml;tter: " & $oExcel.Worksheets.Count)
_ExcelSheetActivate($oExcel, 2)

MsgBox($MB_SYSTEMMODAL, "Verlassen", " Beachte: Nun ist Blatt 2 aktiviert und nicht mehr Blatt 1" & @CRLF & @CRLF & "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis. M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
