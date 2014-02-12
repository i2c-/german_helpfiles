#include <IE.au3>

; &Ouml;ffnet einen Browser mit dem Formular-Beispiel und &auml;ndert den Wert eines Textfeldes

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! Es funktioniert!")
