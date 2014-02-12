; *******************************************************
; Beispiel 1 - &Ouml;ffnet ein existierendes Word-Dokument, f&uuml;gt etwas Text hinzu,
;				speichert es ab und beendet Word.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.insertAfter("Dies ist etwas Text, der eingef&uuml;gt wird.")
_WordDocSave($oDoc)
_WordQuit($oWordApp)
