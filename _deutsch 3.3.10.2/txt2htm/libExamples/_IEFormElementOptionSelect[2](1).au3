#include <IE.au3>

; &Ouml;ffnet einen Browser mit dem Formular Beispiel, stellt die Verbindung zu diesem Formular her,
; stellt die Verbindung zum gew&auml;hlten Mehrfach-Element her, w&auml;hlt das Element in einer 5fach Schleife an und ab; Optionen byValue, byText und byIndex.
; Folgendes ist zu beachten: M&ouml;glicherweise muss man bis ans Ende der Seite scrollen um die &Auml;nderung zu sehen.;

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oSelect = _IEFormElementGetObjByName($oForm, "multipleSelectExample")
_IEAction($oSelect, "focus")
For $i = 1 To 3
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

_IEQuit($oIE)
