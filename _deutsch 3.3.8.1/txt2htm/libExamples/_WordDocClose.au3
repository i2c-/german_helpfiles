; *******************************************************
; Beispiel 1 - Erstellt ein leeres Word-Fenster, &ouml;ffnet ein existierendes Dokument,
;				schlie&szlig;t das Dokument und beendet Word.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate("")
Local $oDoc = _WordDocOpen($oWordApp, @ScriptDir & "\Test.doc")
_WordDocClose($oDoc)
_WordQuit($oWordApp)
