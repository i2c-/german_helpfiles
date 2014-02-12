#include <Excel.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

; Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; Erstellt ein Array mit allen Arbeitsblattnamen in der Arbeitsmappe und aktiviere jedes Blatt anhand seinem String-Namen

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ; Arbeitet sich r&uuml;ckw&auml;rts durch die Schleife
	_ExcelSheetActivate($oExcel, $aArray[$i]) ; Benutzt die String-Namen, die als Array-Elemente zur&uuml;ckgegeben wurden
	MsgBox($MB_SYSTEMMODAL, "Aktives Blatt", "Das aktive Blatt ist: " & @CRLF & $aArray[$i])
Next

MsgBox($MB_SYSTEMMODAL, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

