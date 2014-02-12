; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument, sucht nach "dies",
;				ersetzt alle Vorkommnisse mit "DIES", schlie&szlig;t Word ohne die &Auml;nderungen zu speichern.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
Local $oFind = _WordDocFindReplace($oDoc, "dies", "DIES")
If $oFind Then
	MsgBox(0, "Suchbegriff", "Gefunden und Ersetzt.")
Else
	MsgBox(0, "Suchbegriff", "Nicht gefunden")
EndIf
_WordQuit($oWordApp, 0)
