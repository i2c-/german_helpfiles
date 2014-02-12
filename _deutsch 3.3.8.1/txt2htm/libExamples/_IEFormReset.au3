; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem Beipielformular, schreibt in ein Formularfeld und setzt das Formular zur&uuml;ck auf die Standardwerte.
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! It works!")
_IEFormReset($oForm)
