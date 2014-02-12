#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite,
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches verhindert, dass
; das Text in dem Dokument markiert werden kann

Local $oIE = _IE_Example()
_IEHeadInsertEventScript($oIE, "document", "ondrag", "return false;")
_IEHeadInsertEventScript($oIE, "document", "onselectstart", "return false;")
