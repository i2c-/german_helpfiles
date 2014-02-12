; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem form-Beispiel und bekommt einen Objektbezug
;               zu dem Element mit dem Namen "ExampleForm". In diesem Fall ist das
;               Ergebnis identisch mit $oForm = _IEFormGetObjByName($oIE, "ExampleForm").
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEGetObjByName($oIE, "ExampleForm")
