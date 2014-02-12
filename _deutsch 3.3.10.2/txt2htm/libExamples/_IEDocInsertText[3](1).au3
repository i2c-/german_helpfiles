#include <IE.au3>

; Erweitertes Beispiel
; Fuegt eine Uhr und einen Herkunft-String im Kopfbereich ein. Diese bleiben auch beim Weiterbrowsen auf jeder Folgeseite erhalten.
; Benutzt _IEDocInsertText, _IEDocInsertHTML und
; _IEPropertySet Funktionen "innerhtml" und "referrer"

Global$oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister("UpdateClock", 1000) ; Uhren-Update einmal pro Sekunde

While 1
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	; wartet bis das Browser-Fenster existiert
	If Not WinExists(_IEPropertyGet($oIE, "hwnd")) Then Exit

	Local $curTime = "<font color=red><b>Aktuelle Zeit ist: </b>" & @HOUR & ":" & @MIN & ":" & @SEC& "</font>"
	; _IEGetObjById soll nach der Navigation einen "NoMatch"-Fehler zur&uuml;ckgeben
	;   (bevor DIV eingef&uuml;gt wird), deshalb wird die Benachrichtigung vor&uuml;bergehen abgeschaltet
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjById($oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; F&uuml;gt DIV-Element ein, falls es nicht gefunden wurde
		;
		; Holt Referenz zu BODY, f&uuml;gt DIV ein, holt Referenz zu DIV, aktualisiert die Zeit
		Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjById($oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime)
		;
		; &Uuml;berpr&uuml;ft den Herkunft-String. Ist dieser nicht leer, f&uuml;gt er ihn nach der Uhr ein
		_IELoadWait($oIE)
		Local $sReferrer = _IEPropertyGet($oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: <font color=red>" & $sReferrer & "</font>", "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime) ; Aktualisiert die Zeit
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock
