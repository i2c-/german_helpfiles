; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster mit einem neuen leeren Dokument, f&uuml;gt etwas Text hinzu,
;				f&uuml;hrt eine "Speichern unter"-Operation durch und beendet Word.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.Text = "Dies ist etwas Text, der eingef&uuml;gt werden soll."
_WordDocSaveAs($oDoc, @ScriptDir & "\Test.doc")
_WordQuit($oWordApp)
