#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Zeigt den Namen des aktiven Arbeitsblatts, &auml;ndere ihn und Zeigt den neuen Namen an

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und macht sie sichtbar

MsgBox($MB_SYSTEMMODAL, "Arbeitsblatt Name", "Der Name des momentan aktiven Arbeitsblatts ist: " & @CRLF & _ExcelSheetNameGet($oExcel))

_ExcelSheetNameSet($oExcel, "Beispiel") ; Umbenennen des aktiven Arbeitsblatts

MsgBox($MB_SYSTEMMODAL, "Sheet Name", "Nun ist der Namen des aktiven Arbeitsblatts: " & @CRLF & _ExcelSheetNameGet($oExcel))

MsgBox($MB_SYSTEMMODAL, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
