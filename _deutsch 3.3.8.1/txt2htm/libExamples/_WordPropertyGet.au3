; *******************************************************
; Beispiel 1 - Erstellt ein Word-Fenster, &ouml;ffnet ein Dokument, pr&uuml;ft ob die
;               Statusbar sichtbar ist, wenn ja wird sie ausgeblendet, falls nicht, wird sie eingeblendet.
; *******************************************************
;
#include <Word.au3>

Local $oWordApp = _WordCreate(@ScriptDir & "\Test.doc")
If _WordPropertyGet($oWordApp, "statusbar") Then
	MsgBox(0, "StatusBar Status", "StatusBar sichtbar, sie wird ausgeschaltet.")
	_WordPropertySet($oWordApp, "statusbar", False)
Else
	MsgBox(0, "StatusBar Status", "StatusBar unsichtbar, sie wird angeschaltet.")
	_WordPropertySet($oWordApp, "statusbar", True)
EndIf
