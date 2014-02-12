#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite,
; f&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm ausl&ouml;st,
; wenn man die Seite verlassen will und die M&ouml;glichkeit des Abbruchs der Aktion anbietet.

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "window", "onbeforeunload", _
		"alert('Beispiel-Warnung folgt...');return '&Auml;nderungen k&ouml;nnten verloren gehen!';")
_IENavigate($oIE, "www.autoit.de")
