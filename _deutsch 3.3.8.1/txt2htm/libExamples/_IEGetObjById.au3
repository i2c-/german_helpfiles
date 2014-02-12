; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem basic-Beispiel, eine Objektreferenz
;				zum DIV-Element mit der ID "line1" erstellen. Gibt den innerText
;				dieses Elements in der Konsole aus.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjById($oIE, "line1")
ConsoleWrite(_IEPropertyGet($oDiv, "innertext") & @CRLF)
