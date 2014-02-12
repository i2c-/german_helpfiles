; *******************************************************
; Beispiel 1 - Erstellt ein Microsoft Word-Fenster und &ouml;ffnet eine Datei
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")

; *******************************************************
; Beispiel 2 - Versucht eine Datei an ein vorhandenes Word-Fenster mit dem angegebenen ge&ouml;ffneten Dokument anzuh&auml;ngen.
;               Erstellt ein neues Word-Fenster und &ouml;ffnet eine Datei, falls diese nicht schon existiert.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 1)
; Pr&uuml;ft den R&uuml;ckgabewert @extended, um zu sehen, ob das Anh&auml;ngen erfolgreich war
If @extended Then
	MsgBox(0, "", "An das vorhandene Fenster angeh&auml;ngt")
Else
	MsgBox(0, "", "Neues Fenster erstellt")
EndIf

; *******************************************************
; Beispiel 3 - Erstellt ein Word-Fenster mit einem neuen leeren Dokument
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate()

; *******************************************************
; Beispiel 4 - Erstellt ein unsichtbares Word-Fenster, &ouml;ffnet ein Dokument,
;               f&uuml;gt etwas Text hinzu, speichert die &Auml;nderungen und schlie&szlig;t Word.
; *******************************************************
;
#include <Word.au3>
$oWordApp = _WordCreate(@ScriptDir & "\Test.doc", 0, 0)
Local $oDoc = _WordDocGetCollection($oWordApp, 0)
$oDoc.Range.insertAfter("Dies ist etwas Text, der eingef&uuml;gt werden soll.")
_WordQuit($oWordApp, -1)
