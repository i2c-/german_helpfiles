; ***************************************************************
; Beispiel 1 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; Erstellt ein Array mit den Namen aller Arbeitsblattname in der Arbeitsmappe und zeige es an
; *****************************************************************

#include <Excel.au3>
#include <Array.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

Local $aArray = _ExcelSheetList($oExcel)
_ArrayDisplay($aArray, "Alle Arbeitsbl&auml;tter in der Arbeitsmappe")

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 2 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; Erstellt ein Array mit allen Arbeitsblattnamen in der Arbeitsmappe und aktiviere jedes Blatt anhand seinem String-Namen
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ; Arbeitet sich r&uuml;ckw&auml;rts durch die Schleife
	_ExcelSheetActivate($oExcel, $aArray[$i]) ; Benutzt die String-Namen, die als Array-Elemente zur&uuml;ckgegeben wurden
	MsgBox(0, "Aktives Blatt", "Das aktive Blatt ist: " & @CRLF & $aArray[$i])
Next

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 3 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; Erstellt ein Array mit allen Arbeitsblattnamen in der Arbeitsmappe und aktiviere jedes Blatt anhand seines Index
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ; Arbeitet sich r&uuml;ckw&auml;rts durch die Schleife
	_ExcelSheetActivate($oExcel, $i) ; Benutzt den Index des Arrays
	MsgBox(0, "Aktives Blatt", "Das aktive Blatt ist: " & @CRLF & $aArray[$i])
Next

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm

; ***************************************************************
; Beispiel 4 – Nach dem &Ouml;ffnen einer Arbeitsmappe und R&uuml;ckgabe des Objekt-Handles:
; Erstellt ein Array mit allen Arbeitsblattnamen in der Arbeitsmappe und aktiviere jedes Blatt anhand seines Index, schreibt das Array in jedes Arbeitsblatt und f&uuml;llt es mit Zufallszahlen
; *****************************************************************

#include <Excel.au3>

$oExcel = _ExcelBookNew() ; Erstellt eine neue Arbeitsmappe und zeigt sie an

$aArray = _ExcelSheetList($oExcel)

For $i = $aArray[0] To 1 Step -1 ; Arbeitet sich r&uuml;ckw&auml;rts durch die Schleife
	_ExcelSheetActivate($oExcel, $i) ; Benutzt den Index des Arrays
	_ExcelWriteArray($oExcel, 1, 1, $aArray, 1) ; Schreibt das Array in das aktive Arbeitsblatt
	; Wir k&ouml;nnen die Zellen mit einer einfachen Schleife mit Zufallszahlen auff&uuml;llen
	For $y = 2 To 10
		For $x = 2 To 10
			_ExcelWriteCell($oExcel, Round(Random(1000, 10000), 0), $x, $y) ; Erzeugt viele Zufallszahlen
		Next
	Next
	MsgBox(0, "Aktives Blatt", "Das aktive Blatt ist: " & @CRLF & $aArray[$i])
Next

MsgBox(0, "Verlassen", "Dr&uuml;cke OK, um die Datei zu speichern und das Programm zu verlassen")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun speichern wir die Datei in ein tempor&auml;res Verzeichnis; existierende Dateien werden dabei &uuml;berschrieben!
_ExcelBookClose($oExcel) ; Zum Abschluss verlassen wir das Programm
