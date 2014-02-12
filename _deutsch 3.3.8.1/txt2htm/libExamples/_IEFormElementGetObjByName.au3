; *******************************************************
; Beispiel 1 - Erh&auml;lt einen Bezug zu einem bestimmten Formelement durch den Namen
;				In diesem Fall wird eine Eingabe in der Google Suchmaschine get&auml;tigt
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.de")
Local $oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
