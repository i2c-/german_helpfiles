; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument
;				und setzt dann die Eigenschaften Titel, Betreff und Autor.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
_WordDocPropertySet($oDoc, "Title", "Test Titel")
_WordDocPropertySet($oDoc, "Subject", "Test Betreff")
_WordDocPropertySet($oDoc, "Author", "Test Autor")
