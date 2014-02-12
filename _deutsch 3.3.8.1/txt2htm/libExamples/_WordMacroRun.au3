; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument,
;               startet ein Makro Namens "Mein Makro" mit einem
;				Argument "Test" und beendet Word ohne dass die &Auml;nderungen gespeichert werden.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
_WordMacroRun($oWordApp, "Mein Makro", "Test")
_WordQuit($oWordApp, 0)
