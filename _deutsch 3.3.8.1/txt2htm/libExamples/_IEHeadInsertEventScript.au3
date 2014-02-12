; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript-Alarm ausl&ouml;st,
; wann immer auf das Dokument geklickt wird.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "onclick", "alert('Jemand hat auf das Dokument geklickt!');")

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm ausl&ouml;st,
; wann immer auf das Dokument ein Rechtsklick ausgef&uuml;hrt wird.
; In diesem Fall soll das Event-Script "False" zur&uuml;ckgeben, um zu verhindern, dass das Rechtsklick-Kontextmen&uuml; aufgerufen wird.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "oncontextmenu", "alert('Kein Kontextmen&uuml;');return false")

; *******************************************************
; Beispiel 3 - &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite,
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm ausl&ouml;st,
; wenn man die Seite verlassen will und die M&ouml;glichkeit des Abbruchs der Aktion anbietet.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "window", "onbeforeunload", _
		"alert('Beispiel-Warnung folgt...');return '&Auml;nderungen k&ouml;nnten verloren gehen!';")
_IENavigate($oIE, "www.autoit.de")

; *******************************************************
; Beispiel 4 - &Ouml;ffnet einen Browser mit der Grundlagen-Beispiel-Seite,
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches verhindert, dass
; das Text in dem Dokument markiert werden kann
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example()
_IEHeadInsertEventScript($oIE, "document", "ondrag", "return false;")
_IEHeadInsertEventScript($oIE, "document", "onselectstart", "return false;")

; *******************************************************
; Beispiel 5 - &Ouml;ffnet den Browser mit der AutoIt Homepage
; F&uuml;gt ein Event-Script in den Header des Dokuments ein, welches verhindert, dass
; ein angeklickter Link geladen wird und schreibt die URL des angeklickten Links in die Konsole
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkId = _IEPropertyGet($oLink, "uniqueid")
	_IEHeadInsertEventScript($oIE, $sLinkId, "onclick", "return false;")
	ObjEvent($oLink, "_Evt_")
Next

While 1
	Sleep(100)
WEnd

Func _Evt_onClick()
	Local $o_link = @COM_EventObj
	ConsoleWrite($o_link.href & @CRLF)
EndFunc   ;==>_Evt_onClick
