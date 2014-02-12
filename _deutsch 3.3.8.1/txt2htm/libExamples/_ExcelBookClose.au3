; ***************************************************************
; Beispiel 1 - &Ouml;ffnet ein neues Excel-Fenster und schlie&szlig;t es (mit den Standardparametern)
; *****************************************************************

#include <Excel.au3>
Local $oExcel = _ExcelBookNew() ; Erstellt ein Microsoft Excel-Fenster
_ExcelBookClose($oExcel) ; Standardm&auml;&szlig;ig speichert die Speichermethode die Datei in dem Ordner "Eigene Dateien"

; ***************************************************************
; Beispiel 2 - &Ouml;ffnet ein neues Excel-Fenster und schlie&szlig;t es (mit den Standardparametern)
; *****************************************************************
#include <Excel.au3>
$oExcel = _ExcelBookNew() ; Erstellt ein Microsoft Excel-Fenster
_ExcelBookClose($oExcel, 0) ; Diese Methode bewirkt entweder : 1) Schlie&szlig;en der Datei oder 2) falls eine &Auml;nderung im Excel Fenster gemacht wurde, erscheint ein Hinweis

; ***************************************************************
; Beispiel 3 - &Ouml;ffnet ein neues Excel Fenster und schlie&szlig;t es (mit den Standardparametern)
; *****************************************************************
#include <Excel.au3>
$oExcel = _ExcelBookNew() ; Erstellt ein Microsoft Excel-Fenster
_ExcelBookClose($oExcel, 1, 0) ; Diese Methode speichert und schlie&szlig;t die Datei ohne die normalen Meldungen, egal ob &Auml;nderungen gemacht wurden oder nicht
