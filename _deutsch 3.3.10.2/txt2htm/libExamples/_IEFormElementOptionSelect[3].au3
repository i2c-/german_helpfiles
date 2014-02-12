#include <IE.au3>
#include <MsgBoxConstants.au3>

; &Ouml;ffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her, stellt die Verbindung zum gew&auml;hlten Element her, pr&uuml;ft ob die Option "Freepage" ausgew&auml;hlt ist und gibt das Ergebnis zur&uuml;ck.
; Wiederholung mit der Option von Index 0 und mit der Option vom Wert 'midipage.html'
; Folgendes ist zu beachten: M&ouml;glicherweise muss man bis ans Ende der Seite scrollen um die &Auml;nderung zu sehen.

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "selectExample")
If _IEFormElementOptionSelect($oSelect, "Freepage", -1, "byText") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Option Freepage ist ausgew&auml;hlt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Option Freepage ist nicht ausgew&auml;hlt")
EndIf
If _IEFormElementOptionSelect($oSelect, 0, -1, "byIndex") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Die erste Option (index 0) ist ausgew&auml;hlt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Die Erste Option (index 0) ist nicht ausgew&auml;hlt")
EndIf
If _IEFormElementOptionSelect($oSelect, "midipage.html", -1, "byValue") Then
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Die Option mit dem Wert 'midipage.html' ist ausgew&auml;hlt")
Else
	MsgBox($MB_SYSTEMMODAL, "Option ausgew&auml;hlt", "Die Option mit dem Wert 'midipage.html' ist nicht ausgew&auml;hlt")
EndIf

_IEQuit($oIE)
