#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:  Verschiebt ein Arbeitsblatt und benutzt den String-Namen des Arbeitsblatts

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an
_ExcelSheetMove($oExcel, "Blatt2") ; Verschiebt das zweite Blatt an die erste Position  (String/Namen basierend)
MsgBox($MB_SYSTEMMODAL, "Verlassen", "Beachte: Blatt2 befindet sich jetzt an der ersten Position" & @CRLF & @CRLF & "Dr&uuml;cke nun OK um, die Datei zu Speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

