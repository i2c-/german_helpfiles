#include <Excel.au3>
#include <MsgBoxConstants.au3>

;&Ouml;ffnet eine neue Excel-Datei und gibt deren Objekt-ID zur&uuml;ck. Dann wird die Datei ohne Warnhinweise gespeichert.

Local $oExcel = _ExcelBookNew()

_ExcelBookSave($oExcel) ; Datei ohne Warnhinweise speichern.
If Not @error Then MsgBox($MB_SYSTEMMODAL, "Erfolgreich", "Die Datei wurde gespeichert!", 3)
