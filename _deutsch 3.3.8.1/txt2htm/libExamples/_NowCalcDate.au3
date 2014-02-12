#include <Date.au3>

Local $Msg = "Testdaten"
; Schreibt eine Datei ins Skriptverzeichnis, die das Erstellungsdatum in der Form YYYY/MM/DD enth&auml;lt
FileWriteLine("NCD.log", _NowCalcDate() & " :" & $Msg)
