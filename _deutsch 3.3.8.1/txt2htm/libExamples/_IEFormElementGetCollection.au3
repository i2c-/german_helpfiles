; *******************************************************
; Beispiel 1 - Erh&auml;lt einen Bezug zu einem bestimmten Formelement durch einen 0-basierenden Index.
;				In diesem Fall wird eine Eingabe in der Google Suchmaschine get&auml;tigt
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.google.de")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 2)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
