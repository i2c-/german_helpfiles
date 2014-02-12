#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript-Alarm ausl&ouml;st, wann immer auf das Dokument geklickt wird.

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "onclick", "alert('Jemand hat auf das Dokument geklickt!');")
