#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm ausl&ouml;st, wann immer auf das Dokument ein Rechtsklick ausgef&uuml;hrt wird.
; In diesem Fall soll das Event-Script "False" zur&uuml;ckgeben, um zu verhindern, dass das Rechtsklick-Kontextmen&uuml; aufgerufen wird.

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "oncontextmenu", "alert('Kein Kontextmen&uuml;');return false")
