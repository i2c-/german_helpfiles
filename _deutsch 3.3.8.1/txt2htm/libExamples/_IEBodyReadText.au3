; *******************************************************
; Beispiel 1 - &ouml;ffnet einen Browser mit dem basic-Beispiel, lie&szlig;t den body Text
;               (der Inhalt mit allen HTML-Tags entfernt) und zeigt ihn in einer MsgBox
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $sText = _IEBodyReadText($oIE)
MsgBox(0, "Body Text", $sText)
