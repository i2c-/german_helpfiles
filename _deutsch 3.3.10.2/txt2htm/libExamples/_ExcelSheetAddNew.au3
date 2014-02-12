#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:  Hinzuf&uuml;gen eines neuen Arbeitsblatts

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar

_ExcelSheetAddNew($oExcel, "Neues Arbeitsblatt Beispiel")

MsgBox($MB_SYSTEMMODAL, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!

_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
