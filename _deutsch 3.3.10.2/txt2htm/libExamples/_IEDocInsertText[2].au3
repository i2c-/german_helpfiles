#include <IE.au3>

; F&uuml;gt am Anfang und am Ende des Dokuments HTML-Text ein.

Local $oIE = _IE_Example("basic")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertText($oBody, "Dieser Text wird eingef&uuml;gt 'After Begin'", "afterbegin")
_IEDocInsertText($oBody, "Beachte, dass <b>Tags</b> <codiert> werden, bevor sie angezeigt werden!", "beforeend")
