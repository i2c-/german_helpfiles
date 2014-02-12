;&Ouml;ffnet ein neues Excel Fenster und schlie&szlig;t es (mit den Standardparametern)

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt ein Microsoft Excel-Fenster
_ExcelBookClose($oExcel, 1, 0) ; Diese Methode speichert und schlie&szlig;t die Datei ohne die normalen Meldungen, egal ob &Auml;nderungen gemacht wurden oder nicht
