#include <IE.au3>

; &Ouml;ffnet eine Browser-Instanz mit dem Grundbeispiel, pr&uuml;ft ob die Statusbar sichtbar ist.
; Falls sie nicht sichtbar ist, wird sie eingeblendet.
; Dann wird der Text in der Statusbar angezeigt.

Local $oIE = _IE_Example("basic")
If Not _IEPropertyGet($oIE, "statusbar") Then _IEPropertySet($oIE, "statusbar", True)
_IEPropertySet($oIE, "statustext", "Schau was ich machen kann")
Sleep(2000)
_IEPropertySet($oIE, "statustext", "Ich kann den Text in der Statusbar &auml;ndern")
