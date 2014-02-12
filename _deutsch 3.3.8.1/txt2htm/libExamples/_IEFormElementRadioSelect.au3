; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; W&auml;hlt jeden Radiobutton byValue-Wert aus, w&auml;hlt dann, das letzte Item ab und l&auml;sst alles nicht ausgew&auml;hlt zur&uuml;ck.
; Es ist folgendes zu beachten: Es muss wahrscheinlich In der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementRadioSelect($oForm, "Flugzeug", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Zug", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Boot", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Auto", "Radio-Beispiel", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "Auto", "Radio-Beispiel", 0, "byValue")
	Sleep(1000)
Next

; *******************************************************
; Beispiel 2 - &Ouml;ffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form, ; w&auml;hlt jeden Radiobutton byIndex-Wert aus, w&auml;hlt dann, das letzte Item ab und l&auml;sst alles nicht ausgew&auml;hlt zur&uuml;ck.
; Es ist folgendes zu beachten: Es muss wahrscheinlich In der Seite runtergescrollt werden um die Ver&auml;nderungen zu sehen
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("Form")
$oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
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
