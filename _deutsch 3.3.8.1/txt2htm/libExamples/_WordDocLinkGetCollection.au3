; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster mit einem neuen leeren Dokument,
;				f&uuml;gt einen Link hinzu und ermittelt dann eine Sammlung der Links
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
_WordDocAddLink($oDoc, "", "www.AutoIt3.com", "", "AutoIt" & @CRLF, "Link zu AutoIt")
Local $oLinks = _WordDocLinkGetCollection($oDoc)
MsgBox(0, "Anzahl der Links", @extended)
