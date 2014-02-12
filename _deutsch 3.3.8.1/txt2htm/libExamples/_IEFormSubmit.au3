; *******************************************************
; Beispiel 1 - &Ouml;ffnet einen Browser mit dem form-Beispiel; Formularfeld ausf&uuml;llen und absenden
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! Es funktioniert!")
_IEFormSubmit($oForm)

; *******************************************************
; Beispiel 2 - Eine Referenz auf ein bestimmtes Formularfeld erhalten und den Wert eingeben.
;				In diesem Fall wird eine Suche in der Suchmaschine von Google ausgef&uuml;hrt.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)

; *******************************************************
; Beispiel 3 - Eine Referenz auf ein bestimmtes Formularfeld erhalten und den Wert eingeben.
;				Ruft _IELoadWait manuell auf, falls die Default-_IELoadWait Probleme hat.
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.google.com")
$oForm = _IEFormGetObjByName($oIE, "f")
$oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm, 0)
_IELoadWait($oIE)
