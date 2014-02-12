#include <IE.au3>

; Einf&uuml;gen von HTML in ein Dokument, am Anfang und Ende

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertHTML($oBody, "<h2><font color=red>Dieser HTML-Code ist eingef&uuml;gt am Anfang</font></h2>", "afterbegin")
_IEDocInsertHTML($oBody, "<h2><font color=red>Dieser HTML-Code ist eingef&uuml;gt am Ende</font></h2>", "beforeend")
