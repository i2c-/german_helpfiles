; *******************************************************
; Beispiel 1 - &Ouml;ffnet eine Beispiel-Seite mit der Bezeichnung "basic" in einem Browser, f&uuml;gt Text
;               ein in und um den ersten "Paragraph tag" und zeigt den HTML Body-Text.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oP = _IETagNameGetCollection($oIE, "p", 0)

_IEDocInsertText($oP, "(Text beforebegin)", "beforebegin")
_IEDocInsertText($oP, "(Text afterbegin)", "afterbegin")
_IEDocInsertText($oP, "(Text beforeend)", "beforeend")
_IEDocInsertText($oP, "(Text afterend)", "afterend")

ConsoleWrite(_IEBodyReadHTML($oIE) & @CRLF)

; *******************************************************
; Beispiel 2 - F&uuml;gt am Anfang und am Ende des Dokuments HTML-Text ein.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertText($oBody, "Dieser Text wird eingef&uuml;gt 'After Begin'", "afterbegin")
_IEDocInsertText($oBody, "Beachte, dass <b>Tags</b> <codiert> werden, bevor sie angezeigt werden!", "beforeend")


; *******************************************************
; Beispiel 3 - Fortgeschrittenes Beispiel
;		F&uuml;gt eine Uhr und einen Herkunftstring oben auf jeder Seite ein, selbst wenn man
;		auf andere Seiten wechselt.  Nutzt die Funktionen _IEDocInsertText, _IEDocInsertHTML und
;		_IEPropertySet und stellt "innerhtml" und "referrer" dar.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister("UpdateClock", 1000) ; Aktualisiert die Uhr jede Sekunde

; Im Leerlauf, solange das Browserfenster existiert
While WinExists(_IEPropertyGet($oIE, "hwnd"))
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	Local $curTime = "<b>Aktuelle Zeit: </b>" & @HOUR & ":" & @MIN & ":" & @SEC
	; Es wird erwartet, dass _IEGetObjByName einen "NoMatch"-error (keinen Treffer) nach der Navigation
	;  (befor DIV eingef&uuml;gt ist) zur&uuml;ck gibt, also wird die Benachrichtigung tempor&auml;r ausgeschaltet.
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; F&uuml;gt DIV Element ein, wenn es nicht gefunden wurde
		;
		; Holt die Referenz zu BODY, f&uuml;gt DIV ein, holt die Referenz zu DIV, aktualisiert die Zeit
		Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime)
		;
		; &Uuml;berpr&uuml;ft Herkunft-String; wenn kein Leerstring, dann wird hinter der Uhr eingef&uuml;gt.
		_IELoadWait($oIE)
		Local $sReferrer = _IEPropertyGet($oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: " & $sReferrer, "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime) ; Aktualisiert Zeit
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock
