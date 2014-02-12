; ***************************************************************
; Beispiel 1 - Nach dem &Ouml;ffnen einer Excel-Arbeitsmappe und dem Erhalt der Objekt-ID werden mittels einer Schleife
; Es werden ein paar Zellen mit Werten gef&uuml;llt und anschlie&szlig;end eine Formel eingetragen.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Excel-Datei und macht diese sichtbar.

For $i = 0 To 20 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 2) ; F&uuml;llt ein paar Zellen mit Werten
Next

_ExcelWriteCell($oExcel, "Schnitt:", 22, 1) ; Schreibt in die Zelle [22,1]
_ExcelWriteFormula($oExcel, "=Mittelwert(Z1S2:Z20S2)", 22, 2) ; Formel f&uuml;r den Mittelwert einf&uuml;gen (benutzt die Z1S1-Bezugsart)


; Es funktioniert aber auch mit _ExcelWriteCell():

; ***************************************************************
; Beispiel 2 - 	Schreibt mit Hilfe einer Schleife Daten in einen Zellbereich. Dann wird eine Formel eingegeben und die Datei gespeichert und geschlossen.
; *****************************************************************

For $i = 1 To 20 ; Schleife
	_ExcelWriteCell($oExcel, $i, $i, 5) ; Schreibt den Wert von $i in die Zelle [$i,5]
Next

_ExcelWriteCell($oExcel, "Schnitt:", 22, 4) ; Schreibt in die Zelle [22,4]

_ExcelWriteCell($oExcel, "=Mittelwert(E1:E20)", 22, 5) ; Schreibt die Formel zur Berechnung des Mittelwerts der Daten in die Zelle [22,5] (benutzt die A1-Bezugsart, nicht Z1S1)


; Aufr&auml;umen
MsgBox(0, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
