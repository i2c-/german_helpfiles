#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; w&auml;hlt jeden Radiobutton byIndex-Wert aus, w&auml;hlt dann, das letzte Item ab und l&auml;sst alles nicht ausgew&auml;hlt zur&uuml;ck.
; Es ist folgendes zu beachten: Es muss wahrscheinlich In der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 3
	_IEFormElementRadioSelect($oForm, 3, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 2, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 1, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "Radio-Beispiel", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "Radio-Beispiel", 0, "byIndex")
	Sleep(1000)
Next

_IEQuit($oIE)
