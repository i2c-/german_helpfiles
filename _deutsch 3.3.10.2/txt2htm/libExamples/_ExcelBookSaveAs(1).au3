#include <Excel.au3>
#include <MsgBoxConstants.au3>

;&Ouml;ffnet eine existierende Excel-Datei und gibt deren Objekt-ID zur&uuml;ck. Dann wird die Datei unter einem neuen Namen ohne Warnmeldungen gespeichert.

Local $sFilePath1 = @ScriptDir & "\Test1.xls" ; Diese Datei sollte bereits existieren
Local $oExcel = _ExcelBookOpen($sFilePath1)

; Fehler, die w&auml;hrend des &Ouml;ffnens der Datei auftreten, anzeigen
If @error = 1 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler!", "Das Excel-Objekt konnte nicht erstellt werden.")
	Exit
ElseIf @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler!", "Die Datei existiert nicht.")
	Exit
EndIf

_ExcelBookSaveAs($oExcel, @ScriptDir & "\SaveAsExample", "xls")
If Not @error Then MsgBox($MB_SYSTEMMODAL, "Erfolgreich!", "Die Datei wurde gespeichert.", 3)
_ExcelBookClose($oExcel, 1, 0) ; Die Datei wird gespeichert und geschlossen (ohne Warnmeldungen und ohne R&uuml;cksicht auf &Auml;nderungen)
