#include <Excel.au3>
#include <MsgBoxConstants.au3>

;Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles: Verschiebt ein Arbeitsblatt und benutzt dabei den Index Wert des Blatts

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

; Hinzuf&uuml;gen eines weiteren Arbeitsblatts und ordne sie an
Local $sSheetName4 = "Blatt4"
Local $sSheetName5 = "Blatt5"
_ExcelSheetAddNew($oExcel, $sSheetName4) ; Hinzuf&uuml;gen eines weiteren Arbeitsblatts
_ExcelSheetMove($oExcel, $sSheetName4, 4, False) ; Verschiebt $sSheetName4 an die vierte Position (False, f&uuml;gt das Blatt hinter dem relativen Blatt ein)

_ExcelSheetAddNew($oExcel, $sSheetName5) ; Hinzuf&uuml;gen eines weiteren Arbeitsblatts
_ExcelSheetMove($oExcel, $sSheetName5, 5, False) ; Verschiebt $sSheetName4 an die f&uuml;nfte Position (False, f&uuml;gt das Blatt hinter dem relativen Blatt ein)

MsgBox($MB_SYSTEMMODAL, "Anzeige", "Beachte die Reihenfolge der Arbeitsbl&auml;tter" & @CRLF & @CRLF & "Dr&uuml;cke OK um fortzufahren")

_ExcelSheetMove($oExcel, $sSheetName5, "Blatt3", True) ; Verschiebt das f&uuml;nfte Blatt zur relativen Position vor: 'Blatt3'
MsgBox($MB_SYSTEMMODAL, "Verlassen", "'" & $sSheetName5 & "'" & " wenn der $fBefore-Parameter True ist (Relative zu 'Blatt3')" & @CRLF & @CRLF & "Dr&uuml;cke OK um, die Datei zu Speichern und das Programm zu verlassen")
_ExcelSheetMove($oExcel, $sSheetName5, "Blatt3", False) ; Verschiebt das f&uuml;nfte Blatt zur relativen Position vor: 'Blatt3'
MsgBox($MB_SYSTEMMODAL, "Verlassen", "'" & $sSheetName5 & "'" & " wenn der $fBefore-Parameter False ist (Relative zu 'Blatt3')" & @CRLF & @CRLF & "Dr&uuml;cke OK um, die Datei zu Speichern und das Programm zu verlassen")

_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei, in eine tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
