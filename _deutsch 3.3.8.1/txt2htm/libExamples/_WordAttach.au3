; *******************************************************
; Beispiel 1 - H&auml;ngt eine Datei an ein Word-Fenster mit der ge&ouml;ffneten Datei namens "Test.doc" an
;				und zeigt dann den kompletten Dateipfad des Dokuments.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordAttach("Test.doc", "FileName")
If Not @error Then
	Local $oDoc = _WordDocGetCollection($oWordApp, 0)
	MsgBox(64, "Dokument Dateiname", $oDoc.FullName)
EndIf

; *******************************************************
; Beispiel 2 - H&auml;ngt eine Datei an ein Word-Fenster mit dem Text
;             "Der schnelle braune Fuchs" im Dokument an
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordAttach("Der schnelle braune Fuchs", "Text")
