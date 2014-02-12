; ***************************************************************
; Beispiel 1 - &Ouml;ffnet eine existierende Excel-Datei und gibt deren Objekt-ID zur&uuml;ck
; *****************************************************************

#include <Excel.au3>

Local $sFilePath1 = @ScriptDir & "\Test1.xls" ; Diese Datei sollte bereits existieren
Local $oExcel = _ExcelBookOpen($sFilePath1)

If @error = 1 Then
	MsgBox(0, "Fehler!", "Das Excel-Objekt konnte nicht erstellt werden")
	Exit
ElseIf @error = 2 Then
	MsgBox(0, "Fehler!", "Die Datei existiert nicht!")
	Exit
EndIf
