; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument, setzt den Text,
;				druckt mit den Standardeinstellungen und schlie&szlig;t Word ohne die &Auml;nderungen zu speichern.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.Text = "Dies ist der Text, der gedruckt werden soll."
_WordDocPrint($oDoc)
_WordQuit($oWordApp, 0)

; *******************************************************
; Beispiel 2 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument, setzt den Text,
;				druckt im Querformat und schlie&szlig;t Word ohne die &Auml;nderungen zu speichern.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.Text = "Dies ist der Text, der gedruckt werden soll."
_WordDocPrint($oDoc, 0, 1, 1)
_WordQuit($oWordApp, 0)

; *******************************************************
; Beispiel 3 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument, setzt den Text,
;				druckt auf einem Drucker namens "Mein Drucker" und schlie&szlig;t Word ohne die &Auml;nderungen zu speichern.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.Text = "Dies ist der Text der gedruckt werden soll."
_WordDocPrint($oDoc, 0, 1, 0, 1, "Mein Drucker")
_WordQuit($oWordApp, 0)
