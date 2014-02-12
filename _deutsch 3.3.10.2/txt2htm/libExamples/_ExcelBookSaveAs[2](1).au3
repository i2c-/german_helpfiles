#include <Excel.au3>
#include <MsgBoxConstants.au3>

; &Ouml;ffnet eine existierende Excel-Datei und gibt deren Objekt-ID zur&uuml;ck. Dann wird die Datei unter einem neuen Namen ohne auftretende Meldungen gespeichert.
; Die Datei wird &uuml;berschrieben falls sie bereits existiert. Au&szlig;erdem wird die Datei mit einem Passwort gesch&uuml;tzt. Dann wird die Datei ge&ouml;ffnet, um die Passwortabfrage zu demonstrieren.

Local $sFilePath1 = @ScriptDir & "\Test1.xls" ; Diese Datei sollte bereits existieren
Local $oExcel = _ExcelBookOpen($sFilePath1)

; Fehler, die w&auml;hrend des &Ouml;ffnens der Datei auftreten, anzeigen
If @error = 1 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler!", "Das Excel-Objekt konnte nicht erstellt werden")
	Exit
ElseIf @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler!", "Die Datei existiert nicht")
	Exit
EndIf

; Die Datei wird gespeichert und geschlossen (ohne Warnmeldungen und ohne R&uuml;cksicht auf &Auml;nderungen):
_ExcelBookSaveAs($oExcel, @ScriptDir & "\SaveAsExample2", "xls", 0, 1, "Geheim") ; Speichert die Datei unter dem Namen "SaveAsExample2.xls" mit dem PW "Geheim" ab.
If Not @error Then MsgBox($MB_SYSTEMMODAL, "Erfolgreich!", "Die Datei wurde gespeichert.", 3)
_ExcelBookClose($oExcel, 1, 0) ;Diese Methode speichert die Datei. Anschlie&szlig;end wird die Datei ohne Meldung geschlossen

$oExcel = _ExcelBookOpen(@ScriptDir & "\SaveAsExample2.xls", 1, False) ; Es wird die Datei ge&ouml;ffnet, um die Passwortabfrage zu demonstrieren.
