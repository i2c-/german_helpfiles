; *******************************************************
; Beispiel 1 - Erstellt ein leeres Word-Fenster und &ouml;ffnet ein existierendes Dokument
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate("")
Local $oDoc = _WordDocOpen($oWordApp, @ScriptDir & "\Test.doc")
