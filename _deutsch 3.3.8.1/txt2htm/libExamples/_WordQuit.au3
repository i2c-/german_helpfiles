; *******************************************************
; Beispiel 1 - Erstellt ein unsichtbares Wordfenster, &ouml;ffnet ein
;               Dokument, ermittelt ein paar Informationen und beendet Word
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
; Zeigt den Text innerhalb des Dokuments an
Local $sText = $oWordApp.ActiveDocument.Range.Text
MsgBox(0, "Dokument Text", $sText)
_WordQuit($oWordApp)
