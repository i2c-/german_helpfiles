; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster mit einem neuen leeren Dokument,
;				f&uuml;gt ein zweites leeres Dokument ein und ermittelt eine Sammlung der Dokumente.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate()
_WordDocAdd($oWordApp)
Local $oDocuments = _WordDocGetCollection($oWordApp)
MsgBox(0, "Dokumentenanzahl", @extended)
_WordQuit($oWordApp)
