#include <IE.au3>
#include <MsgBoxConstants.au3>

; &Ouml;ffnet einen Browser mit dem basic-Beispiel, lie&szlig;t den body Text (der Inhalt mit allen HTML-Tags entfernt) und zeigt ihn in einer MsgBox.

Local $oIE = _IE_Example("basic")
Local $sText = _IEBodyReadText($oIE)
MsgBox($MB_SYSTEMMODAL, "Body Text", $sText)
_IEQuit($oIE)
