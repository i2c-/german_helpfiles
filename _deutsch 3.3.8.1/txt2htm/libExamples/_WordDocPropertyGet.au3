; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument
;				und liest alle verf&uuml;gbaren Dokumenteigenschaften durch den Index.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
For $i = 1 To 30
	ConsoleWrite("Index der Eigenschaft " & $i & " - " & _WordDocPropertyGet($oDoc, $i) & @CR)
Next

; *******************************************************
; Beispiel 2 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument
;				und liest den Titel, Betreff und Autor des Dokumentes durch den Namen aus.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
$oDoc = _WordDocGetCollection($oWordApp, 0)
ConsoleWrite("Titel - " & _WordDocPropertyGet($oDoc, "Title") & @CRLF)
ConsoleWrite("Betreff - " & _WordDocPropertyGet($oDoc, "Subject") & @CRLF)
ConsoleWrite("Autor - " & _WordDocPropertyGet($oDoc, "Author") & @CRLF)
