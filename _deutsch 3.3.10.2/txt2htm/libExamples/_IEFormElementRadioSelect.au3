#include <IE.au3>

; &Ouml;ffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; w&auml;hlt jeden Radiobutton byValue-Wert aus, w&auml;hlt dann, das letzte Item ab und l&auml;sst alles nicht ausgew&auml;hlt zur&uuml;ck.

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
_IEAction($oForm, "focus")
For $i = 1 To 3
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

_IEQuit($oIE)
