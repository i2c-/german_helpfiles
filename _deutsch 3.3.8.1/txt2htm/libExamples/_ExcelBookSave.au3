; ***************************************************************
; Beispiel 1 - &Ouml;ffnet eine neue Excel-Datei und gibt deren Objekt-ID zur&uuml;ck. Dann wird die Datei ohne Warnhinweise gespeichert.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew()

_ExcelBookSave($oExcel) ; Datei ohne Warnhinweise speichern.
If Not @error Then MsgBox(0, "Erfolgreich", "Die Datei wurde gespeichert!", 3)
