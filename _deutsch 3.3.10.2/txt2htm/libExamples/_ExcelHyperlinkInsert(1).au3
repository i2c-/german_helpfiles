#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Schreibt einen Hyperlink in eine Zelle.

Local $oExcel = _ExcelBookNew() ; Erzeugt eine neue Mappe, macht sie sichtbar

Local $sLinkText = "AutoIt-Forum" ; Text, der in der Zelle angezeigt wird, &auml;quivalent zu OuterText
Local $sAddress = "http://www.AutoIt.de" ; Aktueller Link, &auml;quivalent zu href
Local $sScreenTip = "AutoIt ist fantastisch! Vergiss das nicht!" ; Der Hinweis, der erscheint, wenn der Mauszeiger auf dem Link verweilt (MouseOver)
_ExcelHyperlinkInsert($oExcel, $sLinkText, $sAddress, $sScreenTip, 1, 2) ; F&uuml;gt den Link in Zeile 1 Spalte 2 ein

MsgBox($MB_SYSTEMMODAL, "Beenden...", "Dr&uuml;cke OK, um die Datei zu speichern und Excel zu beenden.")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Nun wird die Datei in das Temp-Verzeichnis gespeichert. Falls notwendig werden existierende Dateien &uuml;berschrieben.
_ExcelBookClose($oExcel) ; Und zum Schluss schlie&szlig;en wir die Datei.
