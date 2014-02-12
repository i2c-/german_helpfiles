;&Ouml;ffnet ein neues Excel-Fenster und schlie&szlig;t es (mit den Standardparametern)

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ; Erstellt ein Microsoft Excel-Fenster
_ExcelBookClose($oExcel, 0) ; Diese Methode bewirkt entweder : 1) Schlie&szlig;en der Datei oder 2) falls eine &Auml;nderung im Excel Fenster gemacht wurde, erscheint ein Hinweis
