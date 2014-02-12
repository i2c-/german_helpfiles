; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument,
;				versteckt das Fenster und macht es dann wieder sichtbar.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Sleep(2000)
_WordPropertySet($oWordApp, "visible", False)
Sleep(2000)
_WordPropertySet($oWordApp, "visible", True)
