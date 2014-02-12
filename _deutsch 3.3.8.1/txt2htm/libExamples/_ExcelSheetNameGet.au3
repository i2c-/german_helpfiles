; ***************************************************************
; Beispiel 1 – Nach dem &ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers: Ermittelt den Namen des aktiven Arbeitsblatts
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

MsgBox(0, "Arbeitsblatt Namen", "Der Namen des aktiven Arbeitsblatts ist: " & @CRLF & _ExcelSheetNameGet($oExcel))

MsgBox(0, "Verlassen", "Dr&uuml;cke OK um die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss, verlassen wir das Programm

; ***************************************************************
; Beispiel 2 – Nach dem &ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Identifizierers: Hinzuf&uuml;gen eines neuen Arbeitsblatts und R&uuml;ckgabe des Namens
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

MsgBox(0, " Arbeitsblatt Namen ", " Der Namen des aktiven Arbeitsblatts ist: " & @CRLF & _ExcelSheetNameGet($oExcel))

_ExcelSheetAddNew($oExcel, "Neues Arbeitsblatt Beispiel") ; Hinzuf&uuml;gen eines neuen Arbeitsblatts

MsgBox(0, " Arbeitsblatt Namen ", "Der Namen des nun aktiven Arbeitsblatts ist: " & @CRLF & _ExcelSheetNameGet($oExcel))

MsgBox(0, "Verlassen", "Dr&uuml;cke OK um die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; M&ouml;glicherweise werden existierende Dateien dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss, verlassen wir das Programm
