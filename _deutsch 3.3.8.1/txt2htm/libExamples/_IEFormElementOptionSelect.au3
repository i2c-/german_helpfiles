; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gew&auml;hlten Element her, geht in einer 10er Schleife die Auswahl Optionen byValue-Wert, byText-Wert und byIndex-Wert durch
;				Es ist folgendes zu beachten: M&ouml;glicherweise muss man bis ans Ende der Seite scrollen, um die &Auml;nderung zu sehen.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
For $i = 1 To 10
	_IEFormElementOptionSelect($oSelect, "Freepage", 1, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "midipage.html", 1, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 0, 1, "byIndex")
	Sleep(1000)
Next

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gew&auml;hlten Mehrfach-Element her, w&auml;hlt das Element in einer 5fach Schleife an und ab;				Optionen byValue, byText und byIndex.
;				Folgendes ist zu beachten: M&ouml;glicherweise muss man bis ans Ende der Seite scrollen um die &Auml;nderung zu sehen.;
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oSelect = _IEFormElementGetObjByName($oForm, "multipleSelectExample")
For $i = 1 To 5
	_IEFormElementOptionSelect($oSelect, "Carlos", 1, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2", 1, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 1, "byIndex")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Carlos", 0, "byText")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, "Name2", 0, "byValue")
	Sleep(1000)
	_IEFormElementOptionSelect($oSelect, 5, 0, "byIndex")
	Sleep(1000)
Next

; *******************************************************
; Beispiel 3 - &Ouml;ffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gew&auml;hlten Element her, pr&uuml;ft ob die Option "Freepage" ausgew&auml;hlt ist und
;				gibt das Ergebnis zur&uuml;ck.  Wiederholung mit der Option von Index 0 und mit der Option vom Wert 'midipage.html'
;				Folgendes ist zu beachten: M&ouml;glicherweise muss man bis ans Ende der Seite scrollen um die &Auml;nderung zu sehen.
;  *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
$oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
If _IEFormElementOptionSelect($oSelect, "Freepage", -1, "byText") Then
	MsgBox(0, "Option ausgew&auml;hlt", "Option Freepage ist ausgew&auml;hlt")
Else
	MsgBox(0, "Option ausgew&auml;hlt", "Option Freepage ist nicht ausgew&auml;hlt")
EndIf
If _IEFormElementOptionSelect($oSelect, 0, -1, "byIndex") Then
	MsgBox(0, "Option ausgew&auml;hlt", "Die erste Option (index 0) ist ausgew&auml;hlt")
Else
	MsgBox(0, "Option ausgew&auml;hlt", "Die Erste Option (index 0) ist nicht ausgew&auml;hlt")
EndIf
If _IEFormElementOptionSelect($oSelect, "midipage.html", -1, "byValue") Then
	MsgBox(0, "Option ausgew&auml;hlt", "Die Option mit dem Wert 'midipage.html' ist ausgew&auml;hlt")
Else
	MsgBox(0, "Option ausgew&auml;hlt", "Die Option mit dem Wert 'midipage.html' ist nicht ausgew&auml;hlt")
EndIf
