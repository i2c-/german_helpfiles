#include <Excel.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

;H&auml;ngt sich an die erste existierende Instanz von Microsoft Excel wo der Suchstring passt, abh&auml;ngig von dem ausgew&auml;hlten Modus

Local $sFilePath = @TempDir & "\Temp.xls"

If Not _FileCreate($sFilePath) Then ; Erstellt eine .XLS Datei um sich sp&auml;ter an diese anh&auml;ngen zu k&ouml;nnen
	MsgBox($MB_SYSTEMMODAL, "Fehler", " Fehler beim erstellen der Datei - " & @error)
EndIf

_ExcelBookOpen($sFilePath)
Local $oExcel = _ExcelBookAttach("Microsoft Excel - Temp.xls", "Title") ; Mit $s_mode = "Title" ==> titel des Excel-Fensters
_ExcelWriteCell($oExcel, "Falls man dies lesen kann verlief es erfolgreich!", 1, 1) ; Schreibt in eine Zelle
MsgBox($MB_SYSTEMMODAL, "Existiert", "Dr&uuml;cke OK um die Datei zu speichern und anschlie&szlig;end zu beenden")
_ExcelBookClose($oExcel, 1, 0) ; Diese Methode speichert und schlie&szlig;t dann die Datei, ohne die normalen Meldungen, unabh&auml;ngig von &Auml;nderungen
