; *******************************************************
; Beispiel 1 - Einf&uuml;gen von HTML in ein Dokument, am Anfang und Ende
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertHTML($oBody, "<h2>Dieser HTML-Code ist eingef&uuml;gt am Anfang</h2>", "afterbegin")
_IEDocInsertHTML($oBody, "<h2>Dieser HTML-Code ist eingef&uuml;gt am Ende</h2>", "beforeend")

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit einer grundlegenden Beispielseite, f&uuml;gt HTML in
; Und um den DIV-Tag "IEAu3Data" ein und zeigt den BODY-Quellcode.
; *******************************************************

$oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjByName($oIE, "IEAu3Data")

_IEDocInsertHTML($oDiv, "<b>(HTML beforebegin)</b>", "beforebegin")
_IEDocInsertHTML($oDiv, "<i>(HTML afterbegin)</i>", "afterbegin")
_IEDocInsertHTML($oDiv, "<b>(HTML beforeend)</b>", "beforeend")
_IEDocInsertHTML($oDiv, "<i>(HTML afterend)</i>", "afterend")

ConsoleWrite(_IEBodyReadHTML($oIE) & @CRLF)

; *******************************************************
; Beispiel 3 - Erweitertes Beispiel
; Fuegt eine Uhr und einen Herkunft-String im Kopfbereich ein. Diese bleiben auch beim Weiterbrowsen auf jeder Folgeseite erhalten.
; Benutzt _IEDocInsertText, _IEDocInsertHTML und
; _IEPropertySet Funktionen "innerhtml" und "referrer"
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister("UpdateClock", 1000) ; Uhren-Update einmal pro Sekunde

; Im Leerlauf, solange das Browserfenster existiert
While WinExists(_IEPropertyGet($oIE, "hwnd"))
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	Local $curTime = "<b>Aktuelle Zeit ist: </b>" & @HOUR & ":" & @MIN & ":" & @SEC
	; _IEGetObjByName soll nach der Navigation einen "NoMatch"-Fehler zur&uuml;ckgeben
	;   (bevor DIV eingef&uuml;gt wird), deshalb wird die Benachrichtigung vor&uuml;bergehen abgeschaltet
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; F&uuml;gt DIV-Element ein, falls es nicht gefunden wurde
		;
		; Holt Referenz zu BODY, f&uuml;gt DIV ein, holt Referenz zu DIV, aktualisiert die Zeit
		Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime)
		;
		; &Uuml;berpr&uuml;ft den Herkunft-String. Ist dieser nicht leer, f&uuml;gt er ihn nach der Uhr ein
		_IELoadWait($oIE)
		Local $sReferrer = _IEPropertyGet($oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: " & $sReferrer, "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime) ; Aktualisiert die Zeit
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock
